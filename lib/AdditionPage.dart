import 'package:app_final/SQLHelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'helpers/Constants.dart';
import 'SQLHelper.dart';

class AdditionPage extends StatelessWidget {
  final sqlHelp = SQLHelper();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _resController = TextEditingController();
  final TextEditingController _foodController = TextEditingController();

  void _saveRecord(){
    print(_typeController.text);
    print(_resController.text);
    print(_foodController.text);
  }
  AdditionPage({super.key});
  @override
  Widget build(BuildContext context) {
    String stDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.amber,),
      body: Column(
        children: [
          TextField(
            controller: _dateController..text=stDate,
            decoration: new InputDecoration(labelText: '日期',),cursorColor: Colors.amber, readOnly: true, onTap: () async{
              final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2050),
            );

            if (date != null) {
              _dateController.text=DateFormat('yyyy-MM-dd').format(date).toString();
            }
          },),
          TextField(
            controller: _typeController,
            decoration: new InputDecoration(labelText: '類型',),cursorColor: Colors.amber,),
          TextField(
            controller: _resController,
            decoration: new InputDecoration(labelText: '餐廳名稱',),cursorColor: Colors.amber,),
          TextField(
            controller: _foodController,
            decoration: new InputDecoration(labelText: '食物名稱',),cursorColor: Colors.amber,),
          ElevatedButton(onPressed: ()async{
            await sqlHelp.open();
            print(_typeController.text);
            print(_resController.text);
            print(_foodController.text);
            await sqlHelp.insert({'time':_dateController.text, 'mealType':_typeController.text, 'restaurant':_resController.text, 'food':_foodController.text});
            Navigator.pop(context);
            },
              child: Text('儲存')),
        ],
      ),
    );
  }

}