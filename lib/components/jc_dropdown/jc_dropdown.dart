import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

enum StyleSizeDropdown { small, medium, large }

class JcDropdown extends StatefulWidget {
  const JcDropdown({
    required this.items,
    required this.borderColor,
    this.label = '',
    this.messageLabel = '',
    this.widthBorder = 1,
    this.hintText = 'Selecciona una opción',
    this.styleSize = StyleSizeDropdown.large,
    this.borderRadius = jcs8,
    this.isOptional = false,
    this.onChanged,
    this.initialValue,
    super.key,
  });

  final List<String> items;
  final String? label;
  final Color borderColor;
  final double widthBorder;
  final StyleSizeDropdown styleSize;
  final String messageLabel;
  final String hintText;
  final double borderRadius;
  final bool isOptional;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;

  @override
  State<JcDropdown> createState() => _JcDropdownState();
}

class _JcDropdownState extends State<JcDropdown> {
  String? selectedItem;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.initialValue != null &&
        widget.items.contains(widget.initialValue)) {
      selectedItem = widget.initialValue;
      controller.text = selectedItem!;
    } else {
      selectedItem = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = {
      StyleSizeDropdown.small: jcs32,
      StyleSizeDropdown.medium: jcs40,
      StyleSizeDropdown.large: jcs48,
    }[widget.styleSize];

    final iconSize = {
      StyleSizeDropdown.small: jcs16,
      StyleSizeDropdown.medium: jcs20,
      StyleSizeDropdown.large: jcs24,
    }[widget.styleSize];

    final textStyle = {
      StyleSizeDropdown.small: JcTextStyle.caption.copyWith(fontSize: jcs12),
      StyleSizeDropdown.medium: JcTextStyle.caption.copyWith(fontSize: jcs14),
      StyleSizeDropdown.large: JcTextStyle.caption.copyWith(fontSize: jcs16),
    }[widget.styleSize];

    final borderColor =
        controller.text.isEmpty ? widget.borderColor : JcColors.pri600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        gap8,
        Padding(
          padding: const EdgeInsets.only(bottom: jcs4),
          child: Row(
            children: [
              Text(
                widget.messageLabel,
                style: JcTextStyle.overline.sec600,
              ),
              const Spacer(),
              if (widget.isOptional)
                Text(
                  '*Opcional',
                  style: JcTextStyle.overline.gs800,
                ),
            ],
          ),
        ),
        SizedBox(
          height: height,
          child: DropdownButtonFormField<String>(
            value: selectedItem,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: jcs16),
              label: Text(widget.label!, style: textStyle),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                  width: widget.widthBorder,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
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
            ),
            hint: Text(
              widget.hintText,
              style: textStyle?.copyWith(
                color: JcColors.sec600,
                fontSize: textStyle.fontSize,
              ),
            ),
            icon: Icon(Icons.keyboard_arrow_down, size: iconSize),
            items: widget.items.map((method) {
              return DropdownMenuItem<String>(
                value: method,
                child: Text(
                  method,
                  style: textStyle,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (mounted) {
                setState(() {
                  selectedItem = value;
                  if (value != null) {
                    controller.text = value;
                  } else {
                    controller.clear();
                  }
                });
                widget.onChanged?.call(value);
              }
            },
          ),
        ),
        gap4,
      ],
    );
  }
}
