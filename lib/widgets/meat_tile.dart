import 'package:flutter/material.dart';

class MeatTile extends StatelessWidget {
 final String name;
 final int amount;
 final DateTime dateTime;

 const MeatTile({
  super.key,
  required this.name,
  required this.amount,
  required this.dateTime,
 });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(dateTime.day.toString() + "/" + dateTime.month.toString() + "/" + dateTime.year.toString()),
      trailing: Text(amount.toString() + " g"),

    );
  }
}
