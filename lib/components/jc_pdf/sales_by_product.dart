import 'dart:io';

import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:intl/intl.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> jcPdfSalesByProduct({
  required String eventId,
  required String event,
  required String reportDate,
  required String reportHour,
  required String organizer,
  required SymbolMoney symbolMoney,
  required List<List<String>> data,
}) async {
  final pdf = pw.Document();
  final currentDate = DateTime.now();
  final formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
  final ttf = pw.Font.ttf(
    await _loadFont('packages/jc_module/assets/poppins/Poppins-Black.ttf'),
  );
  final svgImg =
      await rootBundle.loadString('packages/jc_module/assets/svg/logo.svg');

  const maxRowsPerPageFirst = 14;
  const maxRowsPerPageOther = 18;
  final totalPages = _calculateTotalPages(
    data.length,
    maxRowsPerPageFirst,
    maxRowsPerPageOther,
  );
  final totalTotals = _calculateTotals(data);

  for (var pageIndex = 0; pageIndex < totalPages; pageIndex++) {
    final pageData =
        _getPageData(data, pageIndex, maxRowsPerPageFirst, maxRowsPerPageOther);
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => _buildPage(
          pageIndex,
          totalPages,
          pageData,
          totalTotals,
          ttf,
          svgImg,
          formattedDate,
          event,
          reportDate,
          reportHour,
          organizer,
          symbolMoney,
        ),
      ),
    );
  }

  await _saveAndOpenPdf(pdf, eventId);
}

Future<ByteData> _loadFont(String path) async {
  return rootBundle.load(path);
}

int _calculateTotalPages(
  int dataLength,
  int maxRowsPerPageFirst,
  int maxRowsPerPageOther,
) {
  return dataLength > maxRowsPerPageFirst
      ? ((dataLength - maxRowsPerPageFirst) / maxRowsPerPageOther).ceil() + 1
      : 1;
}

List<List<String>> _getPageData(
  List<List<String>> data,
  int pageIndex,
  int maxRowsPerPageFirst,
  int maxRowsPerPageOther,
) {
  final startIndex = pageIndex == 0
      ? 0
      : maxRowsPerPageFirst + (pageIndex - 1) * maxRowsPerPageOther;
  final endIndex = pageIndex == 0
      ? (maxRowsPerPageFirst < data.length ? maxRowsPerPageFirst : data.length)
      : (startIndex + maxRowsPerPageOther < data.length
          ? startIndex + maxRowsPerPageOther
          : data.length);
  return data.sublist(startIndex, endIndex);
}

pw.Widget _buildPage(
  int pageIndex,
  int totalPages,
  List<List<String>> pageData,
  Map<String, double> totalTotals,
  pw.Font ttf,
  String svgImg,
  String formattedDate,
  String event,
  String reportDate,
  String reportHour,
  String organizer,
  SymbolMoney symbolMoney,
) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.SvgImage(svg: svgImg),
      pw.SizedBox(height: 30),
      if (pageIndex == 0)
        _buildHeader(
          ttf,
          event,
          reportDate,
          reportHour,
          organizer,
          symbolMoney,
        ),
      _buildTable(pageData, totalTotals, symbolMoney),
      if (pageIndex == totalPages - 1)
        _buildTotalsTable(totalTotals, symbolMoney, ttf),
      pw.Spacer(),
      _buildFooter(formattedDate, pageIndex, totalPages),
    ],
  );
}

pw.Widget _buildFooter(String formattedDate, int pageIndex, int totalPages) {
  return pw.Row(
    children: [
      pw.Text(
        'Fecha de descarga: $formattedDate',
        style: const pw.TextStyle(fontSize: 10),
      ),
      pw.Spacer(),
      pw.Text(
        'Página ${pageIndex + 1}/$totalPages',
        style: const pw.TextStyle(fontSize: 10),
      ),
    ],
  );
}

Future<void> _saveAndOpenPdf(pw.Document pdf, String eventId) async {
  final directory = await getTemporaryDirectory();
  final file = File(
    '${directory.path}/-$eventId-${DateTime.now().microsecondsSinceEpoch}.pdf',
  );
  await file.writeAsBytes(await pdf.save());
  final result = await OpenFile.open(file.path);
  print('Resultado de la apertura del archivo: ${result.message}');
}

Map<String, double> _calculateTotals(List<List<String>> data) {
  final totalCol1 = data.length.toDouble();
  var totalCol3 = 0.0;
  var totalCol5 = 0.0;

  for (final row in data) {
    totalCol3 += double.tryParse(row[2]) ?? 0;
    totalCol5 += double.tryParse(row[4]) ?? 0;
  }

  return {
    'totalCol1': totalCol1,
    'totalCol3': totalCol3,
    'totalCol5': totalCol5,
  };
}

