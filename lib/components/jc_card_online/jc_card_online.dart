import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jc_module/jc_module.dart';

class JcCardOnline extends ConsumerStatefulWidget {
  const JcCardOnline({
    required this.name,
    required this.color,
    required this.onPressed,
    required this.backgroundColor,
    super.key,
  });
  final String name;
  final Color color;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  ConsumerState<JcCardOnline> createState() => _JcCardOnlineState();
}

class _JcCardOnlineState extends ConsumerState<JcCardOnline> {
  String formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    //final remainingTime = ref.watch(tokenTimeProvider);

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.backgroundColor,
      ),
      onPressed: widget.onPressed,
      child: Row(
        children: [
          const Icon(
            Icons.fiber_manual_record,
            size: 16,
            color: JcColors.succ700, //remainingTime > 0 ?
            //JcColors.succ700 : JcColors.err700,
          ),
          space6,
          Text(
            widget.name, // remainingTime > 0 ? widget.name : 'offline',
            style: JcTextStyle.caption.gsWhite,
          ), /* 
          space8,
          if (remainingTime <= 0)
            Container(
              width: 80,
              height: 24,
              padding: padSy4.copyWith(
                top: 2,
                bottom: 2,
                left: 0,
                right: 0,
              ),
              decoration: BoxDecoration(
                color: JcColors.err500,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  '00:00:00',
                  style: JcTextStyle.button2.gsWhite.w800,
                ),
              ),
            )
          else
            Container(
              width: 80,
              height: 24,
              padding: padSy4.copyWith(
                top: 2,
                bottom: 2,
                left: 0,
                right: 0,
              ),
              decoration: BoxDecoration(
                color: JcColors.succ700,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  formatTime(remainingTime),
                  style: JcTextStyle.button2.gsWhite.w800,
                ),
              ),
            ),
          space4, */
        ],
      ),
    );
  }
}
