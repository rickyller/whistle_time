import "package:flutter/material.dart";

class AppTheme {
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280248910),
      surfaceTint: Color(4280248910),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289262286),
      onPrimaryContainer: Color(4278198549),
      secondary: Color(4283261783),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291815897),
      onSecondaryContainer: Color(4278788118),
      tertiary: Color(4282213235),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290898171),
      onTertiaryContainer: Color(4278198057),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294310901),
      onBackground: Color(4279704858),
      surface: Color(4294310901),
      onSurface: Color(4279704858),
      surfaceVariant: Color(4292601309),
      onSurfaceVariant: Color(4282403139),
      outline: Color(4285561203),
      outlineVariant: Color(4290759106),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inverseOnSurface: Color(4293784300),
      inversePrimary: Color(4287485363),
      primaryFixed: Color(4289262286),
      onPrimaryFixed: Color(4278198549),
      primaryFixedDim: Color(4287485363),
      onPrimaryFixedVariant: Color(4278210873),
      secondaryFixed: Color(4291815897),
      onSecondaryFixed: Color(4278788118),
      secondaryFixedDim: Color(4289973438),
      onSecondaryFixedVariant: Color(4281682752),
      tertiaryFixed: Color(4290898171),
      onTertiaryFixed: Color(4278198057),
      tertiaryFixedDim: Color(4289055967),
      onTertiaryFixedVariant: Color(4280568923),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916143),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797662),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278209845),
      surfaceTint: Color(4280248910),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281958756),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281419580),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284643949),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280305751),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283726474),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294310901),
      onBackground: Color(4279704858),
      surface: Color(4294310901),
      onSurface: Color(4279704858),
      surfaceVariant: Color(4292601309),
      onSurfaceVariant: Color(4282139968),
      outline: Color(4283982171),
      outlineVariant: Color(4285824375),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inverseOnSurface: Color(4293784300),
      inversePrimary: Color(4287485363),
      primaryFixed: Color(4281958756),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280051788),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284643949),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283064661),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283726474),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282081649),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916143),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797662),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200346),
      surfaceTint: Color(4280248910),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209845),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279313949),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281419580),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199858),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280305751),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294310901),
      onBackground: Color(4279704858),
      surface: Color(4294310901),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292601309),
      onSurfaceVariant: Color(4280100385),
      outline: Color(4282139968),
      outlineVariant: Color(4282139968),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4289854679),
      primaryFixed: Color(4278209845),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203427),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281419580),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279972135),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280305751),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278333760),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916143),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797662),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4287485363),
      surfaceTint: Color(4287485363),
      onPrimary: Color(4278204454),
      primaryContainer: Color(4278210873),
      onPrimaryContainer: Color(4289262286),
      secondary: Color(4289973438),
      onSecondary: Color(4280235307),
      secondaryContainer: Color(4281682752),
      onSecondaryContainer: Color(4291815897),
      tertiary: Color(4289055967),
      onTertiary: Color(4278662468),
      tertiaryContainer: Color(4280568923),
      onTertiaryContainer: Color(4290898171),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279178514),
      onBackground: Color(4292797662),
      surface: Color(4279178514),
      onSurface: Color(4292797662),
      surfaceVariant: Color(4282403139),
      onSurfaceVariant: Color(4290759106),
      outline: Color(4287271820),
      outlineVariant: Color(4282403139),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797662),
      inverseOnSurface: Color(4281086510),
      inversePrimary: Color(4280248910),
      primaryFixed: Color(4289262286),
      onPrimaryFixed: Color(4278198549),
      primaryFixedDim: Color(4287485363),
      onPrimaryFixedVariant: Color(4278210873),
      secondaryFixed: Color(4291815897),
      onSecondaryFixed: Color(4278788118),
      secondaryFixedDim: Color(4289973438),
      onSecondaryFixedVariant: Color(4281682752),
      tertiaryFixed: Color(4290898171),
      onTertiaryFixed: Color(4278198057),
      tertiaryFixedDim: Color(4289055967),
      onTertiaryFixedVariant: Color(4280568923),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281678647),
      surfaceContainerLowest: Color(4278849292),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349682),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4287748791),
      surfaceTint: Color(4287485363),
      onPrimary: Color(4278197008),
      primaryContainer: Color(4283932287),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290302402),
      onSecondary: Color(4278524433),
      secondaryContainer: Color(4286486153),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289319395),
      onTertiary: Color(4278196514),
      tertiaryContainer: Color(4285568679),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279178514),
      onBackground: Color(4292797662),
      surface: Color(4279178514),
      onSurface: Color(4294442230),
      surfaceVariant: Color(4282403139),
      onSurfaceVariant: Color(4291087814),
      outline: Color(4288456094),
      outlineVariant: Color(4286350719),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797662),
      inverseOnSurface: Color(4280625960),
      inversePrimary: Color(4278211385),
      primaryFixed: Color(4289262286),
      onPrimaryFixed: Color(4278195468),
      primaryFixedDim: Color(4287485363),
      onPrimaryFixedVariant: Color(4278206251),
      secondaryFixed: Color(4291815897),
      onSecondaryFixed: Color(4278261004),
      secondaryFixedDim: Color(4289973438),
      onSecondaryFixedVariant: Color(4280630064),
      tertiaryFixed: Color(4290898171),
      onTertiaryFixed: Color(4278194971),
      tertiaryFixedDim: Color(4289055967),
      onTertiaryFixedVariant: Color(4279253834),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281678647),
      surfaceContainerLowest: Color(4278849292),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349682),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293853171),
      surfaceTint: Color(4287485363),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287748791),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293853171),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290302402),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294376447),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289319395),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279178514),
      onBackground: Color(4292797662),
      surface: Color(4279178514),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282403139),
      onSurfaceVariant: Color(4294245877),
      outline: Color(4291087814),
      outlineVariant: Color(4291087814),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797662),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202657),
      primaryFixed: Color(4289525458),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287748791),
      onPrimaryFixedVariant: Color(4278197008),
      secondaryFixed: Color(4292079069),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290302402),
      onSecondaryFixedVariant: Color(4278524433),
      tertiaryFixed: Color(4291292671),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289319395),
      onTertiaryFixedVariant: Color(4278196514),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281678647),
      surfaceContainerLowest: Color(4278849292),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349682),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
