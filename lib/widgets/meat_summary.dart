import 'package:flutter/material.dart';
import 'package:meattrack/bar%20graph/bar_graph.dart';
import 'package:meattrack/data/meat_data.dart';
import 'package:provider/provider.dart';

class MeatSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const MeatSummary({
    super.key,
    required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    return Consumer<MeatData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: 100,
          sunAmount: 20,
          monAmount: 30,
          tueAmount: 40,
          wedAmount: 50,
          thuAmount: 60,
          friAmount: 70,
          satAmount: 80, //! Just placeholder
          )
        )
    );
  }
}