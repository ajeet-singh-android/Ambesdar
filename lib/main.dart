import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sbmela/res/route/routes.dart';
import 'package:sbmela/utils/prefrence.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.instance.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,// status bar color
  ));
  Future.delayed(const Duration(seconds: 1), () {

    runApp(const MyApp());

  });

}



var rheight = Get.height;
var rwidth = Get.width;
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


void hideKeyboard(){
  FocusManager.instance.primaryFocus?.unfocus();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      title: 'Rental',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),

      getPages: Routes.appRoutes(),
      builder: (context,child){
        return _unFocusWrapper(child);
      },
    );
  }


  Widget _unFocusWrapper(Widget? child){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}


