import 'dart:ui';

class AppColors{
  AppColors._();


  static final AppColors instance = AppColors._();

  // Factory constructor to return the same instance
  factory AppColors() {
    return instance;
  }

   Color primaryColor = Color(0xffcfa769);
   Color secondryColor = Color(0x77cfa769);
   Color yellowcolor = Color(0xffF8B50F);
   Color darkblue = Color(0xff063584);
   Color whitColor = Color(0xffFFFFFF);
   Color black = Color(0xff1C1C1C);
   Color redcolor = Color(0xffFF1723);
   Color light_black = Color(0xc21c1c1c);
   Color gary = Color(0xffbababa);
   Color garytextcolor = Color(0xff898A8D);
   Color light_gray = Color(0x10D9D9D9);
   Color light_gray1 = Color(0x5EDFE7D2);
   Color light_gray2 = Color(0xffF5F5F5);
   Color light_gray3 = Color(0xedd5e7e7);
   Color graycolor = Color(0xff7C7C7C);
   Color graycolor1 = Color(0xffFAFAFA);
   Color graycolor2 = Color(0xffD1D1D1);
   Color graycolor3 = Color(0xffF5F5F5);


   Color borderColor = Color(0xFFEBEBEB);
   Color textlight = Color(0xFFACACAC);
   Color thingray = Color(0xFFB1B1B1);

  get lightprimary => const Color(0x62cfa769);


}