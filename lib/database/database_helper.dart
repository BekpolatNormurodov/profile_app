import 'dart:io';
import 'dart:ui';
import 'package:examination/model/picture.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper!;
    } else {
      return _databaseHelper!;
    }
  }
  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initialDatabase();
      return _database!;
    } else {
      return _database!;
    }
  }

  Future _initialDatabase() async {
    var lock = Lock();
    Database? _db;

    if (_db == null) {
      await lock.synchronized(() async {
        if (_db == null) {
          var databasesPath = await getDatabasesPath();
          String path = join(databasesPath, 'image.db');
          print("DB`ning PATHi: " + path.toString());
          var file = File(path);
          // path -> /Users/zemeister/Desktop/flutter/44dars/assets/kategoriya.db
          if (!await file.exists()) {
            ByteData data = await rootBundle.load(join("assets", "image.db"));
            List<int> bytes =
                data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
            await File(path).writeAsBytes(bytes);
          }
          _db = await openDatabase(path);
        }
      });
    }
    return _db;
  }

  void savePicture(Picture picture) async {
    var dbClient = await _getDatabase();
    await dbClient.insert("Picture", picture.toMap());
    var dv = dbClient.query("Picture");
    print("Hammasi shu $dv");
  }


  Future<List<Picture>> getPictures() async {
    var dbClient = await _getDatabase();
    List<Map> list = await dbClient.query('Picture');
    print(list);
    List<Picture> pictures = [];
    for (int i = 0; i < list.length; i++) {
      pictures.add(new Picture(
        picture: list[i]["picture"],
        rasm: list[i]["rasm"],
      ));
    }
    return pictures;
  }
}
