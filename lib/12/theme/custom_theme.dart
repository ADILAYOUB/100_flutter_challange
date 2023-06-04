import 'package:flutter/material.dart';
import '../theme/color.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    // this will return a dark theme data

    //This line gets the current theme from the context and assigns it to a variable called theme.
    final theme = Theme.of(context);

    return ThemeData(
        //this app is going to be in dartk mode
        brightness: Brightness.dark, //sets the app in dark mode.
        primarySwatch: MaterialColor(
          ColorPalette.red5.value, // color scheme fromSwatch
          const {
            100: ColorPalette.red1,
            200: ColorPalette.red2,
            300: ColorPalette.red3,
            400: ColorPalette.red4,
            500: ColorPalette.red5,
            600: ColorPalette.red6,
            700: ColorPalette.red7,
            800: ColorPalette.red8,
            900: ColorPalette.red9,
          },
        ),
        scaffoldBackgroundColor: ColorPalette.black,
        primaryColor: ColorPalette.red5,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: ColorPalette.black,
        ),
        sliderTheme: const SliderThemeData(
            activeTrackColor: ColorPalette.red5,
            inactiveTrackColor: ColorPalette.red3,
            thumbColor: ColorPalette.red2,
            valueIndicatorColor: ColorPalette.red6,
            inactiveTickMarkColor: Colors.amber,
            activeTickMarkColor: Colors.transparent),
        textTheme: theme.primaryTextTheme
            .copyWith(
                labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
            .apply(
              displayColor: Colors.white,
            ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          backgroundColor: ColorPalette.red5,
        )));
  }
}
