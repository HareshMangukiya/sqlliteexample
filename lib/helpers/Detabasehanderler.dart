import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHandler
{
  Database? db;
  //Database logics

  // returntype funcionnam(para)
  // {
  //
  // }
  //
  Future<Database> create_db() async
  {
    if(db!=null)
    {
      // If db already created
      return db!;
    }
    else
    {
      // We have t create DB
      Directory dir = await getApplicationDocumentsDirectory(); // app directory install
      String dbpath  = join(dir.path,"shopping_db");
      var db = await openDatabase(dbpath,version: 1,onCreate: Create_table );
      return db;
    }
  }
  Create_table(Database db,int version)
  {
    db.execute("create table products (pid integer primary key autoincrement,productsname text,productprice double,productcategory text,producttype text)");
    db.execute("create table em (pid integer primary key autoincrement,employname text,employsalary double,employgender text,emplydeprment text)");
    print("Table Created");
  }

  //member Function / methods
   Future<int> insertproduct(name,price,category,type) async
  {
    //create database
    var db = await create_db();
    // Insert Logic
    var id = await db.rawInsert("insert into products (productsname,productprice,productcategory,producttype)"
        "values(?,?,?,?)",[name,price,category,type]);
    return id ;
  }

 Future<int> insertemployee(ename,esalary,egender,edeprment) async
  {
//create database
    var db = await create_db();
    var id = await db.rawInsert("insert into em (employname,employsalary,employgender,emplydeprment)"
        "values(?,?,?,?)",[ename,esalary,egender,edeprment]);
    return id;

  }

  Future<List> viewproduct() async
  {
//create database
    var db = await create_db();
    var data =  await db.rawQuery("select * from products");
    return data.toList();
  }

  viewemployee()
  {
    //create database
    create_db();
  }
}