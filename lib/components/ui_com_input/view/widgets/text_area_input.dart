import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class TextAreaInput extends StatefulWidget {
  const TextAreaInput({
    required this.controller,
    required this.styleSizeInput,
    required this.readOnly,
    required this.hintText,
    required this.isError,
    required this.label,
    required this.errorLabel,
    required this.colorInputText,
    required this.iconError,
    required this.onChangedArea,
    this.contentPadding = const EdgeInsets.all(16),
    super.key,
  });

  final StyleSizeInput styleSizeInput;
  final TextEditingController? controller;
  final bool readOnly;
  final String hintText;
  final bool isError;
  final String label;
  final String errorLabel;
  final Color colorInputText;
  final EdgeInsets contentPadding;
  final IconData iconError;
  final Function(String) onChangedArea;

  @override
  State<TextAreaInput> createState() => _TextAreaInputState();
}

class _TextAreaInputState extends State<TextAreaInput> {
  Color borderColor = JcColors.gs700;
  TextStyle textStyle = const TextStyle();

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      if (widget.controller!.text.isNotEmpty) {
        borderColor = JcColors.sec600;
      }
      widget.controller!.addListener(() {
        setState(() {
          if (widget.controller!.text.isEmpty) {
            borderColor = JcColors.sec600;
          } else {
            borderColor = JcColors.pri600;
          }
        });
      });

      if (widget.readOnly) {
        setState(() {
          borderColor = JcColors.gs600;
          textStyle = JcTextStyle.body2.copyWith(
            fontSize: jcs16,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height;
    switch (widget.styleSizeInput) {
      case StyleSizeInput.small:
        height = jcs32;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs12);
      case StyleSizeInput.medium:
        height = jcs40;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs14);
      case StyleSizeInput.large:
        height = jcs48;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs16);
      default:
        height = jcs48;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs16);
    }

    return Container(
      padding: widget.contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: jcs8),
          Scrollbar(
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: TextFormField(
                  controller: widget.controller,
                  readOnly: widget.readOnly,
                  maxLines: null,
                  style: textStyle.copyWith(color: widget.colorInputText),
                  decoration: InputDecoration(
                    label: Text(
                      widget.label,
                      style: textStyle.copyWith(color: JcColors.gs600),
                    ),
                    hintStyle: textStyle.copyWith(color: JcColors.gs600),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.isError ? JcColors.err600 : borderColor,
                        width: jcs2,
                      ),
                      borderRadius: BorderRadius.circular(jcs8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.isError ? JcColors.err600 : borderColor,
                        width: jcs2,
                      ),
                      borderRadius: BorderRadius.circular(jcs8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: JcColors.gs600,
                        width: jcs2,
                      ),
                      borderRadius: BorderRadius.circular(jcs8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: jcs16,
                      vertical: jcs8,
                    ),
                    isDense: true,
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  onChanged: (value) {
                    widget.onChangedArea(value);
                    if (widget.controller != null) {
                      setState(() {
                        borderColor =
                            value.isEmpty ? JcColors.err600 : JcColors.pri600;
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: jcs16, left: jcs12, top: jcs4),
            child: Row(
              children: [
                if (widget.isError)
                  Icon(
                    widget.iconError,
                    size: jcs20,
                    color: widget.isError ? JcColors.err600 : borderColor,
                  ),
                const SizedBox(width: jcs4),
                Text(
                  widget.errorLabel,
                  style: JcTextStyle.caption.copyWith(
                    color: widget.isError ? JcColors.err600 : JcColors.sec400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
