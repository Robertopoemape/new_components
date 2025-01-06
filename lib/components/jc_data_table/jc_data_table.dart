import 'package:flutter/material.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

class JcDataTable extends StatelessWidget {
  const JcDataTable({
    required this.products,
    this.symbolMoney = SymbolMoney.sol,
    this.nameTitle = 'Producto',
    super.key,
  });
  final String nameTitle;
  final List<ModelReport> products;

  final SymbolMoney symbolMoney;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: JcColors.gs500,
        ),
        verticalInside: BorderSide(
          color: JcColors.gs500,
        ),
        bottom: BorderSide(
          color: JcColors.gs500,
        ),
      ),
      columnWidths: const {
        0: FlexColumnWidth(1.4),
        1: FlexColumnWidth(0.7),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: JcColors.gs400,
            border: Border.all(color: JcColors.gs500),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          children: [
            _buildTableCell(nameTitle, isHeader: true),
            _buildTableCell('Cant.', isHeader: true),
            _buildTableCell('Precio', isHeader: true),
            _buildTableCell('Subtotal', isHeader: true),
          ],
        ),
        for (final product in products)
          TableRow(
            children: [
              _buildTableCell(product.name),
              _buildTableCell(product.quantity),
              _buildTableCell('${symbolMoney.symbol}${product.price}'),
              _buildTableCell('${symbolMoney.symbol}${product.subtotal}'),
            ],
          ),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: isHeader ? JcTextStyle.body2.gs900 : JcTextStyle.body2.sec600,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class ModelReport {
  ModelReport({
    required this.name,
    required this.quantity,
    required this.price,
    required this.subtotal,
  });
  final String name;
  final String quantity;
  final String price;
  final String subtotal;
}
