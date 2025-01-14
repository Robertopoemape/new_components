import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleDetailBuyScreen extends StatefulWidget {
  const ExampleDetailBuyScreen({super.key});

  @override
  State<ExampleDetailBuyScreen> createState() => _ExampleDetailBuyScreenState();
}

class _ExampleDetailBuyScreenState extends State<ExampleDetailBuyScreen> {
  var labelCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          JcDetailProduct(
            imageUrl: JcImg.noImg.path,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: JcFloatingBase.addToCart(
              onPressed: () {},
              onPressedMinus: () {
                if (labelCount > 1) {
                  labelCount--;
                }

                setState(() {});
              },
              onPressedPlus: () {
                labelCount++;
                setState(() {});
              },
              labelCount: labelCount.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
