import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/presentation/set_goals/bloc/set_goal_bloc.dart';
import 'package:go_router/go_router.dart';

class GoalSummary extends StatefulWidget {
  const GoalSummary({super.key});

  @override
  State<GoalSummary> createState() => _GoalSummaryState();
}

class _GoalSummaryState extends State<GoalSummary> {
  late FToast ftoast;

  @override
  void initState() {
    super.initState();
    ftoast = FToast();
    ftoast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    // final state = context.read<SetGoalBloc>().state;
    // final cost = state.targetAmount;
    // final current = state.savedAmount;
    // final months = state.plannedMonths;
    // final date = state.targetDate;

    return BlocListener<SetGoalBloc, SetGoalState>(
      listener: (context, state) {
        if (state.isDone) {
          context.go('/main-page');
        }

        if (state.errorMessage != null) {
          showErrorToast(ftoast, state.errorMessage!);
        }
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1D4ED8), Color(0xFF1E3A8A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF22C55E).withValues(alpha: 0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Text("✅", style: TextStyle(fontSize: 26)),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    context.l10n.planIsReady,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFFFFFF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.l10n.planIsReadyBody,
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF).withValues(alpha: 0.65),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<SetGoalBloc, SetGoalState>(
                    builder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _buildRow(context.l10n.goal, state.name ?? ''),
                            const Divider(color: Colors.white24, height: 24),
                            _buildRow(
                              context.l10n.goalSum,
                              '${state.targetAmount ?? 0} sum',
                            ),
                            const Divider(color: Colors.white24, height: 24),
                            _buildRow(
                              context.l10n.currentBalance,
                              '${state.savedAmount ?? 0} sum',
                            ),
                            const Divider(color: Colors.white24, height: 24),
                            _buildRow(
                              context.l10n.duration,
                              state.plannedMonths != null
                                  ? '${state.plannedMonths} ${context.l10n.month}'
                                  : state.targetDate ?? '-',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  BlocBuilder<SetGoalBloc, SetGoalState>(
                    builder: (context, state) {
                      return CustomButton(
                        backgroundColor: const Color(0xFFFFFFFF),
                        onPressed: () {
                          context.read<SetGoalBloc>().add(ActivateGoal());
                        },
                        child: state.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                context.l10n.goToFundoo,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1D4ED8),
                                ),
                              ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
