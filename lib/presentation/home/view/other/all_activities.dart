import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/widget/activities_list_tile.dart';
import 'package:fundoo/presentation/home/bloc/transaction_bloc/transaction_bloc.dart';

class AllActivities extends StatefulWidget {
  const AllActivities({super.key});

  @override
  State<AllActivities> createState() => _AllActivitiesState();
}

class _AllActivitiesState extends State<AllActivities> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 200 &&
          !context.read<TransactionBloc>().state.isLoading &&
          context.read<TransactionBloc>().state.isScrollable) {
        context.read<TransactionBloc>().add(
          LoadTransactionsEvent(context.read<TransactionBloc>().state.page),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.recentActivity,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: state.transactions != null
                ? ListView.separated(
                    controller: controller,
                    itemCount: state.transactions!.length + 1,
                    itemBuilder: (context, index) {
                      if (index < state.transactions!.length) {
                        return ActivitiesListTile(
                    icon: state.transactions![index].transactionType == 4
                        ? Icons.arrow_upward
                        : state.transactions![index].transactionType == 3
                        ? Icons.arrow_downward
                        : Icons.trending_up,
                    data: state.transactions![index],
                  );
                } else if (index == state.transactions!.length &&
                    state.isLoading) {
                  return Center(child: CircularProgressIndicator.adaptive());
                } else {
                  return SizedBox();
                }
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
            ) : Center(child: CircularProgressIndicator.adaptive()),
          );
        },
      ),
    );
  }
}
