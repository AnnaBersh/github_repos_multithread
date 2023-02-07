import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos_multithread/constants/strings.dart';
import 'package:github_repos_multithread/data/repos_repository.dart';
import 'package:github_repos_multithread/main.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<ReposRepository>()])
import 'widget_test.mocks.dart';

void main() {
  MockReposRepository mockReposRepository = MockReposRepository();
  testWidgets('Search is visible smoke test', (WidgetTester tester) async {
    GetIt.instance.registerSingleton<ReposRepository>(mockReposRepository);
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text(Strings.searchQuery), findsOneWidget);
    expect(find.text(Strings.search), findsOneWidget);
  });
}
