import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    required this.hintText,
    required this.controller,
    required this.label,
    required this.isPassword,
    required this.iconInsideInput,
    required this.onChangedText,
    required this.colorInputText,
    required this.styleSizeInput,
    required this.isError,
    required this.readOnly,
    required this.errorLabel,
    required this.successLabel,
    required this.contentPadding,
    required this.isOptionalField,
    required this.widthBorder,
    required this.borderColor,
    required this.borderRadius,
    required this.keyboardType,
    this.colorHinText,
    this.prefixIcon,
    super.key,
  });

  final String hintText;
  final bool readOnly;
  final TextEditingController? controller;
  final String label;
  final String errorLabel;
  final String successLabel;
  final Color colorInputText;
  final EdgeInsets contentPadding;
  final StyleSizeInput styleSizeInput;
  final bool isPassword;
  final IconData iconInsideInput;
  final Function(String) onChangedText;
  final bool? isError;
  final Widget? prefixIcon;
  final bool isOptionalField;
  final double widthBorder;
  final Color borderColor;
  final double borderRadius;
  final Color? colorHinText;
  final TextInputType keyboardType;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool isOscureText = true;
  Color borderColor = JcColors.gs700;
  TextStyle textStyle = const TextStyle();
  String messageLabel = '';
  String valueLabel = '';
  bool isError = false;

  @override
  void dispose() {
    widget.controller?.removeListener(controllerListener);
    super.dispose();
  }

  void controllerListener() {
    if (mounted) {
      setState(() {
        borderColor = widget.controller!.text.isEmpty
            ? widget.borderColor
            : JcColors.pri600;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    messageLabel = widget.hintText;
    widget.controller?.addListener(controllerListener);
    borderColor = widget.borderColor;

    if (widget.readOnly) {
      setState(() {
        borderColor = JcColors.gs600;
        textStyle = JcTextStyle.caption.copyWith(fontSize: jcs16);
      });
    }
  }

  void _toggle() {
    setState(() {
      isOscureText = !isOscureText;
    });
  }

  bool get validateError {
    if (widget.isError!) {
      setState(() {
        borderColor = JcColors.err600;
        messageLabel = widget.errorLabel;
        isError = true;
      });
    } else {
      setState(() {
        if (valueLabel.isNotEmpty) {
          messageLabel = widget.errorLabel.isEmpty
              ? widget.successLabel
              : widget.errorLabel;
          borderColor = JcColors.pri600;
          isError = false;
        }
      });
    }
    return isError;
  }

  @override
  Widget build(BuildContext context) {
    final height = {
      StyleSizeInput.small: jcs32,
      StyleSizeInput.medium: jcs40,
      StyleSizeInput.large: jcs48,
    }[widget.styleSizeInput];

    final iconSize = {
      StyleSizeInput.small: jcs16,
      StyleSizeInput.medium: jcs20,
      StyleSizeInput.large: jcs24,
    }[widget.styleSizeInput];

    final textStyle = {
      StyleSizeInput.small: JcTextStyle.caption.copyWith(fontSize: jcs12),
      StyleSizeInput.medium: JcTextStyle.caption.copyWith(fontSize: jcs14),
      StyleSizeInput.large: JcTextStyle.caption.copyWith(fontSize: jcs16),
    }[widget.styleSizeInput];

    return Container(
      padding: widget.contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          gap8,
          if (widget.isOptionalField)
            Padding(
              padding: const EdgeInsets.only(bottom: jcs4),
              child: Row(
                children: [
                  Text(
                    messageLabel,
                    style: JcTextStyle.overline.sec600,
                  ),
                  const Spacer(),
                  Text(
                    '*Opcional',
                    style: JcTextStyle.overline.gs800,
                  ),
                ],
              ),
            ),
          SizedBox(
            height: height,
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              readOnly: widget.readOnly,
              cursorColor: widget.colorInputText,
              obscureText: widget.isPassword ? isOscureText : false,
              style: textStyle?.copyWith(color: widget.colorInputText),
              decoration: InputDecoration(
                label: Text(
                  widget.label,
                  style: textStyle?.copyWith(color: JcColors.gs600),
                ),
                hintText: widget.hintText,
                hintStyle: textStyle?.copyWith(
                  color: widget.colorHinText ?? JcColors.sec600,
                  fontSize: textStyle.fontSize,
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: valueLabel.isNotEmpty
                    ? widget.isPassword
                        ? IconButton(
                            icon: Icon(
                              isOscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: iconSize,
                              color: widget.colorInputText,
                            ),
                            onPressed: _toggle,
                          )
                        : Icon(
                            validateError ? Icons.info : widget.iconInsideInput,
                            size: iconSize,
                            color:
                                validateError ? JcColors.err600 : borderColor,
                          )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: validateError ? JcColors.err600 : borderColor,
                    width: widget.widthBorder,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: validateError ? JcColors.err600 : borderColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                    width: widget.widthBorder,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                contentPadding: widget.prefixIcon == null
                    ? const EdgeInsets.symmetric(
                        horizontal: jcs16,
                        vertical: jcs10,
                      )
                    : const EdgeInsets.symmetric(
                        horizontal: jcs16,
                      ),
                isDense: true,
                fillColor: Colors.transparent,
                filled: true,
              ),
              onChanged: (value) {
                if (!widget.isOptionalField) {
                  setState(() {
                    valueLabel = value;
                    if (value.isNotEmpty) {
                      borderColor = JcColors.pri600;
                      messageLabel = widget.successLabel;
                      isError = false;
                    } else {
                      messageLabel = 'Este campo no puede estar vacío';
                      borderColor = JcColors.err600;
                      isError = true;
                    }
                  });
                }
                widget.onChangedText(value);
              },
            ),
          ),
          if (!widget.isOptionalField)
            Padding(
              padding:
                  const EdgeInsets.only(right: jcs16, left: jcs16, top: jcs4),
              child: Text(
                messageLabel,
                style: JcTextStyle.caption.copyWith(
                  color: borderColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
