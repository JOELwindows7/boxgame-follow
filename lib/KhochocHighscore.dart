import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class KhochocLogs{
  final int id;
  final int khochocNumbers;
  final String date;

  KhochocLogs({this.id, this.khochocNumbers, this.date});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'khochocNumbers': khochocNumbers,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'Khochoc #$id = $khochocNumbers, Date = $date';
  }
}

class KhochocHighScore extends StatefulWidget {
  @override
  _KhochocHighScoreState createState() => _KhochocHighScoreState();
}

class _KhochocHighScoreState extends State<KhochocHighScore> {
  var database;
  void DatabasereInit() async{
    database = openDatabase(
        join(await getDatabasesPath(), 'KhochocLogs.db'),
        version: 1,
        onCreate: (db,version){
          return db.execute(
            "CREATE TABLE Khochoc(id INTEGER PRIMARY KEY, khochocNumbers INTEGER, date String)",
          );
          },
    );
  }

  Future<void> deleteKhochoc(int id) async{
    final db = await database;

    await db.delete(
      'Khochoc',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  void initState() {
    DatabasereInit();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}


