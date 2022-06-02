import 'package:fitbasix/controller/datacontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Popup extends StatelessWidget {
  Popup({
    Key? key,
  }) : super(key: key);
  final DataController dataCont = Get.put(DataController());
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: const Text("Water Consumed ?"),
      content: TextField(
        controller: textController,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "In ml only ",
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            double contD = double.parse(
                textController.text.isEmpty ? "0.0" : textController.text);
            var x = contD / 1000;
            dataCont.waterConsIncrement(x);
            Get.back();
          },
        ),
      ],
    );
  }
}
