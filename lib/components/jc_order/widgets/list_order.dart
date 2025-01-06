import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({
    required this.numberDocument,
    required this.typeDocument,
    required this.date,
    required this.quantity,
    required this.totalAmount,
    required this.dismissDirection,
    required this.userCode,
    required this.paymentMethod,
    required this.symbolMoney,
    super.key,
  });

  final String? numberDocument;
  final String? typeDocument;
  final String date;
  final double quantity;
  final double totalAmount;
  final String userCode;
  final Function()? dismissDirection;
  final String? paymentMethod;
  final SymbolMoney? symbolMoney;

  @override
  ListOrderState createState() => ListOrderState();
}

class ListOrderState extends State<ListOrder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onLongPress() {
    _animationController.forward();
  }

  void _onCancel() {
    _animationController.reverse();
  }

  void _onDelete() {
    widget.dismissDirection?.call();
    _animationController.reverse();
  }

  String get documentUser {
    final typeDocument = widget.typeDocument ?? '-';
    final numberDocument = widget.numberDocument ?? '-';
    return '$typeDocument : $numberDocument';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: JcColors.err600,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: const Icon(
                Icons.delete_outlined,
                color: JcColors.gsWhite,
                size: 32,
              ),
              onPressed: _onDelete,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(-_animationController.value * 70, 0),
              child: GestureDetector(
                onLongPress: _onLongPress,
                onTap: _onCancel,
                child: child,
              ),
            );
          },
          child: _buildOrderContent(),
        ),
      ],
    );
  }

  Widget _buildOrderContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: JcColors.gs800,
          width: jcs05,
        ),
        color: JcColors.gs200,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                documentUser,
                style: JcTextStyle.subtitle1.sec600,
              ),
              Text(
                widget.date,
                style: JcTextStyle.body2.gs900,
              ),
            ],
          ),
          Row(
            children: [
              if (widget.paymentMethod != null &&
                  widget.paymentMethod!.isNotEmpty) ...[
                Text(
                  widget.paymentMethod!,
                  style: JcTextStyle.body2.gs900,
                ),
              ] else ...[
                Text(
                  'Cant: ${widget.quantity.toStringAsFixed(0)}',
                  style: JcTextStyle.body2.w800.gs900,
                ),
                space8,
                Text(
                  'Cód: ${widget.userCode}',
                  style: JcTextStyle.body2.w800.gs900,
                ),
              ],
              const Spacer(),
              Text(
                'Total: ${widget.symbolMoney!.symbol}${widget.totalAmount.toStringAsFixed(2)}',
                style: JcTextStyle.body2.w800,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
