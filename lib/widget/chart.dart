import 'dart:convert';

import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Color> gradientColors = [primary];
List<Color> gradientColors2 = [black];

class ChartLine extends StatefulWidget {
  @override
  State<ChartLine> createState() => _ChartLineState();
}

class _ChartLineState extends State<ChartLine> {
  var chart1003Call;
  var companiesAndAreas18 = [];
  var companiesAndAreas3 = [];
  var _chartSpots;
  var _chartSpots2;
  var listIndex;
  var zaman = [];

  Future chart1003() async {
    final response = await http.get(Uri.parse(
        "http://panel.scadawatt.com/cronGorevleri/gecmis/chart1003/2022-03-10_chart1003.json"));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      setState(() {
        if (mounted) chart1003Call = result;
        companiesAndAreas18 = chart1003Call["CompaniesAndAreas"]["18"]["areas"]
            ["2"]["chart"]["data"];
        companiesAndAreas3 = chart1003Call["CompaniesAndAreas"]["18"]["areas"]
            ["3"]["chart"]["data"];
        zaman = chart1003Call["labelList"];
        spots();
        spots2();
      });
      return result;
    } else {
      print(response.statusCode);
    }
  }

  spots() {
    List<FlSpot> chartSpots = companiesAndAreas18.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.toDouble());
    }).toList();
    setState(() {
      _chartSpots = chartSpots;
    });
    return chartSpots;
  }

  spots2() {
    List<FlSpot> chartSpots = companiesAndAreas3.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.toDouble());
    }).toList();
    setState(() {
      _chartSpots2 = chartSpots;
    });
  }

  @override
  void initState() {
    super.initState();
    chart1003();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(14.0),
        child: chart1003Call != null
            ? LineChart(mainData())
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0.1,
            );
          }),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontSize: 12,
          ),
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '50k';
              case 5:
                return '100k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: companiesAndAreas18.length.toDouble(),
      minY: 0,
      maxY: companiesAndAreas18
              .reduce((curr, next) => curr > next ? curr : next)
              .toDouble() +
          companiesAndAreas3
              .reduce((curr, next) => curr > next ? curr : next)
              .toDouble(),
      lineBarsData: [
        LineChartBarData(
          showingIndicators: [0],
          spots: _chartSpots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.1)).toList(),
          ),
        ),
        LineChartBarData(
          showingIndicators: [0],
          spots: _chartSpots2,
          isCurved: true,
          colors: gradientColors2,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors2.map((color) => color.withOpacity(0.1)).toList(),
          ),
        ),
      ],
    );
  }
}
