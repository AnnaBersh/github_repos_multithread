import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos_multithread/data/repos_repository.dart';
import 'package:github_repos_multithread/model/github_repo.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_cubit.dart';
import 'package:github_repos_multithread/ui/favorites/bloc/favorites_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ReposRepository>()])
import 'favorites_cubit_test.mocks.dart';

void main() {
  MockReposRepository mockReposRepository = MockReposRepository();
  GitHubRepo repo = GitHubRepo(id: 1, name: 'name', private: false, htmlUrl: 'htmlUrl');
  group('FavoritesCubit', () {
    setUpAll(() {
      GetIt.instance.registerSingleton<ReposRepository>(mockReposRepository);
    });

    blocTest<FavoritesCubit, FavoritesState>('emits [] when nothing is called',
        build: () => FavoritesCubit(), expect: () => [],
        );

    blocTest<FavoritesCubit, FavoritesState>(
      'LoadingFavoritesState is an initial state',
      build: () => FavoritesCubit(),
      verify: (FavoritesCubit cubit) {
        expect(cubit.state, isA<LoadingFavoritesState>());
      },
    );

    blocTest<FavoritesCubit, FavoritesState>(
        'emits [LoadingFavoritesState, LoadedFavoritesState] when loadData is called',
        setUp: () {
          when(mockReposRepository.getFavorites()).thenReturn([repo]);
        },
        build: () => FavoritesCubit(),
        act: (cubit) => cubit.loadData(),
        expect: () => [isA<LoadingFavoritesState>(), isA<LoadedFavoritesState>()],
        verify: (_) {
          verify(mockReposRepository.getFavorites());
        });

    blocTest<FavoritesCubit, FavoritesState>('emits [LoadedFavoritesState] when removeFromFavorites is called',
        setUp: () {
          when(mockReposRepository.getFavorites()).thenReturn([repo]);
        },
        build: () => FavoritesCubit(),
        act: (cubit) => cubit.removeFromFavorites(repo),
        expect: () => [isA<LoadedFavoritesState>()],
        verify: (_) {
          verifyInOrder([mockReposRepository.toggleFavorites(repo), mockReposRepository.getFavorites()]);
        });
  });
}
