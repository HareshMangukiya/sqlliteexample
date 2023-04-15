import 'package:flutter/material.dart';
import 'package:sqlliteexample/Screen/AddEmploy.dart';
import 'package:sqlliteexample/Screen/AddMenu.dart';
import 'package:sqlliteexample/Screen/ViewEmploy.dart';
import 'package:sqlliteexample/Screen/ViewProduct.dart';

class SqlliteExample extends StatefulWidget {
  const SqlliteExample({Key? key}) : super(key: key);

  @override
  State<SqlliteExample> createState() => _SqlliteExampleState();
}

class _SqlliteExampleState extends State<SqlliteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqlliteExample"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 75.0,),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddMenu()));
                },
                child: Text("Add Product Details"),
              ),
            ),
            SizedBox(height: 25.0,),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewProduct()));
                },
                child: Text("View Product"),
              ),
            ),
            SizedBox(height: 25.0,),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddEmploy()));
                },
                child: Text("Add Employ"),
              ),
            ),
            SizedBox(height: 25.0,),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewEmploy()));
                },
                child: Text("View Employ"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
