import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/di/injection.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_bloc.dart';
import 'package:flutter_app_template/core/services/colors/presentation/bloc/color_state.dart';
import 'package:flutter_app_template/core/services/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FontSize {
  s8,
  s10,
  s12,
  s14,
  s16,
  s18,
  s20,
  s22,
  s24,
  s30,
}

enum AppColor {
  brandPrimary,
  brandSecondary,
  fontPrimary,
  fontDisable,
  fontPlaceholder,
  fontWhite,
  fontWhite100,
  fontWhite200,
  fontWhite300,
  fontWhite400,
  fontWhite500,
  fontWhite600,
  fontWhite700,
  fontWhite800,
  fontWhite900,
  fontBrandPrimary,
  fontBrandPrimary100,
  fontBrandPrimary200,
  fontBrandPrimary300,
  fontBrandPrimary400,
  fontBrandPrimary500,
  fontBrandPrimary600,
  fontBrandPrimary700,
  fontBrandPrimary800,
  fontBrandPrimary900,
  fontBrandSecondary,
  fontBrandSecondary100,
  fontBrandSecondary200,
  fontBrandSecondary300,
  fontBrandSecondary400,
  fontBrandSecondary500,
  fontBrandSecondary600,
  fontBrandSecondary700,
  fontBrandSecondary800,
  fontBrandSecondary900,
  surfaceBrandPrimary,
  surfaceBrandPrimary100,
  surfaceBrandPrimary200,
  surfaceBrandPrimary300,
  surfaceBrandPrimary400,
  surfaceBrandPrimary500,
  surfaceBrandPrimary600,
  surfaceBrandPrimary700,
  surfaceBrandPrimary800,
  surfaceBrandPrimary900,
  surfaceBrandSecondary,
  surfaceBrandSecondary100,
  surfaceBrandSecondary200,
  surfaceBrandSecondary300,
  surfaceBrandSecondary400,
  surfaceBrandSecondary500,
  surfaceBrandSecondary600,
  surfaceBrandSecondary700,
  surfaceBrandSecondary800,
  surfaceBrandSecondary900,
  surfaceBackground,
  surfaceLight,
  surfaceNeutral,
  surfaceWhite,
  surfaceWhite500,
  surfaceWhite600,
  surfaceWhite700,
  surfaceWhite800,
  surfaceDisable,
  surfaceDisable900,
  iconPrimary,
  iconSecondary,
  iconBrandPrimary,
  iconBrandSecondary,
  iconWhite,
  iconWhite100,
  iconWhite200,
  iconWhite300,
  iconWhite400,
  iconWhite500,
  iconWhite600,
  iconWhite700,
  iconWhite800,
  iconWhite900,
  iconDisable,
  borderNeutral,
  borderSecondary,
  borderBrandPrimary,
  borderBrandPrimary100,
  borderBrandPrimary200,
  borderBrandPrimary300,
  borderBrandPrimary400,
  borderBrandPrimary500,
  borderBrandPrimary600,
  borderBrandPrimary700,
  borderBrandPrimary800,
  borderBrandPrimary900,
  borderBrandSecondary,
  borderBrandSecondary100,
  borderBrandSecondary200,
  borderBrandSecondary300,
  borderBrandSecondary400,
  borderBrandSecondary500,
  borderBrandSecondary600,
  borderBrandSecondary700,
  borderBrandSecondary800,
  borderBrandSecondary900,
  borderWhite,
  borderDisable,
  statusSuccess,
  statusSuccess100,
  statusSuccess200,
  statusSuccess300,
  statusSuccess400,
  statusSuccess500,
  statusSuccess600,
  statusSuccess700,
  statusSuccess800,
  statusSuccess900,
  statusError,
  statusError100,
  statusError200,
  statusError300,
  statusError400,
  statusError500,
  statusError600,
  statusError700,
  statusError800,
  statusError900,
  statusWarning,
  statusWarning100,
  statusWarning200,
  statusWarning300,
  statusWarning400,
  statusWarning500,
  statusWarning600,
  statusWarning700,
  statusWarning800,
  statusWarning900,
  specialSuccess,
  shadowBlack100,
  shadowBlack200,
  shadowBlack300,
  shadowBlack400,
  shadowBlack500,
  shadowBlack600,
  shadowBlack700,
  shadowBlack800,
  shadowBlack900,
  brandPrimary100,
  brandPrimary200,
  brandPrimary300,
  brandPrimary400,
  brandPrimary500,
  brandPrimary600,
  brandPrimary700,
  brandPrimary800,
  brandPrimary900,
  brandSecondary100,
  brandSecondary200,
  brandSecondary300,
  brandSecondary400,
  brandSecondary500,
  brandSecondary600,
  brandSecondary700,
  brandSecondary800,
  brandSecondary900,
  fontPrimary100,
  fontPrimary200,
  fontPrimary300,
  fontPrimary400,
  fontPrimary500,
  fontPrimary600,
  fontPrimary700,
  fontPrimary800,
  fontPrimary900,
}

