import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/presentation/home/bloc/statistics_bloc/statistic_bloc.dart';

class PieDataColumn extends StatelessWidget {
  const PieDataColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticBloc, StatisticState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: state.pieData!.categories.map((category) {
            if (category.amount != 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color:
                            Colors.primaries[state.pieData!.categories
                                    .toList()
                                    .indexOf(category) %
                                Colors.primaries.length],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        category.categoryName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${category.percentage}%",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          }).toList(),
        );
      },
    );
  }
}
