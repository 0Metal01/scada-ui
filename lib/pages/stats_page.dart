import 'package:budget_tracker_ui/json/day_month.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:budget_tracker_ui/widget/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int activeDay = 3;

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    List expenses = [
      {
        "header": "sirket isimleri",
        "label": "ÜRETİM DEĞERİ",
        "cost": "\$6593.75"
      },
      {"header": "sirket isimleri", "label": "KW/H", "cost": "\2645.50"},
      {
        "header": "sirket isimleri",
        "label": "ÜRETİM DEĞERİ",
        "cost": "\$6593.75"
      },
      {"header": "sirket isimleri", "label": "KW/H", "cost": "\2645.50"},
      {
        "header": "sirket isimleri",
        "label": "ÜRETİM DEĞERİ",
        "cost": "\$6593.75"
      },
      {"header": "sirket isimleri", "label": "KW/H", "cost": "\2645.50"},
      {
        "header": "sirket isimleri",
        "label": "ÜRETİM DEĞERİ",
        "cost": "\$6593.75"
      },
      {"header": "sirket isimleri", "label": "KW/H", "cost": "\2645.50"},
      {
        "header": "sirket isimleri",
        "label": "ÜRETİM DEĞERİ",
        "cost": "\$6593.75"
      },
      {"header": "sirket isimleri", "label": "KW/H", "cost": "\2645.50"},
      {
        "header": "sirket isimleri",
        "label": "ÜRETİM DEĞERİ",
        "cost": "\$6593.75"
      },
      {"header": "sirket isimleri", "label": "KW/H", "cost": "\2645.50"},
      {
        "header": "sirket isimleri",
        "label": "ÜRETİM DEĞERİ",
        "cost": "\$6593.75"
      },
      {"header": "sirket isimleri", "label": "KW/H", "cost": "\2645.50"}
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Aylık ve Günlük Üretim",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(months.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 40) / 6,
                            child: Column(
                              children: [
                                Text(
                                  months[index]['label'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: activeDay == index
                                          ? primary
                                          : black.withOpacity(0.02),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: activeDay == index
                                              ? primary
                                              : black.withOpacity(0.1))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 7, bottom: 7),
                                    child: Text(
                                      months[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: activeDay == index
                                              ? white
                                              : black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Üretim",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Color(0xff67727d)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$2446.90",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                          width: (size.width - 20),
                          height: 150,
                          child: ChartLine()),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                  width: (size.width - 60) / 2,
                  height: 190,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          expenses[index]["header"],
                          style: TextStyle(fontSize: 22),
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses[index]['label'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              expenses[index]['cost'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
              })),
        ],
      ),
    );
  }
}
