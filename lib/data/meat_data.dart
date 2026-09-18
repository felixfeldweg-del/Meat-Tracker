import 'package:flutter/material.dart';
import 'package:meattrack/data/hive_database.dart';
import 'package:meattrack/models/meat_item.dart';

class MeatData extends ChangeNotifier{

  // list of ALL expenses
  List<MeatItem> meatList = [];
  final db = HiveDatabase();
  // get meat list
  List<MeatItem> getMeatList(){
    return meatList;
  }

  // prepare data 
  void prepareData(){
    if (db.readData().isNotEmpty){
      meatList = db.readData();
      print(meatList);
    }
  }

  // add new mea 
  void addNewMeat(MeatItem meatItem){
    meatList.add(meatItem);
    notifyListeners();

    db.saveData(meatList);
    print(meatList);
  }
  //delete meat 

  //get weekday

  //start of week 
  DateTime getStartOfWeek(){
    DateTime now = DateTime.now();
    DateTime startOfWeek = DateTime(now.year, now.month, now.day - now.weekday);
    return startOfWeek;
  }

 double meatAmountByDay(DateTime day){
   double amount = 0;
   for(var meat in meatList){
     if(meat.dateTime.day == day.day){
       amount += meat.amount;
     }
   }
   return amount;
 }


}