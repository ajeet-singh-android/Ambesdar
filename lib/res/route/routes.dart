
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sbmela/res/route/route_name.dart';
import 'package:sbmela/res/screens/congratulation/congratulation_screen.dart';
import 'package:sbmela/res/screens/dashboard/dashboard_screen.dart';
import 'package:sbmela/res/screens/gravitydrive/gravitydrive_screen.dart';
import 'package:sbmela/res/screens/pic_upload_screen/pic_upload_screen.dart';
import 'package:sbmela/res/screens/pickup_drop/pickup_drop_location_screen.dart';
import 'package:sbmela/res/screens/profile/profile_screen.dart';
import 'package:sbmela/res/screens/selfiscreen/selfi_screen.dart';
import 'package:sbmela/res/screens/tracking/track_screen.dart';

import '../screens/login/login_screen.dart';
import '../screens/otp/otp_screen.dart';
import '../screens/splash/splash_screen.dart';




class Routes{
  static appRoutes() => [
    GetPage(name: RouteName.splash_screen, page: () =>   const SplashScreen(),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.gravityDriveScreen, page: () =>   const GravitydriveScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.login_screen, page: () =>   const LoginScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.otpScreen, page: () =>   const OTPScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.selfiScreen, page: () =>   const SelfiScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.dashboard_screen, page: () =>   const DashboardScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.pickupDropLocationScreen, page: () =>   const PickupDropLocationScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.picUploadScreen, page: () =>   const PicUploadScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),

    GetPage(name: RouteName.trackScreen, page: () =>   const TrackScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.profileScreen, page: () =>   const ProfileScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
    GetPage(name: RouteName.congratulationScreen, page: () =>   const CongratulationScreen(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.rightToLeft
    ),
  ];
  }