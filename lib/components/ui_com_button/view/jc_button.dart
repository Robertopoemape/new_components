import 'package:flutter/material.dart';
import 'package:jc_module/components/ui_com_button/view/widgets/jc_button_buy.dart';
import 'package:jc_module/components/ui_com_button/view/widgets/jc_button_outlined.dart';
import 'package:jc_module/components/ui_com_button/view/widgets/jc_button_primary.dart';
import 'package:jc_module/components/ui_com_button/view/widgets/jc_button_secondary.dart';
import 'package:jc_module/components/ui_com_button/view/widgets/jc_button_text_primary.dart';
import 'package:jc_module/components/ui_com_button/view/widgets/jc_button_text_secondary.dart';
import 'package:jc_module/jc_module.dart';

enum StyleButton {
  primary,
  secondary,
  buy,
  outline,
  textPrimary,
  textSecondary,
}

enum ThemeButton {
  light,
  dark,
}

enum ButtonState {
  enabled,
  hovered,
  pressed,
  focused,
  disabled,
  loading,
}

enum SizeStyleButton {
  verySmall,
  small,
  medium,
  large,
}

Color lightpriEnabledColor = JcColors.pri600;
Color lightpriHoveredColor = JcColors.pri600;
Color lightpriPressedColor = JcColors.pri700;
Color lightpriFocusedColor = JcColors.pri600;
Color lightpriDisabledColor = JcColors.gs200;
Color lightpriLoadingColor = JcColors.pri600;
Color lightpriBorderColor = JcColors.pri600;
Color lightpriNameStyleColor = JcColors.sec600;

Color lightsecEnabledColor = JcColors.pri200;
Color lightsecHoveredColor = JcColors.pri400;
Color lightsecPressedColor = JcColors.pri600;
Color lightsecFocusedColor = JcColors.pri200;
Color lightsecDisabledColor = JcColors.gs200;
Color lightsecLoadingColor = JcColors.pri200;
Color lightsecBorderColor = JcColors.pri400;
Color lightsecNameStyleColor = JcColors.sec600;

Color lightTertiaryEnabledColor = JcColors.act600;
Color lightTertiaryHoveredColor = JcColors.act600;
Color lightTertiaryPressedColor = JcColors.act700;
Color lightTertiaryFocusedColor = JcColors.act600;
Color lightTertiaryDisabledColor = JcColors.gs200;
Color lightTertiaryLoadingColor = JcColors.act600;
Color lightTertiaryBorderColor = JcColors.act600;
Color lightTertiaryNameStyleColor = JcColors.gsWhite;

Color lightOutlineEnabledColor = JcColors.gsWhite;
Color lightOutlineHoveredColor = JcColors.sec200;
Color lightOutlinePressedColor = JcColors.sec400;
Color lightOutlineFocusedColor = JcColors.gsWhite;
Color lightOutlineDisabledColor = JcColors.gsWhite;
Color lightOutlineBorderDisabledColor = JcColors.gs600;
Color lightOutlineLoadingColor = JcColors.gsWhite;
Color lightOutlineBorderColor = JcColors.sec500;
Color lightOutlineNameStyleColor = JcColors.sec600;

Color lightTextpriEnabledColor = JcColors.gsWhite;
Color lightTextpriHoveredColor = JcColors.sec200;
Color lightTextpriPressedColor = JcColors.sec400;
Color lightTextpriFocusedColor = JcColors.pri300;
Color lightTextpriDisabledColor = JcColors.gsWhite;
Color lightTextpriBorderDisabledColor = JcColors.gs600;
Color lightTextpriLoadingColor = JcColors.gsWhite;
Color lightTextpriBorderColor = JcColors.sec500;
Color lightTextpriNameStyleColor = JcColors.sec500;
Color lightTextsecNameStyleColor = JcColors.pri700;

