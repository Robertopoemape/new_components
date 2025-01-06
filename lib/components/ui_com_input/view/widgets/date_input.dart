import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jc_module/jc_module.dart';

class DateInput extends StatefulWidget {
  const DateInput({
    required this.controller,
    required this.styleSizeInput,
    required this.readOnly,
    required this.hintText,
    required this.isError,
    required this.label,
    required this.errorLabel,
    required this.iconError,
    required this.colorInputText,
    required this.iconInsideInput,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onChangedDate,
    this.contentPadding = const EdgeInsets.all(16),
    super.key,
  });

  final TextEditingController? controller;
  final bool readOnly;
  final String hintText;
  final bool isError;
  final String label;
  final String errorLabel;
  final Color colorInputText;
  final IconData iconError;
  final IconData iconInsideInput;
  final EdgeInsets contentPadding;
  final DateTime initialDate;
  final StyleSizeInput styleSizeInput;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(String) onChangedDate;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  Color borderColor = JcColors.gs700;
  TextStyle textStyle = const TextStyle();

  Future<void> selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller!.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

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
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs12);
      case StyleSizeInput.medium:
        height = jcs40;
        iconSize = jcs20;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs14);
      case StyleSizeInput.large:
        height = jcs48;
        iconSize = jcs24;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs16);
      default:
        height = jcs48;
        iconSize = jcs24;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs16);
    }
    return Container(
      padding: widget.contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: height,
            child: TextFormField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              style: textStyle.copyWith(color: widget.colorInputText),
              onTap: () {
                if (!widget.readOnly) {
                  selectDate(context);
                }
              },
              decoration: InputDecoration(
                label: Text(
                  widget.label,
                  style: textStyle.copyWith(color: JcColors.gs600),
                ),
                hintStyle: textStyle.copyWith(color: JcColors.gs600),
                prefixIcon: widget.controller != null &&
                        widget.controller!.text.isNotEmpty
                    ? Icon(
                        Icons.calendar_today_outlined,
                        size: iconSize,
                        color: JcColors.sec300,
                      )
                    : null,
                suffixIcon: widget.controller != null &&
                        widget.controller!.text.isNotEmpty
                    ? null
                    : Icon(
                        widget.iconInsideInput,
                        size: iconSize,
                        color: JcColors.sec300,
                      ),
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
                  borderSide: BorderSide(color: borderColor, width: jcs2),
                  borderRadius: BorderRadius.circular(jcs8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: jcs16,
                ),
                isDense: true,
                fillColor: Colors.transparent,
                filled: true,
              ),
              onChanged: (value) {
                widget.onChangedDate(value);
                if (widget.controller != null) {
                  setState(() {
                    borderColor =
                        value.isEmpty ? JcColors.err600 : JcColors.pri600;
                  });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(jcs4),
            child: Row(
              children: [
                if (widget.isError) ...[
                  Icon(
                    widget.iconError,
                    color: JcColors.err600,
                    size: iconSize,
                  ),
                  const SizedBox(width: jcs8),
                ],
                Text(
                  widget.errorLabel.isEmpty
                      ? widget.hintText
                      : widget.errorLabel,
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
