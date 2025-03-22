import 'package:actpod_mental_test/main.dart';
import 'package:actpod_mental_test/screens/home_screen/home_screen.dart';
import 'package:actpod_mental_test/screens/question_screen/question_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/result_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/screens/immediate_editing_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/screens/mobile_recording_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/screens/noise_processing_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/screens/official_channel_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/screens/personal_music_library_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/screens/simple_layout_screen.dart';
import 'package:actpod_mental_test/screens/result_screen/screens/voice_interaction_screen.dart';
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
      path: '/result/immediate_editing',
      builder: (context, state) {
        return ImmediateEditingResultScreen();
      },
    ),
    GoRoute(
      path: '/result/mobile_recording',
      builder: (context, state) {
        return MobileRecordingResultScreen();
      },
    ),
    GoRoute(
      path: '/result/noise_processing',
      builder: (context, state) {
        return NoiseProcessingResultScreen();
      },
    ),
    GoRoute(
      path: '/result/official_channel',
      builder: (context, state) {
        return OfficialChannelResultScreen();
      },
    ),
    GoRoute(
      path: '/result/personal_music_library',
      builder: (context, state) {
        return PersonalMusicLibraryResultScreen();
      },
    ),
    GoRoute(
      path: '/result/simple_layout',
      builder: (context, state) {
        return SimpleLayoutResultScreen();
      },
    ),
    GoRoute(
      path: '/result/voice_interaction',
      builder: (context, state) {
        return VoiceInteractionResultScreen();
      },
    ),
  ],
);