class FontConstants {
  static const fontFamily = 'Assistant';
  static final List<FontSize> nonResizableFonts = [
    FontSize.s8,
    FontSize.s10,
  ];
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
          case AppColor.brandPrimary:
            colorKey = 'brandPrimary';
          case AppColor.brandSecondary:
            colorKey = 'brandSecondary';
          case AppColor.fontPrimary:
            colorKey = 'fontPrimary';
          case AppColor.fontDisable:
            colorKey = 'fontDisable';
          case AppColor.fontPlaceholder:
            colorKey = 'fontPlaceholder';
            opacity = 0.3;
          case AppColor.fontWhite:
            colorKey = 'fontWhite';
          case AppColor.fontWhite100:
            colorKey = 'fontWhite';
            opacity = 0.1;
          case AppColor.fontWhite200:
            colorKey = 'fontWhite';
            opacity = 0.2;
          case AppColor.fontWhite300:
            colorKey = 'fontWhite';
            opacity = 0.3;
          case AppColor.fontWhite400:
            colorKey = 'fontWhite';
            opacity = 0.4;
          case AppColor.fontWhite500:
            colorKey = 'fontWhite';
            opacity = 0.5;
          case AppColor.fontWhite600:
            colorKey = 'fontWhite';
            opacity = 0.6;
          case AppColor.fontWhite700:
            colorKey = 'fontWhite';
            opacity = 0.7;
          case AppColor.fontWhite800:
            colorKey = 'fontWhite';
            opacity = 0.8;
          case AppColor.fontWhite900:
            colorKey = 'fontWhite';
            opacity = 0.9;
          case AppColor.fontBrandPrimary:
            colorKey = 'fontBrandPrimary';
          case AppColor.fontBrandPrimary100:
            colorKey = 'fontBrandPrimary';
            opacity = 0.1;
          case AppColor.fontBrandPrimary200:
            colorKey = 'fontBrandPrimary';
            opacity = 0.2;
          case AppColor.fontBrandPrimary300:
            colorKey = 'fontBrandPrimary';
            opacity = 0.3;
          case AppColor.fontBrandPrimary400:
            colorKey = 'fontBrandPrimary';
            opacity = 0.4;
          case AppColor.fontBrandPrimary500:
            colorKey = 'fontBrandPrimary';
            opacity = 0.5;
          case AppColor.fontBrandPrimary600:
            colorKey = 'fontBrandPrimary';
            opacity = 0.6;
          case AppColor.fontBrandPrimary700:
            colorKey = 'fontBrandPrimary';
            opacity = 0.7;
          case AppColor.fontBrandPrimary800:
            colorKey = 'fontBrandPrimary';
            opacity = 0.8;
          case AppColor.fontBrandPrimary900:
            colorKey = 'fontBrandPrimary';
            opacity = 0.9;
          case AppColor.fontBrandSecondary:
            colorKey = 'fontBrandSecondary';
          case AppColor.fontBrandSecondary100:
            colorKey = 'fontBrandSecondary';
            opacity = 0.1;
          case AppColor.fontBrandSecondary200:
            colorKey = 'fontBrandSecondary';
            opacity = 0.2;
          case AppColor.fontBrandSecondary300:
            colorKey = 'fontBrandSecondary';
            opacity = 0.3;
          case AppColor.fontBrandSecondary400:
            colorKey = 'fontBrandSecondary';
            opacity = 0.4;
          case AppColor.fontBrandSecondary500:
            colorKey = 'fontBrandSecondary';
            opacity = 0.5;
          case AppColor.fontBrandSecondary600:
            colorKey = 'fontBrandSecondary';
            opacity = 0.6;
          case AppColor.fontBrandSecondary700:
            colorKey = 'fontBrandSecondary';
            opacity = 0.7;
          case AppColor.fontBrandSecondary800:
            colorKey = 'fontBrandSecondary';
            opacity = 0.8;
          case AppColor.fontBrandSecondary900:
            colorKey = 'fontBrandSecondary';
            opacity = 0.9;
          case AppColor.surfaceBrandPrimary:
            colorKey = 'surfaceBrandPrimary';
          case AppColor.surfaceBrandPrimary100:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.1;
          case AppColor.surfaceBrandPrimary200:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.2;
          case AppColor.surfaceBrandPrimary300:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.3;
          case AppColor.surfaceBrandPrimary400:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.4;
          case AppColor.surfaceBrandPrimary500:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.5;
          case AppColor.surfaceBrandPrimary600:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.6;
          case AppColor.surfaceBrandPrimary700:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.7;
          case AppColor.surfaceBrandPrimary800:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.8;
          case AppColor.surfaceBrandPrimary900:
            colorKey = 'surfaceBrandPrimary';
            opacity = 0.9;
          case AppColor.surfaceBrandSecondary:
            colorKey = 'surfaceBrandSecondary';
          case AppColor.surfaceBrandSecondary100:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.1;
          case AppColor.surfaceBrandSecondary200:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.2;
          case AppColor.surfaceBrandSecondary300:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.3;
          case AppColor.surfaceBrandSecondary400:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.4;
          case AppColor.surfaceBrandSecondary500:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.5;
          case AppColor.surfaceBrandSecondary600:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.6;
          case AppColor.surfaceBrandSecondary700:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.7;
          case AppColor.surfaceBrandSecondary800:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.8;
          case AppColor.surfaceBrandSecondary900:
            colorKey = 'surfaceBrandSecondary';
            opacity = 0.9;
          case AppColor.surfaceBackground:
            colorKey = 'surfaceBackground';
          case AppColor.surfaceLight:
            colorKey = 'surfaceLight';
          case AppColor.surfaceNeutral:
            colorKey = 'surfaceNeutral';
          case AppColor.surfaceWhite:
            colorKey = 'surfaceWhite';
          case AppColor.surfaceWhite500:
            colorKey = 'surfaceWhite';
            opacity = 0.5;
          case AppColor.surfaceWhite600:
            colorKey = 'surfaceWhite';
            opacity = 0.6;
          case AppColor.surfaceWhite700:
            colorKey = 'surfaceWhite';
            opacity = 0.7;
          case AppColor.surfaceWhite800:
            colorKey = 'surfaceWhite';
            opacity = 0.8;
          case AppColor.surfaceDisable:
            colorKey = 'surfaceDisable';
          case AppColor.surfaceDisable900:
            colorKey = 'surfaceDisable';
            opacity = 0.9;
          case AppColor.iconPrimary:
            colorKey = 'iconPrimary';
          case AppColor.iconSecondary:
            colorKey = 'iconSecondary';
          case AppColor.iconBrandPrimary:
            colorKey = 'iconBrandPrimary';
          case AppColor.iconBrandSecondary:
            colorKey = 'iconBrandSecondary';
          case AppColor.iconWhite:
            colorKey = 'iconWhite';
          case AppColor.iconWhite100:
            colorKey = 'iconWhite';
            opacity = 0.1;
          case AppColor.iconWhite200:
            colorKey = 'iconWhite';
            opacity = 0.2;
          case AppColor.iconWhite300:
            colorKey = 'iconWhite';
            opacity = 0.3;
          case AppColor.iconWhite400:
            colorKey = 'iconWhite';
            opacity = 0.4;
          case AppColor.iconWhite500:
            colorKey = 'iconWhite';
            opacity = 0.5;
          case AppColor.iconWhite600:
            colorKey = 'iconWhite';
            opacity = 0.6;
          case AppColor.iconWhite700:
            colorKey = 'iconWhite';
            opacity = 0.7;
          case AppColor.iconWhite800:
            colorKey = 'iconWhite';
            opacity = 0.8;
          case AppColor.iconWhite900:
            colorKey = 'iconWhite';
            opacity = 0.9;
          case AppColor.iconDisable:
            colorKey = 'iconDisable';
          case AppColor.borderNeutral:
            colorKey = 'borderNeutral';
          case AppColor.borderSecondary:
            colorKey = 'borderSecondary';
          case AppColor.borderBrandPrimary:
            colorKey = 'borderBrandPrimary';
          case AppColor.borderBrandPrimary100:
            colorKey = 'borderBrandPrimary';
            opacity = 0.1;
          case AppColor.borderBrandPrimary200:
            colorKey = 'borderBrandPrimary';
            opacity = 0.2;
          case AppColor.borderBrandPrimary300:
            colorKey = 'borderBrandPrimary';
            opacity = 0.3;
          case AppColor.borderBrandPrimary400:
            colorKey = 'borderBrandPrimary';
            opacity = 0.4;
          case AppColor.borderBrandPrimary500:
            colorKey = 'borderBrandPrimary';
            opacity = 0.5;
          case AppColor.borderBrandPrimary600:
            colorKey = 'borderBrandPrimary';
            opacity = 0.6;
          case AppColor.borderBrandPrimary700:
            colorKey = 'borderBrandPrimary';
            opacity = 0.7;
          case AppColor.borderBrandPrimary800:
            colorKey = 'borderBrandPrimary';
            opacity = 0.8;
          case AppColor.borderBrandPrimary900:
            colorKey = 'borderBrandPrimary';
            opacity = 0.9;
          case AppColor.borderBrandSecondary:
            colorKey = 'borderBrandSecondary';
          case AppColor.borderBrandSecondary100:
            colorKey = 'borderBrandSecondary';
            opacity = 0.1;
          case AppColor.borderBrandSecondary200:
            colorKey = 'borderBrandSecondary';
            opacity = 0.2;
          case AppColor.borderBrandSecondary300:
            colorKey = 'borderBrandSecondary';
            opacity = 0.3;
          case AppColor.borderBrandSecondary400:
            colorKey = 'borderBrandSecondary';
            opacity = 0.4;
          case AppColor.borderBrandSecondary500:
            colorKey = 'borderBrandSecondary';
            opacity = 0.5;
          case AppColor.borderBrandSecondary600:
            colorKey = 'borderBrandSecondary';
            opacity = 0.6;
          case AppColor.borderBrandSecondary700:
            colorKey = 'borderBrandSecondary';
            opacity = 0.7;
          case AppColor.borderBrandSecondary800:
            colorKey = 'borderBrandSecondary';
            opacity = 0.8;
          case AppColor.borderBrandSecondary900:
            colorKey = 'borderBrandSecondary';
            opacity = 0.9;
          case AppColor.borderWhite:
            colorKey = 'borderWhite';
          case AppColor.borderDisable:
            colorKey = 'borderDisable';
          case AppColor.statusSuccess:
            colorKey = 'statusSuccess';
          case AppColor.statusSuccess100:
            colorKey = 'statusSuccess';
            opacity = 0.1;
          case AppColor.statusSuccess200:
            colorKey = 'statusSuccess';
            opacity = 0.2;
          case AppColor.statusSuccess300:
            colorKey = 'statusSuccess';
            opacity = 0.3;
          case AppColor.statusSuccess400:
            colorKey = 'statusSuccess';
            opacity = 0.4;
          case AppColor.statusSuccess500:
            colorKey = 'statusSuccess';
            opacity = 0.5;
          case AppColor.statusSuccess600:
            colorKey = 'statusSuccess';
            opacity = 0.6;
          case AppColor.statusSuccess700:
            colorKey = 'statusSuccess';
            opacity = 0.7;
          case AppColor.statusSuccess800:
            colorKey = 'statusSuccess';
            opacity = 0.8;
          case AppColor.statusSuccess900:
            colorKey = 'statusSuccess';
            opacity = 0.9;
          case AppColor.statusError:
            colorKey = 'statusError';
          case AppColor.statusError100:
            colorKey = 'statusError';
            opacity = 0.1;
          case AppColor.statusError200:
            colorKey = 'statusError';
            opacity = 0.2;
          case AppColor.statusError300:
            colorKey = 'statusError';
            opacity = 0.3;
          case AppColor.statusError400:
            colorKey = 'statusError';
            opacity = 0.4;
          case AppColor.statusError500:
            colorKey = 'statusError';
            opacity = 0.5;
          case AppColor.statusError600:
            colorKey = 'statusError';
            opacity = 0.6;
          case AppColor.statusError700:
            colorKey = 'statusError';
            opacity = 0.7;
          case AppColor.statusError800:
            colorKey = 'statusError';
            opacity = 0.8;
          case AppColor.statusError900:
            colorKey = 'statusError';
            opacity = 0.9;
          case AppColor.statusWarning:
            colorKey = 'statusWarning';
          case AppColor.statusWarning100:
            colorKey = 'statusWarning';
            opacity = 0.1;
          case AppColor.statusWarning200:
            colorKey = 'statusWarning';
            opacity = 0.2;
          case AppColor.statusWarning300:
            colorKey = 'statusWarning';
            opacity = 0.3;
          case AppColor.statusWarning400:
            colorKey = 'statusWarning';
            opacity = 0.4;
          case AppColor.statusWarning500:
            colorKey = 'statusWarning';
            opacity = 0.5;
          case AppColor.statusWarning600:
            colorKey = 'statusWarning';
            opacity = 0.6;
          case AppColor.statusWarning700:
            colorKey = 'statusWarning';
            opacity = 0.7;
          case AppColor.statusWarning800:
            colorKey = 'statusWarning';
            opacity = 0.8;
          case AppColor.statusWarning900:
            colorKey = 'statusWarning';
            opacity = 0.9;
          case AppColor.specialSuccess:
            colorKey = 'specialSuccess';
          case AppColor.shadowBlack100:
            colorKey = 'shadowBlack';
            opacity = 0.1;
          case AppColor.shadowBlack200:
            colorKey = 'shadowBlack';
            opacity = 0.2;
          case AppColor.shadowBlack300:
            colorKey = 'shadowBlack';
            opacity = 0.3;
          case AppColor.shadowBlack400:
            colorKey = 'shadowBlack';
            opacity = 0.4;
          case AppColor.shadowBlack500:
            colorKey = 'shadowBlack';
            opacity = 0.5;
          case AppColor.shadowBlack600:
            colorKey = 'shadowBlack';
            opacity = 0.6;
          case AppColor.shadowBlack700:
            colorKey = 'shadowBlack';
            opacity = 0.7;
          case AppColor.shadowBlack800:
            colorKey = 'shadowBlack';
            opacity = 0.8;
          case AppColor.shadowBlack900:
            colorKey = 'shadowBlack';
            opacity = 0.9;
          case AppColor.brandPrimary100:
            colorKey = 'brandPrimary';
            opacity = 0.1;
          case AppColor.brandPrimary200:
            colorKey = 'brandPrimary';
            opacity = 0.2;
          case AppColor.brandPrimary300:
            colorKey = 'brandPrimary';
            opacity = 0.3;
          case AppColor.brandPrimary400:
            colorKey = 'brandPrimary';
            opacity = 0.4;
          case AppColor.brandPrimary500:
            colorKey = 'brandPrimary';
            opacity = 0.5;
          case AppColor.brandPrimary600:
            colorKey = 'brandPrimary';
            opacity = 0.6;
          case AppColor.brandPrimary700:
            colorKey = 'brandPrimary';
            opacity = 0.7;
          case AppColor.brandPrimary800:
            colorKey = 'brandPrimary';
            opacity = 0.8;
          case AppColor.brandPrimary900:
            colorKey = 'brandPrimary';
            opacity = 0.9;
          case AppColor.brandSecondary100:
            colorKey = 'brandSecondary';
            opacity = 0.1;
          case AppColor.brandSecondary200:
            colorKey = 'brandSecondary';
            opacity = 0.2;
          case AppColor.brandSecondary300:
            colorKey = 'brandSecondary';
            opacity = 0.3;
          case AppColor.brandSecondary400:
            colorKey = 'brandSecondary';
            opacity = 0.4;
          case AppColor.brandSecondary500:
            colorKey = 'brandSecondary';
            opacity = 0.5;
          case AppColor.brandSecondary600:
            colorKey = 'brandSecondary';
            opacity = 0.6;
          case AppColor.brandSecondary700:
            colorKey = 'brandSecondary';
            opacity = 0.7;
          case AppColor.brandSecondary800:
            colorKey = 'brandSecondary';
            opacity = 0.8;
          case AppColor.brandSecondary900:
            colorKey = 'brandSecondary';
            opacity = 0.9;
          case AppColor.fontPrimary100:
            colorKey = 'fontPrimary';
            opacity = 0.1;
          case AppColor.fontPrimary200:
            colorKey = 'fontPrimary';
            opacity = 0.2;
          case AppColor.fontPrimary300:
            colorKey = 'fontPrimary';
            opacity = 0.3;
          case AppColor.fontPrimary400:
            colorKey = 'fontPrimary';
            opacity = 0.4;
          case AppColor.fontPrimary500:
            colorKey = 'fontPrimary';
            opacity = 0.5;
          case AppColor.fontPrimary600:
            colorKey = 'fontPrimary';
            opacity = 0.6;
          case AppColor.fontPrimary700:
            colorKey = 'fontPrimary';
            opacity = 0.7;
          case AppColor.fontPrimary800:
            colorKey = 'fontPrimary';
            opacity = 0.8;
          case AppColor.fontPrimary900:
            colorKey = 'fontPrimary';
            opacity = 0.9;
        }
        final colorData =
            colorState.colors.firstWhere((color) => color.key == colorKey);
        return Color(int.parse(
                    (themeState.themeMode == ThemeMode.dark
                            ? colorData.dark
                            : colorData.light)
                        .substring(1, 7),
                    radix: 16) +
                0xFF000000)
            .withValues(alpha: opacity);
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
