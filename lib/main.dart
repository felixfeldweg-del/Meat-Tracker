import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meattrack/data/meat_data.dart';
import 'package:meattrack/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async{

  // init Hive 
  await Hive.initFlutter();
  // open box
  await Hive.openBox('meatBox');

  runApp(const MeatApp());
}

class MeatApp extends StatelessWidget {
  const MeatApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MeatData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  HomePage(),
      ),
    );
  }
  }