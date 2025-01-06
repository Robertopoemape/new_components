/*import 'package:flutter/material.dart';
import 'package:japp_qr_control/core/template/colors_manager.dart';
import 'package:japp_qr_control/core/template/textstyle_manager.dart';
import 'package:japp_qr_control/core/utils/button.dart';
import 'package:japp_qr_control/src/attend_by_code/domain/entities/check_code_multiple_entity.dart';

class MultipleScanInformation extends StatefulWidget {
  const MultipleScanInformation({
    required this.checkCodeMultiple,
    required this.onContinue,
    super.key,
  });
  final CheckCodeMultiple checkCodeMultiple;
  final VoidCallback onContinue;

  @override
  State<MultipleScanInformation> createState() =>
      _MultipleScanInformationState();
}

class _MultipleScanInformationState extends State<MultipleScanInformation> {
  String subtitleDetail(String ticketType, int total, int pendientes) {
    return '$total';
  }

  String subtitleDetailNewData(String ticketType, int total, int pendientes) {
    return '$pendientes';
  }

  String subtitleDetailTotal(String ticketType, int total, int pendientes) {
    final totalFinal = total - pendientes;
    return '$totalFinal';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiTickets Escaneados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Detalle de Tickets Escaneados',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.checkCodeMultiple.data!.tickets!.length,
                itemBuilder: (context, i) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.checkCodeMultiple.data!.tickets![i]
                                  .typeTicket!,
                              style: TypographyStyle.display21.black100,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total de Tickets: ',
                                style: TypographyStyle.body15.black100,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                subtitleDetail(
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .typeTicket!,
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .total!,
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .attended!,
                                ),
                                style: TypographyStyle.body18.black100.w600,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Total de Tickets Usados: ',
                                style: TypographyStyle.body15.black100,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                subtitleDetailNewData(
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .typeTicket!,
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .total!,
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .attended!,
                                ),
                                style: TypographyStyle.body18.black100.w600,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Pendientes por Scanear: ',
                                style: TypographyStyle.body15.black100,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                subtitleDetailTotal(
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .typeTicket!,
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .total!,
                                  widget.checkCodeMultiple.data!.tickets![i]
                                      .attended!,
                                ),
                                style: TypographyStyle.body18.black100.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Button(
              onPressed: widget.onContinue,
              label: 'Desea Escanear los restantes',
              radius: 10,
              color: green1100,
              styleButton: StyleButton.primary,
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Button(
              onPressed: () => Navigator.pop(context, true),
              label: 'Volver a Escanear',
              radius: 10,
              color: green1100,
              styleButton: StyleButton.primary,
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}
*/
