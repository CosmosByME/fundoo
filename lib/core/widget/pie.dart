import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Pie extends StatelessWidget {
  final int total;
  final Map<String, double> data;
  const Pie({super.key, required this.data, required this.total});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  total ~/ 1000 == 0
                      ? total.toString()
                      : total ~/ 1000000 == 0
                      ? "${total ~/ 1000}K"
                      : "${total ~/ 1000000}M",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  "UZS",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          PieChart(
            duration: Duration(seconds: 1),
            curve: Curves.fastEaseInToSlowEaseOut,
            PieChartData(
              sections: data.entries.map((e) {
                return PieChartSectionData(
                  color:
                      Colors.primaries[data.keys.toList().indexOf(e.key) %
                          Colors.primaries.length],
                  value: e.value,
                  showTitle: false,
                  radius: 15,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
