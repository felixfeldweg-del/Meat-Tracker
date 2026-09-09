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


}