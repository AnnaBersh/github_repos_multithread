import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos_multithread/data/repos_repository.dart';
import 'package:github_repos_multithread/model/api/repos_list_response.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_cubit.dart';
import 'package:github_repos_multithread/ui/repos_list/bloc/repos_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<ReposRepository>(),
  MockSpec<ReposListResponse>(),
])
import 'repos_list_cubit_test.mocks.dart';

void main() {
  MockReposRepository mockReposRepository = MockReposRepository();
  GitHubRepo repo = GitHubRepo(id: 1, name: 'name', private: false, htmlUrl: 'htmlUrl');
  List<GitHubRepo> reposList = [repo];
  const String searchQuery = 'TestSearchQuery';
  const String error = 'error';
  MockReposListResponse response1 = MockReposListResponse();
  group('ReposCubit', () {
    setUpAll(() {
      GetIt.instance.registerSingleton<ReposRepository>(mockReposRepository);
    });

    blocTest<ReposCubit, ReposState>(
      'emits [] when nothing is called',
      build: () => ReposCubit(),
      expect: () => [],
    );

    blocTest<ReposCubit, ReposState>(
      'ReposInitialState is an initial state',
      build: () => ReposCubit(),
      verify: (ReposCubit cubit) {
        expect(cubit.state, isA<ReposInitialState>());
      },
    );

    blocTest<ReposCubit, ReposState>(
        'emits [ReposLoadingState, ReposSuccessState, ReposSuccessState] when search is called',
        setUp: () {
          when(response1.reposList).thenReturn(reposList);
          when(response1.isSuccess).thenReturn(true);
          when(response1.totalCount).thenReturn(1);
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(response1));
        },
        build: () => ReposCubit(),
        act: (cubit) async => await cubit.search(searchQuery),
        expect: () => [
              isA<ReposLoadingState>(),
              isA<ReposSuccessState>()
                  .having((ReposSuccessState state) => state.repos, 'repos', reposList)
                  .having((ReposSuccessState state) => state.searchQuery, 'searchQuery', searchQuery),
              isA<ReposSuccessState>()
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites()).called(2);
        });

    blocTest<ReposCubit, ReposState>(
        'emits [ReposLoadingState, ReposSuccessState, ReposSuccessState, ReposSuccessState, ReposSuccessState] when search is called twice',
        setUp: () {
          when(response1.reposList).thenReturn(reposList);
          when(response1.isSuccess).thenReturn(true);
          when(response1.totalCount).thenReturn(1);
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(response1));
        },
        build: () => ReposCubit(),
        act: (cubit) async {
          await cubit.search(searchQuery);
          await cubit.search(searchQuery);
        },
        expect: () => [
              isA<ReposLoadingState>(),
              isA<ReposSuccessState>()
                  .having((ReposSuccessState state) => state.repos, 'repos', reposList)
                  .having((ReposSuccessState state) => state.searchQuery, 'searchQuery', searchQuery),
              isA<ReposSuccessState>(),
              isA<ReposSuccessState>(),
              isA<ReposSuccessState>()
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites()).called(4);
        });

    blocTest<ReposCubit, ReposState>('emits [ReposSuccessState, ReposSuccessState] when loadmore is called',
        setUp: () {
          when(response1.reposList).thenReturn(reposList);
          when(response1.isSuccess).thenReturn(true);
          when(response1.totalCount).thenReturn(1);
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(response1));
        },
        seed: () =>
            ReposSuccessState(searchQuery: searchQuery, repos: [], favoriteRepos: [], pageNumber: 1, totalCount: 1),
        build: () => ReposCubit(),
        act: (cubit) async => await cubit.loadMore(),
        expect: () => [
              isA<ReposSuccessState>()
                  .having((ReposSuccessState state) => state.repos, 'repos', reposList)
                  .having((ReposSuccessState state) => state.searchQuery, 'searchQuery', searchQuery),
              isA<ReposSuccessState>()
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites()).called(2);
        });

    blocTest<ReposCubit, ReposState>('emits [ReposLoadingState, ReposErrorState, ReposErrorState] when search fails',
        setUp: () {
          when(response1.isSuccess).thenReturn(false);
          when(response1.error).thenReturn(error);
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(response1));
        },
        build: () => ReposCubit(),
        act: (cubit) async => await cubit.search(searchQuery),
        expect: () => [
              isA<ReposLoadingState>(),
              isA<ReposErrorState>()
                  .having((ReposErrorState state) => state.errorMessage, 'errorMessage', error)
                  .having((ReposErrorState state) => state.searchQuery, 'searchQuery', searchQuery),
              isA<ReposErrorState>()
            ]);

    blocTest<ReposCubit, ReposState>('emits [ReposSuccessState] when updateFavorites is called',
        setUp: () {
          when(mockReposRepository.getFavorites()).thenReturn(reposList);
        },
        build: () => ReposCubit(),
        act: (cubit) => cubit.updateFavorites(),
        expect: () => [
              isA<ReposSuccessState>()
                  .having((ReposSuccessState state) => state.favoriteRepos, 'favoriteRepos', reposList),
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites());
          verifyNoMoreInteractions(mockReposRepository);
        });

    blocTest<ReposCubit, ReposState>('emits [ReposSuccessState] when toggleFavorites is called',
        setUp: () {
          when(mockReposRepository.getFavorites()).thenReturn(reposList);
        },
        build: () => ReposCubit(),
        act: (cubit) => cubit.toggleFavorites(repo),
        expect: () => [
              isA<ReposSuccessState>()
                  .having((ReposSuccessState state) => state.favoriteRepos, 'favoriteRepos', reposList),
            ],
        verify: (_) {
          verify(mockReposRepository.toggleFavorites(repo));
          verify(mockReposRepository.getFavorites());
          verifyNoMoreInteractions(mockReposRepository);
        });

    blocTest<ReposCubit, ReposState>('emits [GoToFavoritesState] when goToFavorites is called',
        build: () => ReposCubit(),
        act: (cubit) => cubit.goToFavorites(),
        expect: () => [isA<GoToFavoritesState>()],
        verify: (_) {
          verifyNoMoreInteractions(mockReposRepository);
        });
  });
}
