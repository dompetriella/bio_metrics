import 'dart:ffi';

import 'package:bio_metrics/app/pages/blood_pressure.dart';
import 'package:bio_metrics/app/pages/blood_sugar_page.dart';
import 'package:bio_metrics/app/pages/weight_page.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class PageShell extends ConsumerStatefulWidget {
  const PageShell({super.key});

  @override
  ConsumerState<PageShell> createState() => _PageShellState();
}

class _PageShellState extends ConsumerState<PageShell> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var appState = ref.watch(appStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: switch (appState.currentPageIndex) {
          0 => Theme.of(context).colorScheme.inversePrimary,
          1 => Colors.red[300],
          2 => Colors.orange[300],
          _ => Theme.of(context).colorScheme.inversePrimary
        },
        title: Text(switch (appState.currentPageIndex) {
          0 => "Blood Pressure",
          1 => "Blood Sugar",
          2 => "Weight",
          _ => "Page?"
        }),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 164),
        child: PageView(
          controller: _pageController,
          children: [BloodPressurePage(), BloodSugarPage(), WeightPage()],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: switch (appState.currentPageIndex) {
            0 => Theme.of(context).colorScheme.inversePrimary,
            1 => Colors.red[300],
            2 => Colors.orange[300],
            _ => Theme.of(context).colorScheme.inversePrimary
          },
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationButton(
                  icon: Symbols.blood_pressure,
                  pageIndex: 0,
                  pageController: _pageController,
                ),
                NavigationButton(
                  icon: Icons.bloodtype_outlined,
                  pageIndex: 1,
                  pageController: _pageController,
                ),
                NavigationButton(
                  icon: Icons.monitor_weight_outlined,
                  pageIndex: 2,
                  pageController: _pageController,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return switch (appState.currentPageIndex) {
                0 => BloodPressureEntry(),
                1 => BloodSugarEntry(),
                2 => WeightEntry(),
                _ => BloodPressureEntry()
              };
            },
          );
        },
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add New ' +
                switch (appState.currentPageIndex) {
                  0 => "Blood Pressure",
                  1 => "Blood Sugar",
                  2 => "Weight",
                  _ => "Page?"
                }),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.add)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavigationButton extends ConsumerWidget {
  final int pageIndex;
  final IconData icon;
  final PageController pageController;
  const NavigationButton(
      {super.key,
      required this.pageIndex,
      required this.pageController,
      required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appStateActions = ref.watch(appStateProvider.notifier);
    return IconButton(
        onPressed: () {
          pageController.jumpToPage(pageIndex);
          appStateActions.changePageIndex(pageIndex);
        },
        icon: Icon(
          icon,
          size: 48,
        ));
  }
}