Color darkpriEnabledColor = JcColors.pri600;
Color darkpriHoveredColor = JcColors.pri600;
Color darkpriPressedColor = JcColors.pri700;
Color darkpriFocusedColor = JcColors.pri600;
Color darkpriDisabledColor = JcColors.sec500;
Color darkpriLoadingColor = JcColors.pri600;
Color darkpriBorderColor = JcColors.pri600;
Color darkpriNameStyleColor = JcColors.sec600;

Color darksecEnabledColor = JcColors.pri200;
Color darksecHoveredColor = JcColors.pri400;
Color darksecPressedColor = JcColors.pri600;
Color darksecFocusedColor = JcColors.pri200;
Color darksecDisabledColor = JcColors.sec500;
Color darksecLoadingColor = JcColors.pri200;
Color darksecBorderColor = JcColors.pri400;
Color darksecNameStyleColor = JcColors.sec600;

Color darkTertiaryEnabledColor = JcColors.act600;
Color darkTertiaryHoveredColor = JcColors.act600;
Color darkTertiaryPressedColor = JcColors.act700;
Color darkTertiaryFocusedColor = JcColors.act600;
Color darkTertiaryDisabledColor = JcColors.sec500;
Color darkTertiaryLoadingColor = JcColors.act600;
Color darkTertiaryBorderColor = JcColors.act600;
Color darkTertiaryNameStyleColor = JcColors.gsWhite;

Color darkOutlineEnabledColor = JcColors.gsWhite;
Color darkOutlineHoveredColor = JcColors.sec200;
Color darkOutlinePressedColor = JcColors.sec400;
Color darkOutlineFocusedColor = JcColors.gsWhite;
Color darkOutlineDisabledColor = JcColors.gsWhite;
Color darkOutlineBorderDisabledColor = JcColors.gs600;
Color darkOutlineLoadingColor = JcColors.gsWhite;
Color darkOutlineBorderColor = JcColors.sec400;
Color darkOutlineNameStyleColor = JcColors.gsWhite;

Color darkTextpriEnabledColor = JcColors.gsWhite;
Color darkTextpriHoveredColor = JcColors.sec200;
Color darkTextpriPressedColor = JcColors.sec400;
Color darkTextpriFocusedColor = JcColors.pri300;
Color darkTextpriDisabledColor = Colors.transparent;
Color darkTextpriBorderDisabledColor = JcColors.gs600;
Color darkTextpriLoadingColor = JcColors.gsWhite;
Color darkTextpriBorderColor = JcColors.sec500;
Color darkTextpriNameStyleColor = JcColors.gsWhite;
Color darkTextsecNameStyleColor = JcColors.gsWhite;

