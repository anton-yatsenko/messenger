part of core_ui;

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get primaryBg;

  Color get white;

  Color get lightGrey;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColors {
  const LightColors();

  @override
  Color get primaryBg => Colors.indigo.shade100;

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  Color get black => Colors.black;

  Color get red => Colors.red;

  @override
  Color get lightGrey => Colors.grey;
}
