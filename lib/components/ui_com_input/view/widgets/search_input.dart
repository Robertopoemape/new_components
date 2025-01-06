import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    required this.controller,
    required this.readOnly,
    required this.hintText,
    required this.isError,
    required this.label,
    required this.errorLabel,
    required this.iconInsideInput,
    required this.styleSizeInput,
    required this.colorInputText,
    required this.onPressedCleanSearch,
    required this.iconError,
    required this.onChangedSearch,
    this.contentPadding = const EdgeInsets.all(16),
    super.key,
  });

  final TextEditingController? controller;
  final StyleSizeInput styleSizeInput;
  final bool readOnly;
  final String hintText;
  final bool isError;
  final String label;
  final String errorLabel;
  final Color colorInputText;
  final IconData iconInsideInput;
  final IconData iconError;
  final VoidCallback onPressedCleanSearch;
  final EdgeInsets contentPadding;
  final Function(String) onChangedSearch;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  Color borderColor = JcColors.gs700;
  TextStyle textStyle = const TextStyle();
  double height = 0;
  double iconSize = 0;
  double heightIcon = 0;

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
    switch (widget.styleSizeInput) {
      case StyleSizeInput.small:
        height = jcs32;
        heightIcon = jcs15;
        iconSize = jcs11;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs12);
      case StyleSizeInput.medium:
        height = jcs40;
        heightIcon = jcs18;
        iconSize = jcs14;
        textStyle = JcTextStyle.body2.copyWith(fontSize: jcs14);
      case StyleSizeInput.large:
        height = jcs48;
        heightIcon = jcs21;
        iconSize = jcs17;
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
              decoration: InputDecoration(
                label: Text(
                  widget.label,
                  style: textStyle.copyWith(color: JcColors.gs600),
                ),
                hintText: widget.hintText,
                hintStyle: textStyle.copyWith(color: JcColors.gs600),
                prefixIcon: Icon(
                  Icons.search,
                  size: iconSize,
                  color: JcColors.sec300,
                ),
                suffixIcon: widget.controller != null &&
                        widget.controller!.text.isNotEmpty
                    ? IconButton(
                        onPressed: widget.onPressedCleanSearch,
                        icon: Container(
                          height: heightIcon,
                          width: heightIcon,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: JcColors.sec600,
                              width: jcs2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(jcs50),
                            ),
                          ),
                          child: Icon(
                            widget.iconInsideInput,
                            size: iconSize,
                            color: JcColors.sec600,
                          ),
                        ),
                      )
                    : null,
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
                  borderSide:
                      const BorderSide(color: JcColors.gs600, width: jcs2),
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
                widget.onChangedSearch(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: jcs4),
            child: Row(
              children: [
                if (widget.isError) ...[
                  Icon(
                    widget.iconError,
                    size: iconSize,
                    color: widget.isError ? JcColors.err600 : borderColor,
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
