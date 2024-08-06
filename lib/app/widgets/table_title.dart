import 'package:flutter/material.dart';

class TableTitle extends StatelessWidget {
  final List<String> titles;
  const TableTitle({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [for (String title in titles) Text(title)],
      ),
    );
  }
}
