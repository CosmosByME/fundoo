import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/pie.dart';
import 'package:fundoo/core/widget/pie_data_column.dart';
import 'package:fundoo/core/widget/sliding_segment_control.dart';

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
  }

  final int totalWeekly = 100000;
  final int totalMonthly = 400000;
  final int totalYearly = 5000000;

  Map<String, double> dataWeekly = {
    "Oziq-ovqat": 25,
    "Transport": 16,
    "Ko'ngilochar": 12,
    "Kiyim": 10,
    "Boshqa": 37,
  };

  Map<String, double> dataMonthly = {
    "Oziq-ovqat": 30,
    "Transport": 20,
    "Ko'ngilochar": 15,
    "Kiyim": 10,
    "Boshqa": 25,
  };

  Map<String, double> dataYearly = {
    "Oziq-ovqat": 28,
    "Transport": 18,
    "Ko'ngilochar": 14,
    "Kiyim": 12,
    "Boshqa": 28,
  };

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
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Pie(
                    total: index == 0
                        ? totalWeekly
                        : index == 1
                        ? totalMonthly
                        : totalYearly,
                    data: index == 0
                        ? dataWeekly
                        : index == 1
                        ? dataMonthly
                        : dataYearly,
                  ),
                ),
                Expanded(
                  child: PieDataColumn(
                    data: index == 0
                        ? dataWeekly
                        : index == 1
                        ? dataMonthly
                        : dataYearly,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
