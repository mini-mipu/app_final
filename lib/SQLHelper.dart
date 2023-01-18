import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper{
  final sqlName = 'mdb.sql';
  final table = 'meal';
  Database? db;
  open()async{
    String path = "${await getDatabasesPath()}/$sqlName";

    if(db==null){
      db = await openDatabase(path, version: 1, onCreate: (db, ver)async{
        await db.execute('''
      Create Table meal(
      id Integer PRIMARY KEY AUTOINCREMENT,
      time text,
      mealType text,
      restaurant text,
      food text
      );
      ''');}
      );
    }
  }
  insert(Map<String, dynamic> m)async{
    await db!.insert(table, m);
  }
  queryAll()async{
    return await db!.query(table, columns: null);
  }
}