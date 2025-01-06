import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class NumberInput extends StatefulWidget {
  const NumberInput({
    required this.controller,
    required this.readOnly,
    required this.hintText,
    required this.isError,
    required this.label,
    required this.errorLabel,
    required this.colorInputText,
    required this.onPressedDecrement,
    required this.onPressedIncrement,
    required this.iconInsideInput,
    required this.styleSizeInput,
    required this.onChangedNumber,
    this.contentPadding = const EdgeInsets.all(jcs16),
    super.key,
  });

  final TextEditingController? controller;
  final bool readOnly;
  final String hintText;
  final bool isError;
  final String label;
  final String errorLabel;
  final Color colorInputText;
  final VoidCallback onPressedDecrement;
  final VoidCallback onPressedIncrement;
  final IconData iconInsideInput;
  final StyleSizeInput styleSizeInput;
  final EdgeInsets contentPadding;
  final Function(String) onChangedNumber;

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  Color borderColor = JcColors.gs700;
  TextStyle textStyle = const TextStyle();
  double iconSizeArrows = 0;

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
    }
    if (widget.readOnly) {
      setState(() {
        borderColor = JcColors.gs600;
        textStyle = JcTextStyle.body2.copyWith(
          fontSize: jcs16,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height;
    double iconSize;

    switch (widget.styleSizeInput) {
      case StyleSizeInput.small:
        height = jcs32;
        iconSize = jcs16;
        iconSizeArrows = jcs13;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs12);
      case StyleSizeInput.medium:
        height = jcs40;
        iconSize = jcs20;
        iconSizeArrows = jcs17;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs14);
      case StyleSizeInput.large:
        height = jcs48;
        iconSize = jcs24;
        iconSizeArrows = jcs21;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs16);
      default:
        height = jcs48;
        iconSize = jcs24;
        iconSizeArrows = jcs17;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs16);
    }

    return Container(
      padding: widget.contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                widget.hintText,
                style: JcTextStyle.body2.sec400,
              ),
              const Spacer(),
              const Icon(
                Icons.info,
                color: JcColors.act600,
                size: jcs20,
              ),
            ],
          ),
          const SizedBox(height: jcs4),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: height,
                  child: TextField(
                    controller: widget.controller,
                    readOnly: widget.readOnly,
                    keyboardType: TextInputType.number,
                    style: textStyle.copyWith(color: widget.colorInputText),
                    decoration: InputDecoration(
                      label: Text(
                        widget.label,
                        style: textStyle.copyWith(color: JcColors.gs600),
                      ),
                      hintStyle: textStyle.copyWith(color: JcColors.gs600),
                      prefixIcon: Icon(
                        Icons.numbers,
                        size: iconSize,
                        color: JcColors.sec300,
                      ),
                      suffixIcon: widget.isError
                          ? Icon(
                              widget.iconInsideInput,
                              size: iconSize,
                              color: JcColors.err600,
                            )
                          : null,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.isError ? JcColors.err600 : borderColor,
                          width: jcs2,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(jcs8),
                          topLeft: Radius.circular(jcs8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.isError ? JcColors.err600 : borderColor,
                          width: jcs2,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(jcs8),
                          topLeft: Radius.circular(jcs8),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: JcColors.gs600, width: jcs2),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(jcs8),
                          topLeft: Radius.circular(jcs8),
                        ),
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
                      widget.onChangedNumber(value);
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: JcColors.gs700,
                    width: jcs2,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(jcs8),
                    topRight: Radius.circular(jcs8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: widget.onPressedDecrement,
                      child: Icon(
                        Icons.keyboard_arrow_up_sharp,
                        color: JcColors.sec600,
                        size: iconSizeArrows,
                      ),
                    ),
                    Container(
                      height: jcs2,
                      width: jcs20,
                      color: JcColors.gs700,
                      alignment: Alignment.center,
                    ),
                    InkWell(
                      onTap: widget.onPressedIncrement,
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: JcColors.sec600,
                        size: iconSizeArrows,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: jcs4),
            child: Text(
              widget.errorLabel.isEmpty ? widget.hintText : widget.errorLabel,
              style: JcTextStyle.caption.copyWith(
                color: widget.isError ? JcColors.err600 : JcColors.sec400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
