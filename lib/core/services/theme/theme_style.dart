import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/di/injection.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_bloc.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_state.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FontSize { s8, s10, s12, s14, s16, s18, s20, s22, s24, s30 }

enum AppColor { sampleColor }

class FontConstants {
  static const fontFamily = 'Assistant';
  static final List<FontSize> nonResizableFonts = [FontSize.s8, FontSize.s10];
}

class AppPadding {
  static const double p2 = 2.0;
  static const double p4 = 4.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p32 = 32.0;
  static const double p120 = 120.0;
}

class AppSizes {
  static const double s0 = 0.0;
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s30 = 30.0;
  static const double s32 = 32.0;
  static const double s36 = 36.0;
  static const double s38 = 38.0;
  static const double s40 = 40.0;
  static const double s44 = 44.0;
  static const double s46 = 46.0;
  static const double s48 = 48.0;
  static const double s50 = 50.0;
  static const double s52 = 52.0;
  static const double s54 = 54.0;
  static const double s56 = 56.0;
  static const double s60 = 60.0;
  static const double s68 = 68.0;
  static const double s74 = 74.0;
  static const double s80 = 80.0;
  static const double s82 = 82.0;
  static const double s88 = 88.0;
  static const double s100 = 100.0;
  static const double s104 = 104.0;
  static const double s106 = 106.0;
  static const double s118 = 118.0;
  static const double s120 = 120.0;
  static const double s126 = 126.0;
  static const double s134 = 134.0;
  static const double s140 = 140.0;
  static const double s144 = 144.0;
  static const double s154 = 154.0;
  static const double s160 = 160.0;
  static const double s178 = 178.0;
  static const double s210 = 210.0;
  static const double s234 = 234.0;
  static const double s236 = 236.0;
  static const double s245 = 245.0;
  static const double s280 = 280.0;
  static const double s284 = 284.0;
}

class AppSpace {
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s34 = 34.0;
  static const double s42 = 42.0;
}

class AppBorder {
  static const double thin = 0.5;
  static const double normal = 1;
  static const double medium = 1.5;
  static const double large = 2.0;
  static const double thick = 3.0;
  static const double xlarge = 4.0;
}

class AppRadius {
  static const double r0 = 0.0;
  static const double r4 = 4.0;
  static const double r8 = 8.0;
  static const double r10 = 10.0;
  static const double r12 = 12.0;
  static const double r16 = 16.0;
  static const double r20 = 20.0;
  static const double r24 = 24.0;
  static const double r26 = 26.0;
  static const double r30 = 30.0;
  static const double r32 = 32.0;
  static const double r40 = 40.0;
  static const double r60 = 60.0;
}

extension ThemeStyleExtension on BuildContext {
  Color getColor(AppColor color) {
    final colorState = sl<ColorBloc>().state;
    final themeState = sl<ThemeBloc>().state;
    double opacity = 1;
    if ((colorState is ColorLoaded) && (themeState.error == null)) {
      try {
        final String colorKey;
        switch (color) {
          case AppColor.sampleColor:
            colorKey = 'sampleColor';
        }
        final colorData = colorState.colors.firstWhere(
          (color) => color.key == colorKey,
        );
        return Color(
          int.parse(
                (themeState.themeMode == ThemeMode.dark
                        ? colorData.dark
                        : colorData.light)
                    .substring(1, 7),
                radix: 16,
              ) +
              0xFF000000,
        ).withValues(alpha: opacity);
      } catch (e) {
        return Colors.grey;
      }
    }
    return Colors.grey;
  }

  TextStyle textStyle({
    required FontSize size,
    required Color color,
    FontWeight weight = FontWeight.w400,
    bool isScalable = true,
    bool underline = false,
    double? height,
    double? letterSpacing,
  }) {
    final baseSize = _getFontSize(size);
    double scale = 0;
    if (!_isNonResizableFont(size)) {
      scale = isScalable ? _getFontScale(this) : 0;
    }
    return TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: baseSize + scale,
      fontWeight: weight,
      fontStyle: FontStyle.normal,
      color: color,
      decoration: underline ? TextDecoration.underline : null,
      decorationColor: underline ? color : null,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  double _getFontSize(FontSize size) {
    switch (size) {
      case FontSize.s8:
        return 8.0;
      case FontSize.s10:
        return 10.0;
      case FontSize.s12:
        return 12.0;
      case FontSize.s14:
        return 14.0;
      case FontSize.s16:
        return 16.0;
      case FontSize.s18:
        return 18.0;
      case FontSize.s20:
        return 20.0;
      case FontSize.s22:
        return 22.0;
      case FontSize.s24:
        return 24.0;
      case FontSize.s30:
        return 30.0;
    }
  }

  bool _isNonResizableFont(FontSize size) {
    return FontConstants.nonResizableFonts.contains(size);
  }
}

enum FontScale { small, medium, large, xlarge }

extension FontScaleExtension on FontScale {
  double get scaleValue {
    switch (this) {
      case FontScale.small:
        return 0.0;
      case FontScale.medium:
        return 1.0;
      case FontScale.large:
        return 2.0;
      case FontScale.xlarge:
        return 3.0;
    }
  }

  static FontScale fromValue(String value) {
    return FontScale.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => FontScale.small,
    );
  }

  static int toIndex(FontScale scale) => FontScale.values.indexOf(scale);
}

double _getFontScale(BuildContext context) {
  final state = context.read<ThemeBloc>().state;
  if (state.error == null) {
    return state.fontScale.scaleValue;
  }
  return FontScale.small.scaleValue;
}
