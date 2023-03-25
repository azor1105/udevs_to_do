import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_todo/data/local_data/local_data.dart';
import 'package:udevs_todo/presentation/router/router.dart';
import 'package:udevs_todo/presentation/utils/constants/local_data_keys.dart';
import 'package:udevs_todo/presentation/views/on_boarding/main_on_boarding_screen.dart';
import 'package:udevs_todo/presentation/views/tab/tab_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    bool? showOnBoarding = LocalData.getBool(
      key: LocalDataKeys.onBoardingShowed,
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.lightBlue,
            colorScheme:
                ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
          ),
          onUnknownRoute: AppRouter.onGenerateRoute,
          home: showOnBoarding == null
              ? const MainOnBoardingScreen()
              : const TabScreen(),
        );
      },
    );
  }
}
