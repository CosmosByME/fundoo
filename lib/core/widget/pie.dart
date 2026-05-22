import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/presentation/home/bloc/statistics_bloc/statistic_bloc.dart';

class Pie extends StatelessWidget {
  const Pie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticBloc, StatisticState>(
      builder: (context, state) {
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
                      state.pieData!.totalExpenses ~/ 1000 == 0
                          ? state.pieData!.totalExpenses.toString()
                          : state.pieData!.totalExpenses ~/ 1000000 == 0
                          ? "${state.pieData!.totalExpenses ~/ 1000}K"
                          : "${state.pieData!.totalExpenses ~/ 1000000}M",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
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
                  sections: state.pieData!.categories.map((section) {
                    return PieChartSectionData(
                      color:
                          Colors.primaries[state.pieData!.categories
                                  .toList()
                                  .indexOf(section) %
                              Colors.primaries.length],
                      value: section.percentage / 100,
                      showTitle: false,
                      radius: 15,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
