import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/components/jc_order/widgets/widgets.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleOrderHistoryScreen extends StatefulWidget {
  const ExampleOrderHistoryScreen({super.key});

  @override
  ExampleOrderHistoryScreenState createState() =>
      ExampleOrderHistoryScreenState();
}

class ExampleOrderHistoryScreenState extends State<ExampleOrderHistoryScreen> {
  bool deletedProduct = false;
  String usecode = '';
  String points = '10';
  final List<UserOrder> userOrder = [
    UserOrder(
      amount: 3,
      typeDocument: 'DNI',
      numberDocument: '465465456',
      date: '10/09/2024 - 8:20pm',
      userCode: '3RCE8A6',
      totalAmount: 20,
      orderNumber: '',
    ),
    UserOrder(
      amount: 15,
      typeDocument: 'DNI',
      numberDocument: '46525918',
      date: '10/08/2024 - 8:20pm',
      userCode: '3RCE8A6',
      totalAmount: 30,
      orderNumber: '',
    ),
    UserOrder(
      amount: 13,
      totalAmount: 40,
      typeDocument: 'DNI',
      numberDocument: '46526918',
      date: '10/08/2024 - 8:20pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 10,
      totalAmount: 45,
      typeDocument: 'DNI',
      numberDocument: '46526998',
      date: '10/08/2024 - 8:20pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 11,
      totalAmount: 43,
      typeDocument: 'DNI',
      numberDocument: '40026998',
      date: '10/08/2024 - 8:20pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 13,
      totalAmount: 46,
      typeDocument: 'DNI',
      numberDocument: '4002008',
      date: '10/08/2024 - 8:20pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 10,
      totalAmount: 66,
      typeDocument: 'DNI',
      numberDocument: '4000008',
      date: '10/08/2024 - 8:20pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 5,
      totalAmount: 25,
      typeDocument: 'DNI',
      numberDocument: '46540001',
      date: '10/08/2024 - 9:00pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 8,
      totalAmount: 35,
      typeDocument: 'DNI',
      numberDocument: '46540002',
      date: '10/08/2024 - 9:30pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 12,
      totalAmount: 50,
      typeDocument: 'DNI',
      numberDocument: '46540003',
      userCode: '3RCE8A6',
      date: '10/08/2024 - 10:00pm',
      orderNumber: '',
    ),
    UserOrder(
      amount: 98,
      totalAmount: 90,
      typeDocument: 'DNI',
      numberDocument: '40040003',
      date: '10/08/2024 - 10:00pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
    UserOrder(
      amount: 99,
      totalAmount: 99,
      typeDocument: 'DNI',
      numberDocument: '40040022',
      date: '10/08/2024 - 10:00pm',
      userCode: '3RCE8A6',
      orderNumber: '',
    ),
  ];

  List<UserOrder> filteredOrders = [];

  @override
  void initState() {
    super.initState();

    filteredOrders = List.from(userOrder);
  }

  void _filterOrders(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredOrders = List.from(userOrder);
      } else {
        filteredOrders = userOrder
            .where(
              (order) =>
                  order.numberDocument.contains(query) ||
                  order.userCode!.contains(query),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JcColors.gs200,
      appBar: AppBar(
        backgroundColor: JcColors.gs200,
        title: Text(
          'Lista y busca',
          style: JcTextStyle.h6,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          gap16,
          if (deletedProduct) ...[
            DeletedProduct(
              deletedProduct: () {
                setState(() {
                  deletedProduct = false;
                });
              },
            ),
          ] else
            SearchOrder(
              isCameraActivated: true,
              onPressedCamera: () {
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    usecode = '333asdsa';
                  });
                });
              },
              onSearch: _filterOrders,
              textScan: usecode,
            ),
          gap16,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: filteredOrders.length,
              itemBuilder: (context, i) {
                filteredOrders.isNotEmpty;
                return JcOrder(
                  numberDocument: filteredOrders[i].numberDocument,
                  typeDocument: filteredOrders[i].typeDocument,
                  date: filteredOrders[i].date,
                  quantity: filteredOrders[i].amount,
                  totalAmount: filteredOrders[i].totalAmount,
                  userCode: filteredOrders[i].userCode!,
                  dismissDirection: () {
                    showDialogMessagePopupDelete(
                      points: points,
                      userCode: filteredOrders[i].userCode!,
                      context,
                      message:
                          'El pedido de ${filteredOrders[i].numberDocument}'
                          ' sera eliminado y se devolverán'
                          ' los puntos al usuario',
                      onPressedCancel: () {
                        Navigator.pop(context);
                      },
                      onPressedConfirm: () {
                        Navigator.pop(context);
                        setState(() {
                          deletedProduct = true;
                          userOrder.removeAt(i);
                          filteredOrders.removeAt(i);
                        });

                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            deletedProduct = false;
                          });
                        });
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserOrder {
  UserOrder({
    required this.typeDocument,
    required this.numberDocument,
    required this.date,
    required this.amount,
    required this.totalAmount,
    required this.orderNumber,
    this.userCode,
  });
  final String typeDocument;
  final String numberDocument;
  final String date;
  final double amount;
  final double totalAmount;
  final String orderNumber;
  final String? userCode;
}
