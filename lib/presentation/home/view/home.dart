import 'package:flutter/material.dart';
import 'package:fundoo/core/services/initialize_everything.dart';
import 'package:fundoo/core/widget/custom_bnb.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  final int currentIndex;

  final Widget child;

  const HomePage({super.key, required this.currentIndex, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          return Future.delayed(Duration(seconds: 1), () {
            if (context.mounted) {
              initializeEverything(context);
            }
          });
        },
        child: widget.child,
      ),
      bottomNavigationBar: CustomBnb(
        currentIndex: widget.currentIndex,
        onTap: (index) {
          if (widget.currentIndex != index) {
            String page = switch (index) {
              0 => 'main-page',
              1 => 'statistics',
              2 => 'games',
              3 => 'profile',
              _ => 'main-page',
            };
            context.goNamed(page);
          }
        },
      ),
    );
  }
}
