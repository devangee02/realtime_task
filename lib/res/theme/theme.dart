import '../import/import.dart';

class realtimetaskhelper {
  realtimetaskhelper._();

  ///Light Theme
  static ThemeData lightTheme() {
    final base = ThemeData.light();
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: realtimetaskBackgroundColor,
      backgroundColor: realtimetaskBackgroundColor,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.orange,
      canvasColor: Colors.white,
      cardColor: Colors.white,
      dividerColor: Colors.grey,
      focusColor: Colors.blue,
      hoverColor: Colors.grey[200],
      errorColor: Colors.red,
      appBarTheme: AppBarTheme(
        color: realtimetaskPrimaryColor,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            fontSize: 16.0,
            color: realtimetaskTextColor,
            fontWeight: FontWeight.w500),
      ),
      iconTheme: const IconThemeData(
        color: realtimetaskBlack,
        size: 24.0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  ///Dark Theme (not needed for this test project)
  static ThemeData darkTheme() {
    final base = ThemeData.light();
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: realtimetaskDarkBackgroundColor,
      backgroundColor: realtimetaskDarkBackgroundColor,
      brightness: Brightness.dark,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: cardStrokeDarkColor,
      ),
      primaryColor: Colors.blue,
      accentColor: Colors.orange,
      canvasColor: Colors.black,
      cardColor: Colors.black,
      dividerColor: Colors.grey,
      focusColor: Colors.blue,
      hoverColor: Colors.grey[200],
      errorColor: Colors.red,
      appBarTheme: AppBarTheme(
        color: realtimetaskeDarkColor,
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            fontSize: 16.0,
            color: realtimetaskDarkTextColor,
            fontWeight: FontWeight.w500),
        headline3: TextStyle(
            fontSize: 16.0,
            color: realtimetaskDarkBuyColor,
            fontWeight: FontWeight.w500),
        bodyText1: TextStyle(
            fontSize: 12.0,
            color: realtimetaskDarkSecondaryTextColor,
            fontWeight: FontWeight.w500),
        bodyText2: TextStyle(
          fontSize: 14.0,
          color: realtimetaskDarkSecondaryTextColor,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: TextStyle(
          fontSize: 10.0,
          color: realtimetaskDarkSecondaryTextColor,
          fontWeight: FontWeight.w500,
        ),
        subtitle2: TextStyle(
          fontSize: 10.0,
          color: realtimetaskDarkBuyColor,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 10.0,
          color: realtimetaskDarkVoltColor,
          fontWeight: FontWeight.w500,
        ),
        headline5: TextStyle(
          fontSize: 12.0,
          color: realtimetaskDarkVoltColor,
          fontWeight: FontWeight.w500,
        ),
        headline6: TextStyle(
          fontSize: 12.0,
          color: realtimetaskDarkTextColor,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          fontSize: 12.0,
          color: realtimetaskDarkBuyColor,
          fontWeight: FontWeight.w500,
        ),
        button: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
      iconTheme: const IconThemeData(
        color: realtimetaskWhite,
        size: 24.0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
