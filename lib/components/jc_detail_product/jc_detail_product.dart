import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_detail_product/image_build.dart';
import 'package:jc_module/core/configs/services/symbol_money.dart';
import 'package:jc_module/core/core.dart';

class JcDetailProduct extends StatefulWidget {
  const JcDetailProduct({
    this.title = 'Taco al Pastor',
    this.description = 'Carne de cerdo, Jugo de piña, Vinagre, Ajo, '
        'Chilewrewrewres, Especias, Tortillas de maíz, '
        'Cebolla, Cilantro, Piña, Limón, Salsa.',
    this.price = '10.00',
    this.symbol = SymbolMoney.point,
    this.imageUrl,
    super.key,
  });

  final String title;
  final String description;
  final String price;
  final SymbolMoney symbol;
  final String? imageUrl;

  @override
  State<JcDetailProduct> createState() => _JcDetailProductState();
}

class _JcDetailProductState extends State<JcDetailProduct> {
  bool isExpanded = false;

  void _toggleViewMore() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final truncatedDescription = widget.description.length > 120
        ? '${widget.description.substring(0, 120)}...'
        : widget.description;
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.5,
          child: ImageBuild(
            pathImage: widget.imageUrl,
          ),
        ),
        Padding(
          padding: padSy16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: JcTextStyle.h6.w700),
              gap16,
              GestureDetector(
                onTap: _toggleViewMore,
                child: RichText(
                  text: TextSpan(
                    style: JcTextStyle.caption,
                    children: [
                      TextSpan(
                        text: isExpanded
                            ? widget.description
                            : truncatedDescription,
                      ),
                      if (widget.description.length > 120)
                        TextSpan(
                          text: isExpanded ? ' Ver menos' : ' Ver más',
                          style: JcTextStyle.caption.pri700.w500,
                        ),
                    ],
                  ),
                ),
              ),
              gap16,
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(widget.symbol.symbol, style: JcTextStyle.h5.w900),
                  space4,
                  Text(widget.price, style: JcTextStyle.h5.w900),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
