import 'package:app_final/SQLHelper.dart';
import 'package:flutter/material.dart';
import 'helpers/Constants.dart';
import 'SQLHelper.dart';

class AdditionPage extends StatelessWidget {
  final sqlHelp = SQLHelper();
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

    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.amber,),
      body: Column(
        children: [
          Text('時間：'),
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
            await sqlHelp.insert({'time':'', 'mealType':_typeController.text, 'restaurant':_resController.text, 'food':_foodController.text});
            Navigator.pop(context);
            },
              child: Text('儲存')),
        ],
      ),
    );
  }

}