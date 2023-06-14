import 'package:Prismaa/main_tabbar.dart';
import 'package:Prismaa/screens/home_page/home2.dart';
import 'package:Prismaa/screens/home_page/widgets/localAuth.dart';
import 'package:Prismaa/screens/login/login.dart';
import 'package:Prismaa/screens/on_board/onboard.dart';
import 'package:Prismaa/services/localization_service.dart';
import 'package:Prismaa/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926), // iphone 13 pro max (926 * 428)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return OverlaySupport.global(
          child: GetMaterialApp(
            title: 'Prismaa',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.grey,

                textTheme: TextTheme(
                  bodyText1: Theme.of(context).textTheme.bodyText1!
                      .copyWith(fontSize: 16.sp, fontFamily: "IranSans"), // تیتر های اپ بار

                  bodyText2: Theme.of(context).textTheme.bodyText2!
                      .copyWith(fontSize: 13.sp, fontFamily: "IranSans"), // هینت تکست ها

                ),

                fontFamily: 'IranSans'
            ),

            translations: LocalizationService(),
            locale: const Locale('fa', 'FA'),
            fallbackLocale: const Locale('fa', 'FA'),

            // home: const MainTabBar(),

            // initialRoute: "/test_page",

            routes: {
              "/" : (context) => const  Onboard(),
              "/main_tab_bar" : (context) => const MainTabBar(),
              "/login" : (context) => const Login(),
              "/test_page" : (context) => ExampleApp(),
             "/localAuth" : (context) => const localAuth(),
              "/home_page" : (context) => const Home2(),

             },
          ),
        );
      },
    );
  }
}

