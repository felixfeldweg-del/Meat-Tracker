import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meattrack/data/meat_data.dart';
import 'package:meattrack/models/meat_item.dart';
import 'package:meattrack/widgets/meat_summary.dart';
import 'package:meattrack/widgets/meat_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  
  @override 
  void initState() {
    super.initState();
    Provider.of<MeatData>(context, listen: false).prepareData();
  }

  void _AddDialog(){
    
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Add new meal'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController, 
            decoration: InputDecoration(
              hintText: "Name the meal"
            ),
          ),
          TextField(
            controller: _amountController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Amount of meat in grams",
              suffixText: "g",
            ),
          ),
        ],
        ),
        actions: [
          MaterialButton(
            onPressed:  _saveMeat, 
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: _popDialog,
            child: const Text('Cancel'),
          ),
        ],
    ),);
  }

  void _saveMeat(){
    if(_amountController.text.isEmpty || _nameController.text.isEmpty){
      return;
    }

    MeatItem newItem = MeatItem(
      amount:  int.parse(_amountController.text),
      name: _nameController.text,
      dateTime: DateTime.now()
    );
    
    Provider.of<MeatData>(context, listen: false).addNewMeat(newItem);
    _popDialog();
  }

  void _popDialog(){
    Navigator.pop(context);
    _nameController.clear();
    _amountController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MeatData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xffffbfbf),
        floatingActionButton: FloatingActionButton(
          onPressed: _AddDialog,
          child: const Icon(
            Icons.add, 
            color: Color(0xff950000),
          ),
          backgroundColor: Color(0xffff8080),
        ),
        body: ListView(
          children: [
            MeatSummary(
              startOfWeek: value.getStartOfWeek()
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.getMeatList().length,
              itemBuilder: (context, index) => MeatTile(
                name: value.getMeatList()[index].name,
                amount: value.getMeatList()[index].amount, 
                dateTime: value.getMeatList()[index].dateTime
              )
            ),
          ]
        ),
      ),
    );
  }

}

