import 'package:hive/hive.dart';
import 'package:meattrack/models/meat_item.dart';

class HiveDatabase{
  //refrence box
  final _myBox = Hive.box('meatBox');

  //write 
  void saveData(List<MeatItem> meatList){
    //convert to list of items 
    List<List<dynamic>> meatListFormatted = [];
    for(var meat in meatList){
      List<dynamic> meatListFormatted = [meat.name, meat.amount, meat.dateTime];
      meatListFormatted.add(meat.dateTime);
    }
    _myBox.put('MEAT_LIST', meatListFormatted);
  }
  
  //read
  List<MeatItem> readData(){
  
  List<dynamic> meatListFormatted = _myBox.get('MEAT_LIST') ?? [];
  
  List<MeatItem> meatList = [];
  for(var meat in meatListFormatted){
    MeatItem meatItem = MeatItem(
      name: meat[0],
      amount: meat[1],
      dateTime: meat[2]
    );
    meatList.add(meatItem);
  }

  return meatList;
  }
  
}