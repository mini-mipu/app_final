import 'package:app_final/SQLHelper.dart';
import 'package:flutter/material.dart';


class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final sqlHelp = SQLHelper();

  getAllPost()async{
    await sqlHelp.open();
    return await sqlHelp.queryAll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: getAllPost(),
          builder: (context, snapshot){
            if (snapshot.hasData){
              List myData = snapshot.data as List;
              return ListView.builder(itemCount: myData.length, itemBuilder: (context, idx){
                return ListTile(
                  title: Text(myData[idx]['time'].toString()),
                  subtitle: Text('${myData[idx]['mealType']}'),
                  trailing: Text('${myData[idx]['restaurant']}\n${myData[idx]['food']}'),
                  onTap: (){print('123');},
                );
              });
            }
            return Container();

          }),
    );
  }

}