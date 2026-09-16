import 'package:meattrack/bar%20graph/single_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  List<SingleBar> barData = [];
  
  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  }){
    barData.add(SingleBar(x: 0, y: sunAmount));
    barData.add(SingleBar(x: 1, y: monAmount));
    barData.add(SingleBar(x: 2, y: tueAmount));
    barData.add(SingleBar(x: 3, y: wedAmount));
    barData.add(SingleBar(x: 4, y: thuAmount));
    barData.add(SingleBar(x: 5, y: friAmount));
    barData.add(SingleBar(x: 6, y: satAmount));
  }
}