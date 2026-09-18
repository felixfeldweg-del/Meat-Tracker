import 'dart:math';

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
    DateTime sunday = startOfWeek.add(Duration(days: 0));
    DateTime monday = startOfWeek.add(Duration(days: 1));
    DateTime tuesday = startOfWeek.add(Duration(days: 2));
    DateTime wednesday = startOfWeek.add(Duration(days: 3));
    DateTime thursday = startOfWeek.add(Duration(days: 4));
    DateTime friday = startOfWeek.add(Duration(days: 5));
    DateTime saturday = startOfWeek.add(Duration(days: 6));



    return Consumer<MeatData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: [value.meatAmountByDay(sunday),
           value.meatAmountByDay(monday),
           value.meatAmountByDay(tuesday),
           value.meatAmountByDay(wednesday),
           value.meatAmountByDay(thursday),
           value.meatAmountByDay(friday),
           value.meatAmountByDay(saturday)].reduce((a, b) => a > b ? a : b),
          sunAmount: value.meatAmountByDay(sunday),
          monAmount: value.meatAmountByDay(monday),
          tueAmount: value.meatAmountByDay(tuesday),
          wedAmount: value.meatAmountByDay(wednesday),
          thuAmount: value.meatAmountByDay(thursday),
          friAmount: value.meatAmountByDay(friday),
          satAmount: value.meatAmountByDay(saturday), 
          )
        )
    );
  }
}