import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/pie.dart';
import 'package:fundoo/core/widget/pie_data_column.dart';
import 'package:fundoo/core/widget/sliding_segment_control.dart';
import 'package:fundoo/presentation/home/bloc/statistics_bloc/statistic_bloc.dart';

class PiechartAnalytics extends StatefulWidget {
  const PiechartAnalytics({super.key});

  @override
  State<PiechartAnalytics> createState() => _PiechartAnalyticsState();
}

class _PiechartAnalyticsState extends State<PiechartAnalytics> {
  int index = 0;

  void onSegmentChanged(int newIndex) {
    setState(() {
      index = newIndex;
    });
    context.read<StatisticBloc>().add(LoadPieDataEvent(newIndex + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  context.l10n.spendingDistribution,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: SlidingSegmentedControl(
                  onSegmentChanged: onSegmentChanged,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          BlocBuilder<StatisticBloc, StatisticState>(
            builder: (context, state) {
              if (state.pieData != null) {
                return IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Pie()),
                      Expanded(child: PieDataColumn()),
                    ],
                  ),
                );
              } else {
                return Text(
                  "No data available",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
