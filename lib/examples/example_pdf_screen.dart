import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_pdf/sales_summary.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExamplePdfScreen extends StatefulWidget {
  const ExamplePdfScreen({super.key});

  @override
  ExamplePdfScreenState createState() => ExamplePdfScreenState();
}

class ExamplePdfScreenState extends State<ExamplePdfScreen> {
  @override
  void initState() {
    super.initState();
  }

  final data = [
    ['1', 'MARGARITA', '6.00', '18.00', '108.0000'],
    ['2', 'MARGARITA PRESIDENTE', '30.00', '25.0000', '750.0000'],
    ['3', 'TEQUILA TONIC', '1.00', '18.00', '18.00'],
    ['4', 'TEQUILA GINGERALE', '3.00', '18.00', '54.00'],
    ['5', 'PALOMITAS', '7.00', '18.00', '126.00'],
    ['6', 'SHOT 1800', '9.00', '20.00', '180.00'],
    ['7', 'SHOT CRISTALINO', '20.00', '25.00', '500.00'],
    [
      '8',
      'BOTELLA DE TEQUILA CRISTALINO DE 700ML',
      '36.00',
      '350.00',
      '12600.00',
    ],
    ['9', 'HEINEKEN LATA DE 330 ML', '2.00', '10.00', '20.00'],
    ['10', 'INCA KOLA', '1.00', '5.00', '5.00'],
    ['11', 'COCA COLA', '1.00', '5.00', '5.00'],
    ['12', 'MARGARITA', '4.00', '18.00', '72.00'],
    ['13', 'MARGARITA PRESIDENTE', '21.00', '25.00', '525.00'],
    ['14', 'TEQUILA SUNRISE', '1.00', '18.00', '18.00'],
    ['15', 'TEQUILA TONIC', '2.00', '18.00', '36.00'],
    ['16', 'TEQUILA GINGERALE', '2.00', '18.00', '36.00'],
    ['17', 'PALOMITAS', '1.00', '18.00', '18.00'],
    ['18', 'SHOT 1800', '1.00', '20.00', '20.00'],
    ['19', 'SHOT CRISTALINO', '12.00', '25.00', '300.00'],
    [
      '20',
      'BOTELLA DE TEQUILA CRISTALINO DE 700ML',
      '14.00',
      '350.90',
      '3700.00',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final listProduct = <ModelReport>[
      ModelReport(
        name: 'Prdoucto1',
        quantity: '2',
        price: '1,120.20',
        subtotal: '1,120.20',
      ),
      ModelReport(
        name: 'Prdoucto2',
        quantity: '2',
        price: '1,120.20',
        subtotal: '1,120.20',
      ),
    ];

    return Scaffold(
      backgroundColor: JcColors.gs200,
      appBar: AppBar(
        backgroundColor: JcColors.gs200,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JcButton(
            style: StyleButton.primary,
            label: 'Proveedor',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => Scaffold(
                    appBar: AppBar(
                      title: Text(
                        'Reporte',
                        style: JcTextStyle.body1.gsWhite,
                      ),
                    ),
                    body: Stack(
                      children: [
                        Column(
                          children: [
                            JcCardDateBase.primary(
                              date: 'Mier. 1 de Set',
                              hour: '10:30 AM a 9:00 PM',
                            ),
                            JcDataTable(
                              products: listProduct,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: JcFloatingBase.downloadReportSecondary(
                            total: 1000,
                            quantity: '5.00',
                            onPressed: () {
                              jcPdfSalesSummary(
                                eventId: '1231',
                                data: data,
                                event: 'Gochiso',
                                reportDate: '29/09 al 10/10',
                                reportHour: '9:00am a 10:00pm',
                                cashierEmail: 'Cajero1@joinnus.com',
                                cashierNames: 'Juan Ortiz',
                                organizer: 'Nombre del organizador',
                                symbolMoney: SymbolMoney.sol,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          gap8,
          JcButton(
            style: StyleButton.primary,
            label: 'Vendedor',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => Scaffold(
                    appBar: AppBar(
                      title: Text(
                        'Reporte',
                        style: JcTextStyle.body1.gsWhite,
                      ),
                    ),
                    body: Stack(
                      children: [
                        Column(
                          children: [
                            JcCardDateBase.primary(
                              date: 'Mier. 1 de Set',
                              hour: '10:30 AM a 9:00 PM',
                            ),
                            JcDataTable(
                              nameTitle: 'Método de pago',
                              products: listProduct,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: JcFloatingBase.downloadReportPrimary(
                            total: 2000,
                            onPressed: () {
                              jcPdfSalesByProduct(
                                eventId: '1231',
                                data: data,
                                event: 'Gochiso',
                                reportDate: '29/09 al 10/10',
                                reportHour: '9:00am a 10:00pm',
                                organizer: 'Nombre del organizador',
                                symbolMoney: SymbolMoney.point,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
