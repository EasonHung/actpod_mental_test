import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/home_screen/home_screen.dart';
import 'package:actpod_mental_test/screens/question_screen/question_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/result_screen.dart';
import 'package:actpod_mental_test/screens/story_screen/story_screen.dart';
import 'package:go_router/go_router.dart';

final myRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/story',
      builder: (context, state) => StoryScreen(),
    ),
    GoRoute(
      path: '/question',
      builder: (context, state) => QuestionScreen(),
    ),
    GoRoute(
      path: '/result/:resultId',
      builder: (context, state) {
        String resultId = state.pathParameters['resultId'] ?? '';
        final result = resultRepository.getByResultId(resultId);
        return ResultScreen(
          result: result,
        );
      },
    ),
  ],
);