ButtonStyle getButtonStyle(
  ThemeButton themeButton,
  ButtonState status,
  StyleButton styleButton,
  Function()? onPressed,
) {
  Color backgroundColor;
  const foregroundColor = Colors.black;
  var elevation = 0.0;
  var state = status;
  BorderSide borderSide;

  Color enabledColor;
  Color hoveredColor;
  Color pressedColor;
  Color focusedColor;
  Color disabledColor;
  Color loadingColor;
  Color borderColor;
  Color nameStyleColor;
  if (onPressed == null) {
    state = ButtonState.disabled;
  }

  if (themeButton == ThemeButton.light) {
    switch (styleButton) {
      case StyleButton.primary:
        enabledColor = lightpriEnabledColor;
        hoveredColor = lightpriHoveredColor;
        pressedColor = lightpriPressedColor;
        focusedColor = lightpriFocusedColor;
        disabledColor = lightpriDisabledColor;
        loadingColor = lightpriLoadingColor;
        borderColor = lightpriBorderColor;
        nameStyleColor = lightpriNameStyleColor;
      case StyleButton.secondary:
        enabledColor = lightsecEnabledColor;
        hoveredColor = lightsecHoveredColor;
        pressedColor = lightsecPressedColor;
        focusedColor = lightsecFocusedColor;
        disabledColor = lightsecDisabledColor;
        loadingColor = lightsecLoadingColor;
        borderColor = lightsecBorderColor;
        nameStyleColor = lightsecNameStyleColor;
      case StyleButton.buy:
        enabledColor = lightTertiaryEnabledColor;
        hoveredColor = lightTertiaryHoveredColor;
        pressedColor = lightTertiaryPressedColor;
        focusedColor = lightTertiaryFocusedColor;
        disabledColor = lightTertiaryDisabledColor;
        loadingColor = lightTertiaryLoadingColor;
        borderColor = lightTertiaryBorderColor;
        nameStyleColor = lightTertiaryNameStyleColor;

      case StyleButton.outline:
        enabledColor = lightOutlineEnabledColor;
        hoveredColor = lightOutlineHoveredColor;
        pressedColor = lightOutlinePressedColor;
        focusedColor = lightOutlineFocusedColor;
        disabledColor = lightOutlineDisabledColor;
        loadingColor = lightOutlineLoadingColor;
        borderColor = lightOutlineBorderColor;
        nameStyleColor = lightOutlineNameStyleColor;
      case StyleButton.textPrimary:
        enabledColor = lightTextpriEnabledColor;
        hoveredColor = lightTextpriHoveredColor;
        pressedColor = lightTextpriPressedColor;
        focusedColor = lightTextpriFocusedColor;
        disabledColor = lightTextpriDisabledColor;
        loadingColor = lightTextpriLoadingColor;
        borderColor = lightTextpriBorderColor;
        nameStyleColor = lightTextpriNameStyleColor;
      case StyleButton.textSecondary:
        enabledColor = lightTextpriEnabledColor;
        hoveredColor = lightTextpriHoveredColor;
        pressedColor = lightTextpriPressedColor;
        focusedColor = lightTextpriFocusedColor;
        disabledColor = lightTextpriDisabledColor;
        loadingColor = lightTextpriLoadingColor;
        borderColor = lightTextpriBorderColor;
        nameStyleColor = lightTextsecNameStyleColor;
    }
  } else {
    switch (styleButton) {
      case StyleButton.primary:
        enabledColor = darkpriEnabledColor;
        hoveredColor = darkpriHoveredColor;
        pressedColor = darkpriPressedColor;
        focusedColor = darkpriFocusedColor;
        disabledColor = darkpriDisabledColor;
        loadingColor = darkpriLoadingColor;
        borderColor = darkpriBorderColor;
        nameStyleColor = darkpriNameStyleColor;
      case StyleButton.secondary:
        enabledColor = darksecEnabledColor;
        hoveredColor = darksecHoveredColor;
        pressedColor = darksecPressedColor;
        focusedColor = darksecFocusedColor;
        disabledColor = darksecDisabledColor;
        loadingColor = darksecLoadingColor;
        borderColor = darksecBorderColor;
        nameStyleColor = darksecNameStyleColor;
      case StyleButton.buy:
        enabledColor = darkTertiaryEnabledColor;
        hoveredColor = darkTertiaryHoveredColor;
        pressedColor = darkTertiaryPressedColor;
        focusedColor = darkTertiaryFocusedColor;
        disabledColor = darkTertiaryDisabledColor;
        loadingColor = darkTertiaryLoadingColor;
        borderColor = darkTertiaryBorderColor;
        nameStyleColor = darkTertiaryNameStyleColor;
      case StyleButton.outline:
        enabledColor = darkOutlineEnabledColor;
        hoveredColor = darkOutlineHoveredColor;
        pressedColor = darkOutlinePressedColor;
        focusedColor = darkOutlineFocusedColor;
        disabledColor = darkOutlineDisabledColor;
        loadingColor = darkOutlineLoadingColor;
        borderColor = darkOutlineBorderColor;
        nameStyleColor = darkOutlineNameStyleColor;
      case StyleButton.textPrimary:
        enabledColor = darkTextpriEnabledColor;
        hoveredColor = darkTextpriHoveredColor;
        pressedColor = darkTextpriPressedColor;
        focusedColor = darkTextpriFocusedColor;
        disabledColor = darkTextpriDisabledColor;
        loadingColor = darkTextpriLoadingColor;
        borderColor = darkTextpriBorderColor;
        nameStyleColor = darkTextpriNameStyleColor;
      case StyleButton.textSecondary:
        enabledColor = darkTextpriEnabledColor;
        hoveredColor = darkTextpriHoveredColor;
        pressedColor = darkTextpriPressedColor;
        focusedColor = darkTextpriFocusedColor;
        disabledColor = darkTextpriDisabledColor;
        loadingColor = darkTextpriLoadingColor;
        borderColor = darkTextpriBorderColor;
        nameStyleColor = darkTextsecNameStyleColor;
    }
  }

  if (styleButton == StyleButton.textPrimary ||
      styleButton == StyleButton.textSecondary ||
      styleButton == StyleButton.outline) {
    switch (state) {
      case ButtonState.enabled:
        backgroundColor = enabledColor;
        borderSide = BorderSide(color: borderColor, width: 2);
      case ButtonState.hovered:
        backgroundColor = hoveredColor;
        elevation = 6;
        borderSide = BorderSide(color: borderColor);
      case ButtonState.pressed:
        backgroundColor = pressedColor;
        borderSide = BorderSide(color: borderColor, width: 5);
      case ButtonState.focused:
        backgroundColor = focusedColor;
        borderSide = BorderSide(color: borderColor, width: 4);
      case ButtonState.disabled:
        backgroundColor = disabledColor;
        borderSide = BorderSide(color: lightOutlineBorderDisabledColor);
        nameStyleColor = lightOutlineBorderDisabledColor;
      case ButtonState.loading:
        backgroundColor = loadingColor;
        borderSide = BorderSide(color: borderColor);
    }
    if (styleButton == StyleButton.textPrimary ||
        styleButton == StyleButton.textSecondary) {
      borderSide = const BorderSide(color: Colors.transparent);
      if (styleButton == StyleButton.textSecondary) {
        nameStyleColor = lightTextsecNameStyleColor;
      } else {
        nameStyleColor = lightTextpriNameStyleColor;
      }

      if (state == ButtonState.focused) {
        backgroundColor = focusedColor;
      } else {
        backgroundColor = Colors.transparent;
      }
    }
  } else {
    switch (state) {
      case ButtonState.enabled:
        backgroundColor = enabledColor;
        borderSide = BorderSide(color: enabledColor);
      case ButtonState.hovered:
        backgroundColor = hoveredColor;
        elevation = 6;
        borderSide = BorderSide(color: borderColor);
      case ButtonState.pressed:
        backgroundColor = pressedColor;
        borderSide = BorderSide(color: hoveredColor, width: 5);
      case ButtonState.focused:
        backgroundColor = focusedColor;
        borderSide = BorderSide(color: focusedColor, width: 4);
      case ButtonState.disabled:
        backgroundColor = disabledColor;
        borderSide = BorderSide(color: darkOutlineBorderDisabledColor);
        nameStyleColor = darkOutlineBorderDisabledColor;
      case ButtonState.loading:
        backgroundColor = loadingColor;
        borderSide = BorderSide(color: enabledColor);
    }
    if (styleButton == StyleButton.textPrimary ||
        styleButton == StyleButton.textSecondary) {
      borderSide = const BorderSide(color: Colors.transparent);
      if (styleButton == StyleButton.textSecondary) {
        nameStyleColor = darkTextsecNameStyleColor;
      } else {
        nameStyleColor = darkTextpriNameStyleColor;
      }
      backgroundColor = Colors.transparent;
    }
  }

  return ElevatedButton.styleFrom(
    minimumSize: const Size(100, 24),
    backgroundColor: backgroundColor,
    disabledBackgroundColor: disabledColor,
    disabledForegroundColor: disabledColor,
    elevation: elevation,
    shadowColor: backgroundColor,
    side: borderSide,
    textStyle: TextStyle(
      color: nameStyleColor,
      fontSize: jcs16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    foregroundColor: foregroundColor,
  );
}

class JcButton extends StatefulWidget {
  const JcButton({
    required this.style,
    required this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    this.theme = ThemeButton.light,
    this.sizeStyle = SizeStyleButton.medium,
    this.padding = EdgeInsets.zero,
    this.borderColor,
    super.key,
  });
  final StyleButton style;
  final String label;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Function()? onPressed;
  final ThemeButton? theme;
  final SizeStyleButton? sizeStyle;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  @override
  State<JcButton> createState() => _JcButtonState();
}

class _JcButtonState extends State<JcButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: widget.padding!,
        child: _buildBody(
          context: context,
          style: widget.style,
          styleColor: getStyleColor(),
          borderColor: getBorderColor(),
          sizeStyle: widget.sizeStyle,
          nameButton: widget.label,
          theme: widget.theme,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          onPressed: widget.onPressed,
        ),
      ),
    );
  }

  Color getBorderColor() {
    switch (widget.style) {
      case StyleButton.primary:
        return lightpriBorderColor;
      case StyleButton.secondary:
        return lightsecBorderColor;
      case StyleButton.buy:
        return lightTertiaryBorderColor;
      case StyleButton.outline:
        return lightTertiaryBorderColor;
      case StyleButton.textPrimary:
        return lightTertiaryBorderColor;
      case StyleButton.textSecondary:
        return lightTertiaryBorderColor;
    }
  }

  Color getStyleColor() {
    switch (widget.style) {
      case StyleButton.primary:
        return lightpriNameStyleColor;
      case StyleButton.secondary:
        return lightsecNameStyleColor;
      case StyleButton.buy:
        return lightTertiaryNameStyleColor;
      case StyleButton.outline:
        return lightOutlineNameStyleColor;
      case StyleButton.textPrimary:
        if (widget.theme == ThemeButton.dark) {
          return darkTextpriNameStyleColor;
        }
        return lightTextpriNameStyleColor;
      case StyleButton.textSecondary:
        if (widget.theme == ThemeButton.dark) {
          return darkTextsecNameStyleColor;
        }
        return lightTextsecNameStyleColor;
    }
  }
}

