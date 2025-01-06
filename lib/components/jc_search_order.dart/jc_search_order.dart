import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class SearchOrder extends StatefulWidget {
  const SearchOrder({
    required this.onSearch,
    this.isCameraActivated = false,
    this.textScan,
    this.onPressedCamera,
    this.labelText = 'Buscar por DNI, Cód. alfanumérico',
    super.key,
  });

  final VoidCallback? onPressedCamera;
  final ValueChanged<String> onSearch;
  final String? textScan;
  final bool isCameraActivated;
  final String? labelText;

  @override
  SearchOrderState createState() => SearchOrderState();
}

class SearchOrderState extends State<SearchOrder> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _onSearchChanged() {
    widget.onSearch(searchController.text);
  }

  void _cancelSearch() {
    searchController.clear();
    _focusNode.unfocus();
    widget.onSearch('');
  }

  @override
  void initState() {
    super.initState();

    searchController.addListener(_onSearchChanged);
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant SearchOrder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.textScan != null &&
        widget.textScan!.isNotEmpty &&
        widget.textScan != oldWidget.textScan) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          searchController.text = widget.textScan!;
        }
      });
    }
  }

  @override
  void dispose() {
    searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              focusNode: _focusNode,
              style: JcTextStyle.body2.sec600,
              decoration: InputDecoration(
                labelStyle: JcTextStyle.body2.sec600,
                labelText: widget.labelText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: JcColors.gs700,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: JcColors.gs700,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: JcColors.sec600,
                    width: 1.5,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: JcColors.sec300,
                  size: 32,
                ),
                suffixIcon: searchController.text.isNotEmpty
                    ? InkWell(
                        onTap: _cancelSearch,
                        child: const Icon(
                          Icons.close_outlined,
                          color: JcColors.sec600,
                          size: 25,
                        ),
                      )
                    : _focusNode.hasFocus
                        ? null
                        : widget.isCameraActivated
                            ? InkWell(
                                onTap: widget.onPressedCamera,
                                child: const Icon(
                                  Icons.camera_enhance_outlined,
                                  color: JcColors.sec600,
                                  size: 32,
                                ),
                              )
                            : null,
              ),
            ),
          ),
          space8,
          if (_focusNode.hasFocus)
            TextButton(
              onPressed: _cancelSearch,
              child: Text(
                'Cancelar',
                style: JcTextStyle.button1.sec600,
              ),
            ),
        ],
      ),
    );
  }
}
