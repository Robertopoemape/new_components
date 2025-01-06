import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    required this.controller,
    required this.readOnly,
    required this.hintText,
    required this.isError,
    required this.label,
    required this.errorLabel,
    required this.colorInputText,
    required this.iconError,
    required this.imgCountry,
    required this.countryItems,
    required this.styleSizeInput,
    required this.onChangedPhone,
    this.contentPadding = const EdgeInsets.all(jcs16),
    super.key,
  });

  final TextEditingController? controller;
  final bool readOnly;
  final String hintText;
  final bool isError;
  final String label;
  final String errorLabel;
  final EdgeInsets contentPadding;
  final Color colorInputText;
  final IconData iconError;
  final String imgCountry;
  final StyleSizeInput styleSizeInput;
  final List<Map<String, String>> countryItems;
  final Function(String) onChangedPhone;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  String selectedPrefix = '';
  String selectedCountryName = '';
  Color borderColor = JcColors.gs700;
  TextStyle textStyle = const TextStyle();

  double widhtSize = 60;

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

  double calculateDropdownWidth(String countryName) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: countryName,
        style: DefaultTextStyle.of(context).style,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width + jcs24 + jcs8;
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
          const SizedBox(height: jcs8),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widhtSize,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: widget.countryItems.map((country) {
                      return DropdownMenuItem<String>(
                        value: country['prefix'],
                        child: Row(
                          children: [
                            Image.asset(
                              widget.imgCountry,
                              width: jcs24,
                              height: jcs24,
                            ),
                            const SizedBox(width: jcs8),
                            Expanded(
                              child: Text(country['name']!),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPrefix = value!;
                        selectedCountryName = widget.countryItems.firstWhere(
                          (country) => country['prefix'] == value,
                        )['name']!;
                        widhtSize = calculateDropdownWidth(selectedCountryName);
                        widget.controller!.text = '($selectedPrefix) ';
                        widget.controller!.selection =
                            TextSelection.fromPosition(
                          TextPosition(offset: widget.controller!.text.length),
                        );
                      });
                    },
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (selectedCountryName.isNotEmpty) ...[
                          Image.asset(
                            widget.imgCountry,
                            width: jcs24,
                            height: jcs24,
                          ),
                          const SizedBox(width: jcs8),
                        ],
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  child: TextFormField(
                    controller: widget.controller,
                    readOnly: widget.readOnly,
                    keyboardType: TextInputType.phone,
                    style: textStyle.copyWith(color: widget.colorInputText),
                    decoration: InputDecoration(
                      label: Text(
                        widget.label,
                        style: textStyle.copyWith(color: JcColors.gs600),
                      ),
                      hintStyle: textStyle.copyWith(color: JcColors.gs600),
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        size: iconSize,
                        color: widget.colorInputText,
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
                        borderSide: const BorderSide(
                          color: JcColors.gs600,
                          width: jcs2,
                        ),
                        borderRadius: BorderRadius.circular(jcs8),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: jcs16),
                      isDense: true,
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                    onChanged: (value) {
                      widget.onChangedPhone(value);
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
            ],
          ),
          Row(
            children: [
              if (selectedCountryName.isNotEmpty && !widget.isError)
                Text(
                  selectedCountryName,
                  style: JcTextStyle.body2.gs600,
                ),
              const SizedBox(width: jcs8),
              if (widget.isError ||
                  widget.controller != null &&
                      widget.controller!.text.isNotEmpty) ...[
                Icon(
                  widget.iconError,
                  size: iconSize,
                  color: widget.isError ? JcColors.err600 : borderColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: jcs8, top: jcs4),
                  child: Text(
                    widget.errorLabel,
                    style: JcTextStyle.caption.copyWith(
                      color: widget.isError ? JcColors.err600 : JcColors.pri600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
