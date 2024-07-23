import 'package:bio_metrics/app/pages/blood_pressure.dart';
import 'package:bio_metrics/app/pages/blood_sugar_page.dart';
import 'package:bio_metrics/app/pages/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class PageShell extends StatefulWidget {
  const PageShell({super.key});

  @override
  State<PageShell> createState() => _PageShellState();
}

class _PageShellState extends State<PageShell> {
  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(switch (currentPage) {
          0 => "Blood Pressure",
          1 => "Blood Sugar",
          2 => "Weight",
          _ => "Page?"
        }),
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        controller: _pageController,
        children: [BloodPressurePage(), BloodSugarPage(), WeightPage()],
      ),
      bottomSheet: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationButton(
              icon: Symbols.hematology,
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
      floatingActionButton: Transform.translate(
        offset: Offset(0, -48),
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add New Data',
          child: const Icon(
            Icons.add,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavigationButton extends StatelessWidget {
  final int pageIndex;
  final PageController pageController;
  final IconData icon;
  const NavigationButton(
      {super.key,
      required this.pageController,
      required this.pageIndex,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          pageController.jumpToPage(pageIndex);
        },
        icon: Icon(
          icon,
          size: 48,
        ));
  }
}
