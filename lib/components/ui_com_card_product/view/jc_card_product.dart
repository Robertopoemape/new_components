import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

class JcCardProduct extends StatefulWidget {
  const JcCardProduct._({
    required this.nameTitle,
    required this.onChanged,
    required this.onPressed,
    this.onRemoveProduct,
    this.price = 0.00,
    this.stock = 0,
    this.contentPadding = const EdgeInsets.all(jcs16),
    this.colorBorder = JcColors.gs600,
    this.backgroundColor = JcColors.gs100,
    this.showStock = true,
    this.symbolMoney,
    this.currentQuantity = 0,
  });

  factory JcCardProduct.primary({
    required String nameTitle,
    required ValueChanged<ProductInfo> onChanged,
    required VoidCallback onPressed,
    SymbolMoney? symbolMoney = SymbolMoney.sol,
    double price = 0.00,
    int stock = 0,
    EdgeInsets contentPadding = const EdgeInsets.all(jcs16),
    Color colorBorder = JcColors.gs600,
    Color backgroundColor = JcColors.gs100,
    int? currentQuantity,
  }) {
    return JcCardProduct._(
      nameTitle: nameTitle,
      onChanged: onChanged,
      price: price,
      stock: stock,
      contentPadding: contentPadding,
      colorBorder: colorBorder,
      backgroundColor: backgroundColor,
      symbolMoney: symbolMoney,
      onPressed: onPressed,
      currentQuantity: currentQuantity,
    );
  }

  factory JcCardProduct.secondary({
    required String nameTitle,
    required ValueChanged<ProductInfo> onChanged,
    required VoidCallback onRemoveProduct,
    required VoidCallback onPressed,
    SymbolMoney? symbolMoney = SymbolMoney.sol,
    double price = 0.00,
    int stock = 0,
    EdgeInsets contentPadding = const EdgeInsets.all(jcs16),
    int? currentQuantity,
  }) {
    return JcCardProduct._(
      nameTitle: nameTitle,
      onChanged: onChanged,
      onRemoveProduct: onRemoveProduct,
      price: price,
      stock: stock,
      contentPadding: contentPadding,
      showStock: false,
      symbolMoney: symbolMoney,
      onPressed: onPressed,
      currentQuantity: currentQuantity,
    );
  }

  final String nameTitle;
  final double price;
  final int stock;
  final EdgeInsets contentPadding;
  final Color colorBorder;
  final Color backgroundColor;
  final bool showStock;
  final ValueChanged<ProductInfo> onChanged;
  final VoidCallback? onRemoveProduct;
  final SymbolMoney? symbolMoney;
  final VoidCallback onPressed;
  final int? currentQuantity;

  @override
  State<JcCardProduct> createState() => _JcCardProductState();
}

class _JcCardProductState extends State<JcCardProduct> {
  int currentQuantity = 0;
  double currentPrice = 0;

  @override
  void initState() {
    super.initState();
    if (widget.currentQuantity != null) {
      setState(() {
        currentQuantity = widget.currentQuantity!;
      });
    }
  }

  @override
  void didUpdateWidget(covariant JcCardProduct oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentQuantity != widget.currentQuantity) {
      setState(() {
        currentQuantity = widget.currentQuantity ?? 0;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updatePriceAndNotify();
        });
      });
    }
  }

  void incrementQuantity() {
    if (currentQuantity < widget.stock) {
      setState(() {
        currentQuantity++;
        _updatePriceAndNotify();
      });
    }
  }

  void decrementQuantity() {
    if (currentQuantity > 0) {
      setState(() {
        currentQuantity--;
        if (!widget.showStock && currentQuantity == 0) {
          widget.onRemoveProduct?.call();
        } else {
          _updatePriceAndNotify();
        }
      });
    }
  }

  void _updatePriceAndNotify() {
    currentPrice = currentQuantity * widget.price;
    _notifyChanges();
  }

  void _notifyChanges() {
    widget.onChanged(
      ProductInfo(price: currentPrice, quantity: currentQuantity),
    );
  }

  String capEachWord(String text) {
    return text
        .toLowerCase()
        .split(' ')
        .map(
          (word) => word[0].toUpperCase() + word.substring(1),
        )
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: widget.contentPadding,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(
            color: widget.colorBorder,
            width: jcs07,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      capEachWord(widget.nameTitle),
                      style: JcTextStyle.h6.w700.sec900,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.showStock)
                    Text(
                      'Stock: ${widget.stock} disponible',
                      style: JcTextStyle.tinyCaption.sec900,
                    ),
                  Text(
                    '${widget.price.toStringAsFixed(2)} '
                    '${widget.symbolMoney?.symbol ?? ''}',
                    style: JcTextStyle.h5.sec900,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                if (currentQuantity > 0) ...[
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_rounded,
                      color: JcColors.sec600,
                      size: jcs36,
                    ),
                    onPressed: decrementQuantity,
                  ),
                  space4,
                  SizedBox(
                    width: jcs28,
                    child: Text(
                      currentQuantity.toString(),
                      style: JcTextStyle.body1.sec900,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                space4,
                IconButton(
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: widget.stock > 0 ? JcColors.sec600 : JcColors.sec200,
                    size: jcs36,
                  ),
                  onPressed: widget.stock > 0 ? incrementQuantity : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductInfo {
  ProductInfo({
    required this.price,
    required this.quantity,
  });

  final double price;
  final int quantity;
}
