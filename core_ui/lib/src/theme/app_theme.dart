part of core_ui;

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: _getAppBarTheme(),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue.shade900),
    ),
  ),
  scaffoldBackgroundColor: _lightColorScheme.background,
  textTheme: _textTheme,
  inputDecorationTheme: _inputDecorationTheme,
  primaryColor: _lightColorScheme.background,
  colorScheme: _lightColorScheme,
);

final _lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  background: Colors.blue.shade200,
  tertiary: Colors.blue.shade50,
  primaryContainer: Colors.white,
  //onPrimaryContainer:
);

final ThemeData darkTheme = lightTheme.copyWith(
  appBarTheme: _getAppBarTheme(),
);

TextTheme _textTheme = TextTheme(
  titleLarge: Typography.material2021().black.titleLarge,
  titleMedium: Typography.material2021().black.titleMedium,
  bodyLarge: Typography.material2021().black.bodyLarge,
  bodyMedium: Typography.material2021().black.bodyMedium,
  bodySmall: Typography.material2021().black.bodySmall,
  labelMedium: Typography.material2021().black.labelMedium,
).apply(
  bodyColor: Colors.black,
  displayColor: Colors.blueGrey,
  decorationColor: Colors.black,
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  hintStyle: Typography.material2021().black.bodyMedium,
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(AppDimens.borderRadius28),
    ),
    borderSide: BorderSide(color: _appColors.primaryBg, width: 1),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(AppDimens.borderRadius28),
    ),
    borderSide: BorderSide(color: _appColors.primaryBg, width: 10),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(AppDimens.borderRadius28),
    ),
    borderSide: BorderSide(
      color: _appColors.primaryBg,
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(AppDimens.borderRadius28),
    ),
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(AppDimens.borderRadius28),
    ),
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  ),
  labelStyle: AppFonts.normal13.copyWith(color: _appColors.primaryBg),
);

AppBarTheme _getAppBarTheme() {
  return AppBarTheme(
    color: Colors.transparent,
  );
}
