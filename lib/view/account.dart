import 'dart:io';

import 'package:fitbasix/controller/datacontroller.dart';
import 'package:fitbasix/view/custom/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File? image;
  final DataController dataCont = Get.put(DataController());
  // Future pickImage(ImageSource source) async {
  //   // try {
  //   //   final image = await ImagePicker().pickImage(source: source);
  //   //   if (image == null) return;
  //   //   final imageTemp = File(image.path);
  //   //   setState(() {
  //   //     this.image = imageTemp;
  //   //   });
  //   // } on PlatformException catch (e) {
  //   //   print("Failed to pick image: $e");
  //   // }
  //   var permissionStatus = await Permission.accessMediaLocation.status;
  //   try {
  //     if (permissionStatus.isGranted) {
  //       final image = await ImagePicker().pickImage(source: source);
  //       if (image == null) return;
  //       final imageTemp = File(image.path);
  //       setState(() {
  //         this.image = imageTemp;
  //       });
  //     } else if (permissionStatus.isDenied) {
  //       await Permission.accessMediaLocation.request();
  //     } else {
  //       print("No permission");
  //     }
  //   } on PlatformException catch (e) {
  //     print("Failed to pick image: $e");
  //   }
  // }
  Future pickImage(ImageSource source) async {
    var permissionStatus = await Permission.accessMediaLocation.status;
    try {
      if (permissionStatus.isGranted) {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState(() {
          this.image = imageTemp;
        });
      } else if (permissionStatus.isDenied) {
        await Permission.accessMediaLocation.request();
      } else {
        print("No permission");
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? ClipOval(
                    child: Image.file(
                      image!,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  )
                : FlutterLogo(
                    size: 160,
                  ),
            GestureDetector(
              onTap: (() => pickImage(ImageSource.gallery)),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: ",
              style: dateStyle,
            ),
            Obx((() => Text(
                  dataCont.Username.toString(),
                  style: boxTextStyle,
                ))),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Popup();
                    });
              },
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}

class Popup extends StatelessWidget {
  Popup({Key? key}) : super(key: key);
  final DataController dataCont = Get.put(DataController());
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: const Text("what's your name?"),
      content: TextField(
        controller: textController,
        autofocus: true,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: "Enter Your Name",
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            dataCont.updateUn(textController.text.obs);

            Get.back();
          },
        ),
      ],
    );
  }
}
