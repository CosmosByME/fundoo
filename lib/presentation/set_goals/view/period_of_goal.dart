import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/core/widget/button_loading_indicator.dart';
import 'package:fundoo/core/widget/date_picking_field.dart';
import 'package:fundoo/core/widget/recommended_times.dart';
import 'package:fundoo/presentation/set_goals/bloc/set_goal_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/info_widget.dart';

class PeriodOfGoal extends StatefulWidget {
  const PeriodOfGoal({super.key});

  @override
  State<PeriodOfGoal> createState() => _PeriodOfGoalState();
}

class _PeriodOfGoalState extends State<PeriodOfGoal> {
  late FToast ftoast;
  late TextEditingController _deadlineController;

  @override
  void initState() {
    super.initState();
    _deadlineController = TextEditingController();
    _deadlineController.addListener(() {
      setState(() {});
    });
    ftoast = FToast();
    ftoast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SetGoalBloc, SetGoalState>(
      listener: (context, state) {
        if (state.createdGoal != null) {
          context.pushNamed('goal-summary');
        }

        if (state.errorMessage != null) {
          showErrorToast(ftoast, state.errorMessage!);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 22,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.whenGoal,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.l10n.whenGoalBody,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                BlocBuilder<SetGoalBloc, SetGoalState>(
                  builder: (context, state) {
                    return GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        RecommendedTimes(
                          isSelected: state.plannedMonths == 3,
                          monthRange: 3,
                          ontap: (months) {
                            context.read<SetGoalBloc>().add(
                              SetGoalPlannedMonthsChanged(months),
                            );
                          },
                        ),
                        RecommendedTimes(
                          isSelected: state.plannedMonths == 6,
                          monthRange: 6,
                          ontap: (months) {
                            context.read<SetGoalBloc>().add(
                              SetGoalPlannedMonthsChanged(months),
                            );
                          },
                        ),
                        RecommendedTimes(
                          isSelected: state.plannedMonths == 12,
                          monthRange: 12,
                          ontap: (months) {
                            context.read<SetGoalBloc>().add(
                              SetGoalPlannedMonthsChanged(months),
                            );
                          },
                        ),
                        RecommendedTimes(
                          isSelected: state.plannedMonths == 18,
                          monthRange: 18,
                          ontap: (months) {
                            context.read<SetGoalBloc>().add(
                              SetGoalPlannedMonthsChanged(months),
                            );
                          },
                        ),
                        RecommendedTimes(
                          isSelected: state.plannedMonths == 24,
                          monthRange: 24,
                          ontap: (months) {
                            context.read<SetGoalBloc>().add(
                              SetGoalPlannedMonthsChanged(months),
                            );
                          },
                        ),
                        RecommendedTimes(
                          isSelected: state.plannedMonths == 36,
                          monthRange: 36,
                          ontap: (months) {
                            context.read<SetGoalBloc>().add(
                              SetGoalPlannedMonthsChanged(months),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                DatePickingField(
                  context: context,
                  controller: _deadlineController,
                ),
                const SizedBox(height: 20),
                InfoWidget(icon: "💡", text: context.l10n.dateInfo(110000)),
                const SizedBox(height: 20),
                BlocBuilder<SetGoalBloc, SetGoalState>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed:
                          state.plannedMonths != null ||
                              state.targetDate != null
                          ? () {
                              context.read<SetGoalBloc>().add(
                                SetGoalSubmitted(),
                              );
                            }
                          : null,
                      backgroundColor: Color(0xFF2563EB),
                      child: state.isLoading
                          ? const ButtonLoadingIndicator()
                          : Text(
                              context.l10n.continuing,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
