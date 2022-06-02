import 'package:fitbasix/view/custom/style.dart';
import 'package:flutter/material.dart';

class MiddleCard extends StatelessWidget {
  MiddleCard(
      {required this.icn,
      required this.head,
      required this.icnClr,
      required this.sndtxt,
      required this.trdtxt});
  final IconData icn;
  final Color icnClr;
  final String head;
  final String sndtxt;
  final String trdtxt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icn,
          color: icnClr,
          size: 40,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          head,
          style: boxTextStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          sndtxt,
          style:
              boxTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          trdtxt,
          style: boxTextStyle.copyWith(color: Color(0xffC0C0C0)),
        ),
      ],
    );
  }
}
