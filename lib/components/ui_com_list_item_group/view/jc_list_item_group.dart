import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

// Constants
const double kDefaultPadding = 16;
const double kHorizontalPadding = 16;
const double kBorderRadius = 8;
const double kFocusedBorderWidth = 2;
const double kEnabledBorderWidth = 1;
const double kBorderWidth = 1;
const double kItemMargin = 2;
const double kItemPadding = 4;
const double kIconSpacing = 8;

class JcListItemGroup extends StatefulWidget {
  const JcListItemGroup({
    required this.hintItem,
    required this.listItem,
    required this.valueSelectedItem,
    required this.onPressedApply,
    this.contentPadding = const EdgeInsets.all(kDefaultPadding),
    super.key,
  });

  final EdgeInsets contentPadding;
  final String hintItem;
  final List<String> listItem;
  final ValueChanged<String> valueSelectedItem;
  final VoidCallback onPressedApply;

  @override
  JcListItemGroupState createState() => JcListItemGroupState();
}

class JcListItemGroupState extends State<JcListItemGroup> {
  String? selectedItem;
  late TextEditingController _searchController;
  List<String> filteredListItems = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredListItems = widget.listItem;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    setState(() {
      filteredListItems = widget.listItem
          .where(
            (item) => item
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()),
          )
          .toList();
      if (selectedItem != null && !filteredListItems.contains(selectedItem)) {
        selectedItem = null;
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.contentPadding,
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      decoration: BoxDecoration(
        color: JcColors.pri200,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedItem,
          hint: Text(
            widget.hintItem,
            style: JcTextStyle.body2.sec400,
          ),
          items: _buildDropdownItems(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedItem = value;
                widget.valueSelectedItem(value);
              });
            }
          },
          isExpanded: true,
          style: JcTextStyle.body2.sec600.copyWith(
            color: Colors.white,
          ),
          dropdownColor: JcColors.gs300,
          iconEnabledColor: JcColors.sec600,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return [
      DropdownMenuItem<String>(
        enabled: false,
        child: Container(
          margin: const EdgeInsets.only(bottom: kItemMargin),
          child: TextField(
            controller: _searchController,
            style: const TextStyle(color: JcColors.sec600),
            decoration: InputDecoration(
              hintText: '',
              hintStyle: const TextStyle(color: JcColors.sec400),
              prefixIcon: const Icon(Icons.search, color: JcColors.sec400),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
                borderSide: const BorderSide(
                  color: JcColors.sec600,
                  width: kFocusedBorderWidth,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
                borderSide: const BorderSide(
                  color: JcColors.sec400,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
                borderSide: const BorderSide(
                  color: JcColors.sec600,
                ),
              ),
            ),
            onChanged: (text) {
              setState(_filterItems);
            },
          ),
        ),
      ),
      ...filteredListItems.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Container(
            decoration: BoxDecoration(
              color:
                  selectedItem == item ? JcColors.pri200 : Colors.transparent,
              borderRadius: BorderRadius.circular(kBorderRadius),
              border: Border.all(
                color:
                    selectedItem == item ? JcColors.pri200 : Colors.transparent,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kItemPadding),
              child: Row(
                children: [
                  if (selectedItem == item)
                    const Icon(
                      Icons.check_box,
                      color: JcColors.pri700,
                    )
                  else
                    const Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: JcColors.sec400,
                    ),
                  const SizedBox(width: kIconSpacing),
                  Text(
                    item,
                    style: JcTextStyle.body2.sec600,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList()
        ..add(
          DropdownMenuItem<String>(
            value: 'actions',
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: JcTextStyle.subtitle2.sec600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: JcColors.sec600, width: 2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showActionDialog('Aplicar');
                      },
                      child: Text(
                        'Aplicar',
                        style: JcTextStyle.subtitle2.sec600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    ];
  }

  void _showActionDialog(String action) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(action),
          content: Text('¿Deseas realizar la acción "$action"?'),
          actions: [
            TextButton(
              onPressed: widget.onPressedApply,
              child: Text(action),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