pw.Widget _buildTotalsTable(
  Map<String, double> totals,
  SymbolMoney symbolMoney,
  pw.Font? font,
) {
  final backgroundColor = PdfColor.fromHex('#E4EDF5');
  final colorBorder = PdfColor.fromHex('#C9DAEC');
  final textColor = PdfColor.fromHex('#4B545C');
  final totalColor = PdfColor.fromHex('#031425');

  return pw.Table(
    border: pw.TableBorder.all(color: colorBorder),
    columnWidths: {
      0: const pw.FlexColumnWidth(0.25),
      1: const pw.FlexColumnWidth(1.25),
      2: const pw.FlexColumnWidth(0.31),
      3: const pw.FlexColumnWidth(),
    },
    children: [
      pw.TableRow(
        children: [
          _buildTableCell(
            totals['totalCol1']!.toInt().toString(),
            isHeader: true,
            backgroundColor: backgroundColor,
            fontSize: 18,
            textColor: textColor,
            font: font,
          ),
          _buildTableCell(
            'Productos',
            backgroundColor: backgroundColor,
            isHeader: true,
            fontSize: 18,
            font: font,
            textColor: textColor,
          ),
          _buildTableCell(
            '${totals['totalCol3']?.toStringAsFixed(0)}',
            backgroundColor: backgroundColor,
            isHeader: true,
            fontSize: 18,
            font: font,
            textColor: textColor,
          ),
          _buildTableCell(
            '${symbolMoney.symbol} ${totals['totalCol5']?.toStringAsFixed(2)}',
            isHeader: true,
            backgroundColor: backgroundColor,
            fontSize: 18,
            textAlign: pw.TextAlign.right,
            textColor: totalColor,
            font: font,
          ),
        ],
      ),
    ],
  );
}

pw.Widget _buildHeader(
  pw.Font ttf,
  String event,
  String reportDate,
  String reportHour,
  String organizer,
  SymbolMoney symbolMoney,
) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      _buildInfoRow('Evento: ', event, ttf),
      _buildInfoRow('Organizado por: ', organizer, ttf, isExpanded: true),
      _buildInfoRow('Fecha del reporte: ', reportDate, ttf),
      _buildInfoRow('Hora del reporte: ', reportHour, ttf),
      pw.SizedBox(height: 20),
    ],
  );
}

pw.Widget _buildInfoRow(
  String label,
  String value,
  pw.Font ttf, {
  bool isExpanded = false,
}) {
  return pw.Row(
    children: [
      pw.Text(label, style: const pw.TextStyle(fontSize: 14)),
      if (isExpanded)
        pw.Expanded(
          child: pw.Text(value, style: pw.TextStyle(font: ttf, fontSize: 16)),
        )
      else
        pw.Text(value, style: pw.TextStyle(font: ttf, fontSize: 16)),
    ],
  );
}

pw.Widget _buildTable(
  List<List<String>> data,
  Map<String, double> totals,
  SymbolMoney symbolMoney,
) {
  final backgroundColor = PdfColor.fromHex('#E4EDF5');
  final columnWidths = {
    0: const pw.FlexColumnWidth(0.4),
    1: const pw.FlexColumnWidth(2),
    2: const pw.FlexColumnWidth(0.5),
    3: const pw.FlexColumnWidth(0.8),
    4: const pw.FlexColumnWidth(0.8),
  };

  return pw.Table(
    border: pw.TableBorder.all(color: backgroundColor),
    columnWidths: columnWidths,
    children: [
      pw.TableRow(
        children: [
          _buildTableCell(
            '#',
            isHeader: true,
            backgroundColor: backgroundColor,
          ),
          _buildTableCell(
            'Producto',
            isHeader: true,
            backgroundColor: backgroundColor,
          ),
          _buildTableCell(
            'Cant',
            isHeader: true,
            backgroundColor: backgroundColor,
          ),
          _buildTableCell(
            'Puntos',
            isHeader: true,
            backgroundColor: backgroundColor,
          ),
          _buildTableCell(
            'Subtotal',
            isHeader: true,
            backgroundColor: backgroundColor,
          ),
        ],
      ),
      ...data.map((row) {
        return pw.TableRow(
          children: [
            _buildTableCell(row[0]),
            _buildTableCell(row[1]),
            _buildTableCell(double.parse(row[2]).toStringAsFixed(0)),
            _buildTableCell(
              '${symbolMoney.symbol} ${double.parse(row[3]).toStringAsFixed(0)}',
            ),
            _buildTableCell(
              '${symbolMoney.symbol} ${row[4]}',
            ),
          ],
        );
      }),
    ],
  );
}

pw.Widget _buildTableCell(
  String text, {
  bool isHeader = false,
  PdfColor? backgroundColor,
  double? fontSize,
  pw.TextAlign? textAlign,
  PdfColor? textColor,
  pw.Font? font,
}) {
  return pw.Container(
    color: backgroundColor,
    padding: const pw.EdgeInsets.all(8),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: fontSize ?? 12,
        color: textColor ?? PdfColors.black,
        font: font,
      ),
      textAlign: textAlign ?? pw.TextAlign.left,
    ),
  );
}
