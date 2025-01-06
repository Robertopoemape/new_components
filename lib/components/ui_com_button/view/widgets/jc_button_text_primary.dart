import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class JcButtonTextPrimary extends StatefulWidget {
  const JcButtonTextPrimary({
    required this.styleButton,
    required this.nameStyleColor,
    required this.borderColor,
    required this.nameButton,
    required this.suffixIcon,
    required this.prefixIcon,
    this.onPressed,
    this.sizeStyle,
    this.theme = ThemeButton.light,
    super.key,
  });
  final StyleButton styleButton;
  final Color nameStyleColor;
  final Color borderColor;
  final String nameButton;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Function()? onPressed;
  final SizeStyleButton? sizeStyle;
  final ThemeButton? theme;

  @override
  State<JcButtonTextPrimary> createState() => _JcButtonTextPrimaryState();
}

class _JcButtonTextPrimaryState extends State<JcButtonTextPrimary> {
  ButtonState _currentButtonState = ButtonState.enabled;

  ButtonState get currentButtonState => _currentButtonState;
  set currentButtonState(ButtonState value) {
    setState(() {
      _currentButtonState = value;
    });
  }

  double sizeIcon() {
    switch (widget.sizeStyle) {
      case SizeStyleButton.verySmall:
        return 12;
      case SizeStyleButton.small:
        return 16;
      case SizeStyleButton.medium:
        return 20;
      case SizeStyleButton.large:
        return 24;
      default:
        return 13;
    }
  }

  Future<void> onPressedButton() async {
    if (_currentButtonState == ButtonState.loading) return;
    if (widget.onPressed != null) {
      currentButtonState = ButtonState.loading;
      await widget.onPressed!();
      currentButtonState = ButtonState.enabled;
    } else {
      currentButtonState = ButtonState.disabled;
    }
  }

  double heightButton() {
    switch (widget.sizeStyle) {
      case SizeStyleButton.verySmall:
        return 24;
      case SizeStyleButton.small:
        return 32;
      case SizeStyleButton.medium:
        return 40;
      case SizeStyleButton.large:
        return 48;
      default:
        return 48;
    }
  }

  double sizeLabel() {
    switch (widget.sizeStyle) {
      case SizeStyleButton.verySmall:
        return 10;
      case SizeStyleButton.small:
        return 12;
      case SizeStyleButton.medium:
        return 14;
      case SizeStyleButton.large:
        return 18;
      default:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton(),
      child: ElevatedButton(
        style: getButtonStyle(
          widget.theme!,
          currentButtonState,
          widget.styleButton,
          widget.onPressed,
        ),
        onFocusChange: (onFocus) {
          if (onFocus) {
            currentButtonState = ButtonState.focused;
          } else {
            currentButtonState = ButtonState.enabled;
          }
        },
        onHover: (onHover) {
          if (onHover) {
            currentButtonState = ButtonState.focused;
          } else {
            currentButtonState = ButtonState.enabled;
          }
        },
        onPressed: widget.onPressed != null ? onPressedButton : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (currentButtonState == ButtonState.loading)
              SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  color: widget.nameStyleColor,
                  strokeWidth: 2,
                ),
              )
            else ...[
              if (widget.prefixIcon != null) ...[
                Icon(
                  widget.prefixIcon,
                  color: widget.onPressed == null
                      ? widget.theme == ThemeButton.light
                          ? JcColors.gs600
                          : JcColors.gs800
                      : widget.nameStyleColor,
                  size: sizeIcon(),
                ),
                const SizedBox(width: 8),
              ],
              if (widget.onPressed != null) ...[
                Text(
                  widget.nameButton,
                  style: JcTextStyle.body1.w600.copyWith(
                    color: widget.onPressed == null
                        ? widget.theme == ThemeButton.light
                            ? JcColors.gs600
                            : JcColors.gs800
                        : widget.nameStyleColor,
                    fontSize: sizeLabel(),
                  ),
                ),
              ] else ...[
                Text(
                  widget.nameButton,
                  style: JcTextStyle.body1.copyWith(
                    color: widget.onPressed == null
                        ? widget.theme == ThemeButton.light
                            ? JcColors.gs600
                            : JcColors.gs800
                        : widget.nameStyleColor,
                    fontSize: sizeLabel(),
                  ),
                ),
              ],
              if (widget.suffixIcon != null) ...[
                const SizedBox(width: 8),
                Icon(
                  widget.suffixIcon,
                  color: widget.onPressed == null
                      ? widget.theme == ThemeButton.light
                          ? JcColors.gs600
                          : JcColors.gs800
                      : widget.nameStyleColor,
                  size: sizeIcon(),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
