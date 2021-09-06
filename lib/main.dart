import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/responsive.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'constants.dart';
import 'page/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //取消debug图标
      title: '个人博客',
      defaultTransition: Transition.zoom,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        child = ResponsiveWrapper.builder(child,
            // maxWidth: 2000,
            minWidth: 350,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(mobileW, name: MOBILE),
              ResponsiveBreakpoint.autoScale(tabletW, name: TABLET),
              ResponsiveBreakpoint.resize(desktopW, name: DESKTOP),
              // ResponsiveBreakpoint.autoScale(bigPCW, name: '4K'),
            ],
            background: Container(color: Color(0xFFF5F5F5)));

        return child;
      },
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      // unknownRoute: GetPage(
      //   name: Routes.NOT_FOUND,
      //   page: () => NotFoundPage(),
      //   binding: NotFoundBinding(),
      // ),
      home: MainScreen(),
    );
  }
}
