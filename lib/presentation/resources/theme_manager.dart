import 'package:flut_all_content/presentation/resources/color_manager.dart';
import 'package:flut_all_content/presentation/resources/font_manager.dart';
import 'package:flut_all_content/presentation/resources/styles_manager.dart';
import 'package:flut_all_content/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    //Card view theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    //App bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16,
        )),
    //Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManager.white),
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12))),
    ),
    //text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headline2:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      headline3:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      headline4:
          getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      subtitle1:
          getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      subtitle2:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey),
      bodyText2: getRegularStyle(color: ColorManager.grey1),
    ),

    //input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      //label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      //error style
      errorStyle: getRegularStyle(color: ColorManager.error),
      //enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focused border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
