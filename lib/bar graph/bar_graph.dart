import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meattrack/bar%20graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph({
    super.key,
    this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
   
    BarData myBarData =BarData(
      sunAmount: sunAmount, 
      monAmount: monAmount, 
      tueAmount: tueAmount, 
      wedAmount: wedAmount, 
      thuAmount: thuAmount, 
      friAmount: friAmount, 
      satAmount: satAmount
    );

    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                 const List<String> days = [
                  'Sun',
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat',
                ];
                final index = value.toInt();

                if (index < 0 || index >= days.length) {
                  return const SizedBox.shrink();
                }
                
                return Text(days[index]);
              },
            )
          ),
        ),
        
        barGroups: myBarData.barData
          .map((data) => 
            BarChartGroupData(
              x: data.x, 

              barRods: [
                BarChartRodData(
                  toY: data.y, 
                  width: 30,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red),
              ]
            )
          )
          .toList()
      )
    );
  }
}