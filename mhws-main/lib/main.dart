import 'package:mhws/view/assessment/select_medication_view.dart';
import 'package:mhws/view/assessment/select_mood_view.dart';
import 'package:mhws/view/home/main_home_view.dart';
import 'package:mhws/view/utils/export_all.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fadeIn,
          theme: ThemeData(
            scaffoldBackgroundColor: G.primaryBackgroundColor,
            primaryColor: G.primaryColor,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: G.primaryColor,
              selectionHandleColor: G.primaryColor,
              selectionColor: G.primaryColor.withValues(
                alpha: 0.5,
              ),
            ),
          ),
          // home: MainHomeView(),
          home: SplashView(),
        );
      },
    );
  }
}