Widget _buildBody({
  required BuildContext context,
  required StyleButton style,
  required Color styleColor,
  required Color borderColor,
  required String nameButton,
  SizeStyleButton? sizeStyle,
  IconData? suffixIcon,
  IconData? prefixIcon,
  ThemeButton? theme,
  Function()? onPressed,
}) {
  switch (style) {
    case StyleButton.primary:
      return JcButtonPrimary(
        onPressed: onPressed,
        styleButton: style,
        sizeStyle: sizeStyle,
        nameStyleColor: styleColor,
        borderColor: borderColor,
        nameButton: nameButton,
        theme: theme,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      );
    case StyleButton.secondary:
      return JcButtonSecondary(
        onPressed: onPressed,
        styleButton: style,
        sizeStyle: sizeStyle,
        nameStyleColor: styleColor,
        borderColor: borderColor,
        nameButton: nameButton,
        theme: theme,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      );
    case StyleButton.buy:
      return JcButtonBuy(
        onPressed: onPressed,
        styleButton: style,
        sizeStyle: sizeStyle,
        nameStyleColor: styleColor,
        borderColor: borderColor,
        nameButton: nameButton,
        theme: theme,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      );
    case StyleButton.outline:
      return JcButtonOutlined(
        onPressed: onPressed,
        styleButton: style,
        sizeStyle: sizeStyle,
        nameStyleColor: styleColor,
        borderColor: borderColor,
        nameButton: nameButton,
        theme: theme,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      );
    case StyleButton.textPrimary:
      return JcButtonTextPrimary(
        onPressed: onPressed,
        styleButton: style,
        sizeStyle: sizeStyle,
        nameStyleColor: styleColor,
        borderColor: borderColor,
        nameButton: nameButton,
        theme: theme,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      );
    case StyleButton.textSecondary:
      return JcButtonTextSecondary(
        onPressed: onPressed,
        styleButton: style,
        sizeStyle: sizeStyle,
        nameStyleColor: styleColor,
        borderColor: borderColor,
        nameButton: nameButton,
        theme: theme,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      );
  }
}
