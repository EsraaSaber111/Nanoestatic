import 'dart:async';

import 'package:path/path.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:sqflite/sqflite.dart';

class SQL_Helper {
  static SQL_Helper dbHelper;
  static Database _database;

  SQL_Helper._createInstance();

  factory SQL_Helper() {
    if (dbHelper == null) {
      dbHelper = SQL_Helper._createInstance();
    }
    return dbHelper;
  }

  String tableName = "Cart_table";
  String _id = "id";

  String __productid = "product_id";
  String __quantity = "quantity";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }

  Future<Database> initializedDatabase() async {
    String path = join(await getDatabasesPath(), 'database.dp');
    // Directory directory = await getApplicationDocumentsDirectory();
    // String path = directory.path + "database.db";

    var cartDB = await openDatabase(path, version: 1, onCreate: createDatabase);
    return cartDB;
  }

  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY,$__productid INTEGER, $__quantity INTEGER)");
  }

  Future<List<Map<String, dynamic>>> getcartMapList() async {
    Database db = await this.database;
    //var result1 =  await db.rawQuery("SELECT * FROM $tableName ORDER BY $_id ASC");
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  Future<bool> checkDatabase() async {
    Database db = await this.database;
    //var result1 =  await db.rawQuery("SELECT * FROM $tableName ORDER BY $_id ASC");
    var result = await db.query(tableName);
    return (result.isEmpty) ? true : false;
  }

  Future<bool> checkItem(int id) async {
    Database db = await this.database;
    //var result1 =  await db.rawQuery("SELECT * FROM $tableName ORDER BY $_id ASC");
    var result = await db.query(tableName, where: "$_id = ?", whereArgs: [id]);
    return (result.isEmpty) ? true : false;
  }

  Future<int> insertCart(ProductCart cart) async {
    Database db = await this.database;
    var result = await db.insert(tableName, cart.toMap());
    return result;
  }

  Future<int> updateCart(ProductCart cart) async {
    Database db = await this.database;
    var result = await db.update(tableName, cart.toMap(),
        where: "$_id = ?", whereArgs: [cart.id]);
    return result;
  }

  Future<ProductCart> updateCartCount(int id) async {
    Database db = await this.database;
    var result = await db.query(tableName, where: "$_id = ?", whereArgs: [id]);
    return ProductCart.getMap(result[0]);
  }

  Future<int> deleteCart(int id) async {
    var db = await this.database;
    int result = await db.rawDelete("DELETE FROM $tableName WHERE $_id = $id");

    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> all =
        await db.rawQuery("SELECT COUNT (*) FROM $tableName");
    int result = Sqflite.firstIntValue(all);
    return result;
  }

  Future<List<ProductCart>> getDataList() async {
    var cartMapList = await getcartMapList();
    int count = cartMapList.length;

    List<ProductCart> carts = new List<ProductCart>();

    for (int i = 0; i <= count - 1; i++) {
      carts.add(ProductCart.getMap(cartMapList[i]));
    }
    return carts;
  }

  void deleteall() async {
    var db = await this.database;
    int result = await db.rawDelete("DELETE FROM $tableName ");
  }
}
