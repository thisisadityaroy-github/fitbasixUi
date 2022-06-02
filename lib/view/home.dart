import 'package:fitbasix/controller/datacontroller.dart';
import 'package:fitbasix/view/custom/middle_card.dart';
import 'package:fitbasix/view/custom/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'custom/popup.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DataController dataCont = Get.put(DataController());
  var MONTHS = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String formattedDateTime() {
    DateTime now = DateTime.now();
    return now.day.toString() + " " + MONTHS[now.month - 1] + "".toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: dateStyle),
                Text(formattedDateTime(), style: dateStyle),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: Get.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xff343434),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Water \nConsumed",
                              style: boxTextStyle,
                            ),
                            Icon(
                              Icons.opacity,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: Lottie.asset(
                            "assets/5922-water-loading.json",
                          ),
                        ),
                        Row(
                          children: [
                            Obx((() => Text(
                                  "${dataCont.waterCons.toString()} of 4.0 ltr",
                                  style: boxTextStyle,
                                ))),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Popup();
                                          });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xff343434),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Calories \nBurned",
                              style: boxTextStyle,
                            ),
                            Icon(
                              Icons.local_fire_department,
                              color: Colors.red,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: Lottie.asset(
                            "assets/102292-progress-meter.json",
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "0.0 Kcal",
                              style: boxTextStyle,
                            ),
                            Expanded(
                                child: IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.power_settings_new,
                                      color: Colors.white,
                                    )))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xff343434),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "Today's Required Calorie Consumption:",
                        style: boxTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1245Kcal",
                        style: boxTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MiddleCard(
                      icn: Icons.grass,
                      icnClr: Color(0xffFFBF00),
                      head: "Carbs",
                      sndtxt: "259 g",
                      trdtxt: "1800 Kcl",
                    ),
                    MiddleCard(
                      icn: Icons.grain,
                      icnClr: Color(0xff65FE00),
                      head: "Protein",
                      sndtxt: "259 g",
                      trdtxt: "1800 Kcl",
                    ),
                    MiddleCard(
                      icn: Icons.healing,
                      icnClr: Color(0xffFFBF00),
                      head: "Fat",
                      sndtxt: "59 g",
                      trdtxt: "591 Kcl",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
