import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/components.dart';
import 'package:jc_module/jc_module.dart' as m;
import 'package:jc_module/modules/jc_scanner/types_scan/types_scan.dart';

enum ScanType {
  qr('Modo cámara activo'),
  infrared('Escanear infrarojo'),
  dni('Escanear DNI');

  const ScanType(this.name);
  final String name;
}

@RoutePage()
class JcScannerScreen extends StatefulWidget {
  const JcScannerScreen({
    required this.onChangedCode,
    this.titleEvent = 'Futuro Incierto 25 años',
    this.countryEvent = 'Lima',
    this.isShowConfig = true,
    this.onToggleOnline,
    super.key,
  });
  final String? titleEvent;
  final String? countryEvent;
  final Function(String, ScanType) onChangedCode;
  final bool? isShowConfig;
  final VoidCallback? onToggleOnline;

  @override
  State<JcScannerScreen> createState() => _JcScannerScreenState();
}

class _JcScannerScreenState extends State<JcScannerScreen> {
  ScanType _scanType = ScanType.qr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: m.JcColors.bgcblack,
        iconTheme: const IconThemeData(color: m.JcColors.gsWhite),
        title: Text('Escáner', style: m.JcTextStyle.body2.w800.gsWhite),
        actions: [
          m.JcCardOnline(
            backgroundColor: Colors.transparent,
            name: 'Online',
            color: m.JcColors.succ600,
            onPressed: widget.onToggleOnline ?? () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _buildScanner(),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: m.padSy16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: m.padSy6,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border: Border.all(
                        color: m.JcColors.sec400,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings_rounded,
                          color: m.JcColors.gsWhite,
                          size: 18,
                        ),
                        m.space6,
                        Text(
                          _scanType.name,
                          style: m.JcTextStyle.caption.gsWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: m.padSy16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titleEvent!,
                        style: m.JcTextStyle.body2.gsWhite.w800,
                      ),
                      m.gap8,
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          color: m.JcColors.gsWhite,
                        ),
                        child: Padding(
                          padding: m.padSy6.copyWith(top: 2, bottom: 2),
                          child: Text(
                            widget.countryEvent!,
                            style: m.JcTextStyle.overline.w600.gs1000,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showButtonSheetEnter(
                        context: context,
                        labelButton: 'Validar',
                        title: 'Ingresa el código alfanumérico',
                        hintText: 'Ingresa el código aquí',
                        controller: TextEditingController(),
                        scanType: ScanType.qr,
                        onPressed: (code, scanType) async {
                          if (code.isEmpty) return;
                          Navigator.pop(context);
                          widget.onChangedCode(code, scanType);
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: m.JcColors.gsWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.isShowConfig!)
            Positioned(
              right: 0,
              bottom: 72,
              child: Padding(
                padding: m.padSy16,
                child: IconButton(
                  onPressed: () => showSelectedTypeScan(
                    scanType: _scanType,
                    context: context,
                    onPressed: (scanType) {
                      setState(() => _scanType = scanType);
                    },
                  ),
                  icon: const Icon(
                    Icons.settings_rounded,
                    color: m.JcColors.gsWhite,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildScanner() {
    switch (_scanType) {
      case ScanType.qr:
        return QrScan(
          onChangedCode: (code) {
            widget.onChangedCode(code, _scanType);
          },
        );
      case ScanType.infrared:
        return InfraredScan(
          onChangedCode: (code) {
            widget.onChangedCode(code, _scanType);
          },
        );
      case ScanType.dni:
        return DniScan(
          onChangedCode: (code) {
            widget.onChangedCode(code, _scanType);
          },
        );
    }
  }

  void showSelectedTypeScan({
    required BuildContext context,
    required ScanType scanType,
    required Function(ScanType scanType) onPressed,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: m.JcColors.gsWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      builder: (context) {
        return SelectedTypeScanContent(
          scanType: scanType,
          onPressed: onPressed,
        );
      },
    );
  }
}

class SelectedTypeScanContent extends StatefulWidget {
  const SelectedTypeScanContent({
    required this.onPressed,
    required this.scanType,
    super.key,
  });
  final Function(ScanType scanType) onPressed;
  final ScanType scanType;

  @override
  SelectedTypeScanContentState createState() => SelectedTypeScanContentState();
}

class SelectedTypeScanContentState extends State<SelectedTypeScanContent> {
  ScanType selectedScanType = ScanType.qr;

  @override
  void initState() {
    selectedScanType = widget.scanType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: m.padSy16.copyWith(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ajustes de escaner', style: m.JcTextStyle.h6.w900.gs1000),
              m.gap16,
              Row(
                children: [
                  const Icon(Icons.qr_code_2_rounded, color: m.JcColors.gs1000),
                  m.space8,
                  Text(
                    'Modo de escaneo',
                    style: m.JcTextStyle.body2.w900.gs1000,
                  ),
                ],
              ),
              m.gap16,
              _buildScanOption(
                context: context,
                label: 'Cámara',
                icon: Icons.circle_outlined,
                scanType: ScanType.qr,
              ),
              m.gap8,
              _buildScanOption(
                context: context,
                label: 'Infrarojo',
                icon: Icons.circle_outlined,
                scanType: ScanType.infrared,
              ),
              m.gap8,
              _buildScanOption(
                context: context,
                label: 'Dni-Manual',
                icon: Icons.circle_outlined,
                scanType: ScanType.dni,
              ),
              m.gap16,
              m.JcButton(
                style: m.StyleButton.primary,
                onPressed: () {
                  widget.onPressed(selectedScanType);
                  Navigator.pop(context);
                },
                sizeStyle: m.SizeStyleButton.large,
                label: 'Cambiar',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScanOption({
    required BuildContext context,
    required String label,
    required IconData icon,
    required ScanType scanType,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedScanType = scanType;
            });
          },
          child: Row(
            children: [
              Icon(
                selectedScanType == scanType
                    ? Icons.radio_button_checked
                    : icon,
                color: selectedScanType == scanType
                    ? m.JcColors.succ600
                    : m.JcColors.gs1000,
              ),
              m.space8,
              Text(label, style: m.JcTextStyle.body1.gs1000),
            ],
          ),
        ),
        const Icon(Icons.info_rounded, color: m.JcColors.inf600),
      ],
    );
  }
}
