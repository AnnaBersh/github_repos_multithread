import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
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
        expect(cubit.state, isA<ReposStateInitial>());
      },
    );

    blocTest<ReposCubit, ReposState>(
        'emits [ReposStateLoading, ReposStateSuccess, ReposStateSuccess] when search is called',
        setUp: () {
          when(response1.reposList).thenReturn(reposList);
          when(response1.totalCount).thenReturn(1);
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(Right(response1)));
        },
        build: () => ReposCubit(),
        act: (cubit) async => await cubit.search(searchQuery),
        expect: () => [
              isA<ReposStateLoading>(),
              isA<ReposStateSuccess>()
                  .having((ReposStateSuccess state) => state.repos, 'repos', reposList)
                  .having((ReposStateSuccess state) => state.searchQuery, 'searchQuery', searchQuery),
              isA<ReposStateSuccess>()
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites()).called(2);
        });

    blocTest<ReposCubit, ReposState>(
        'emits [ReposStateLoading, ReposStateSuccess, ReposStateSuccess, ReposStateSuccess, ReposStateSuccess] when search is called twice',
        setUp: () {
          when(response1.reposList).thenReturn(reposList);
          when(response1.totalCount).thenReturn(1);
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(Right(response1)));
        },
        build: () => ReposCubit(),
        act: (cubit) async {
          await cubit.search(searchQuery);
          await cubit.search(searchQuery);
        },
        expect: () => [
              isA<ReposStateLoading>(),
              isA<ReposStateSuccess>()
                  .having((ReposStateSuccess state) => state.repos, 'repos', reposList)
                  .having((ReposStateSuccess state) => state.searchQuery, 'searchQuery', searchQuery),
              isA<ReposStateSuccess>(),
              isA<ReposStateSuccess>(),
              isA<ReposStateSuccess>()
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites()).called(4);
        });

    blocTest<ReposCubit, ReposState>('emits [ReposStateSuccess, ReposStateSuccess] when loadmore is called',
        setUp: () {
          when(response1.reposList).thenReturn(reposList);
          when(response1.totalCount).thenReturn(1);
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(Right(response1)));
        },
        seed: () =>
            ReposStateSuccess(searchQuery: searchQuery, repos: [], favoriteRepos: [], pageNumber: 1, totalCount: 1),
        build: () => ReposCubit(),
        act: (cubit) async => await cubit.loadMore(),
        expect: () => [
              isA<ReposStateSuccess>()
                  .having((ReposStateSuccess state) => state.repos, 'repos', reposList)
                  .having((ReposStateSuccess state) => state.searchQuery, 'searchQuery', searchQuery),
              isA<ReposStateSuccess>()
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites()).called(2);
        });

    blocTest<ReposCubit, ReposState>('emits [ReposStateLoading, ReposStateError, ReposStateError] when search fails',
        setUp: () {
          when(mockReposRepository.getReposList(searchQuery: anyNamed('searchQuery'), page: anyNamed('page')))
              .thenAnswer((_) => Future.value(const Left(error)));
        },
        build: () => ReposCubit(),
        act: (cubit) async => await cubit.search(searchQuery),
        expect: () => [
              isA<ReposStateLoading>(),
              isA<ReposStateError>()
                  .having((ReposStateError state) => state.errorMessage, 'errorMessage', error)
                  .having((ReposStateError state) => state.searchQuery, 'searchQuery', searchQuery)
            ]);

    blocTest<ReposCubit, ReposState>('emits [ReposStateSuccess] when updateFavorites is called',
        setUp: () {
          when(mockReposRepository.getFavorites()).thenReturn(reposList);
        },
        build: () => ReposCubit(),
        act: (cubit) => cubit.updateFavorites(),
        expect: () => [
              isA<ReposStateSuccess>()
                  .having((ReposStateSuccess state) => state.favoriteRepos, 'favoriteRepos', reposList),
            ],
        verify: (_) {
          verify(mockReposRepository.getFavorites());
          verifyNoMoreInteractions(mockReposRepository);
        });

    blocTest<ReposCubit, ReposState>('emits [ReposStateSuccess] when toggleFavorites is called',
        setUp: () {
          when(mockReposRepository.getFavorites()).thenReturn(reposList);
        },
        build: () => ReposCubit(),
        act: (cubit) => cubit.toggleFavorites(repo),
        expect: () => [
              isA<ReposStateSuccess>()
                  .having((ReposStateSuccess state) => state.favoriteRepos, 'favoriteRepos', reposList),
            ],
        verify: (_) {
          verify(mockReposRepository.toggleFavorites(repo));
          verify(mockReposRepository.getFavorites());
          verifyNoMoreInteractions(mockReposRepository);
        });

    blocTest<ReposCubit, ReposState>('emits [GoToFavoritesState] when goToFavorites is called',
        build: () => ReposCubit(),
        act: (cubit) => cubit.goToFavorites(),
        expect: () => [isA<ReposStateGoToFavorites>()],
        verify: (_) {
          verifyNoMoreInteractions(mockReposRepository);
        });
  });
}
