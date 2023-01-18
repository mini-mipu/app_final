import 'package:app_final/AdditionPage.dart';
import 'package:flutter/material.dart';
import 'helpers/Constants.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.amber, textStyle: const TextStyle(fontSize: 20, color: Colors.black)), onPressed: null, child: const Text('recommend'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionPage()));
        },
        tooltip: 'add a new record.',
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}



