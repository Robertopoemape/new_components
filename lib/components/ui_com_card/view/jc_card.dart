import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

class JcCard extends StatelessWidget {
  const JcCard({
    required this.nameTitle,
    this.nameCity = 'Lima',
    this.date = '15 de ago - 8:00PM',
    this.multiDate = '',
    this.marginPadding = const EdgeInsets.only(
      right: jcs16,
      left: jcs16,
      top: jcs4,
      bottom: jcs4,
    ),
    this.contentPadding = const EdgeInsets.all(jcs16),
    this.onTapJcCard,
    this.colorBorder = JcColors.gs600,
    this.backgroundColor = JcColors.gs100,
    super.key,
  });

  final String nameTitle;
  final String nameCity;
  final String date;
  final String multiDate;
  final EdgeInsets marginPadding;
  final EdgeInsets contentPadding;
  final VoidCallback? onTapJcCard;
  final Color colorBorder;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTapJcCard,
      child: Container(
        padding: contentPadding,
        margin: marginPadding,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(jcs16),
          border: Border.all(
            color: colorBorder,
            width: jcs2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  nameTitle,
                  style: JcTextStyle.subtitle2.sec900,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: JcColors.gs1000,
                  size: 16,
                ),
              ],
            ),
            gap8,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: const BoxDecoration(
                color: JcColors.gs200,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Text(
                nameCity,
                style: JcTextStyle.tinyCaption.w600.sec600,
              ),
            ),
            Row(
              children: [
                Text(
                  date,
                  style: JcTextStyle.tinyCaption.sec900,
                ),
                const Spacer(),
                if (multiDate.isNotEmpty)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: const BoxDecoration(
                      color: JcColors.gs200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      multiDate,
                      style: JcTextStyle.tinyCaption.sec900,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
