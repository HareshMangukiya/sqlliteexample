import 'package:flutter/material.dart';
import 'package:sqlliteexample/helpers/Detabasehanderler.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  TextEditingController _productname = TextEditingController();
  TextEditingController _price = TextEditingController();
  var selected = "Gujarati";
  var name1 = "";

  var gr = "";
  var dp = "";
  var _grp = "";

  var result = "0";

  _hanleRadio(val) {
    setState(() {
      _grp = val!;
    });
  }

  var product = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _productname,
                  decoration: InputDecoration(
                    hintText: "Enter Product Name",
                    labelText: "Product Name",
                    hintStyle: TextStyle(color: Colors.cyan),
                    fillColor: Colors.blue,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3.0, color: Colors.amber),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _price,
                  decoration: InputDecoration(
                    hintText: "Product Price",
                    labelText: "price",
                    hintStyle: TextStyle(color: Colors.cyan),
                    fillColor: Colors.blue,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3.0, color: Colors.amber),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Categary"),
                    SizedBox(
                      width: 25.0,
                    ),
                    DropdownButton(
                      value: selected,
                      onChanged: (val) {
                        setState(() {
                          selected = val!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text("Gujarati"),
                          value: "Gujarati",
                        ),
                        DropdownMenuItem(
                          child: Text("Eco"),
                          value: "Eco",
                        ),
                        DropdownMenuItem(
                          child: Text("Ba"),
                          value: "Ba",
                        ),
                        DropdownMenuItem(
                          child: Text("Sp"),
                          value: "Sp",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Radio(
                      value: "Simple",
                      groupValue: _grp,
                      onChanged: _hanleRadio,
                    ),
                    Text("Simple"),
                    Radio(
                      value: "Variable",
                      groupValue: _grp,
                      onChanged: _hanleRadio,
                    ),
                    Text("Variable")
                  ],
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        var name = _productname.text.toString();
                        var price = _price.text.toString();
                        var type = _grp.toString();
                        var categary = selected.toString();

                        DatabaseHandler obj = new DatabaseHandler();
                        var status = await obj.insertproduct(
                            name, price, categary, type);
                        print("Record inserted at :"+ status.toString());
                      },
                      child: Text("Add")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
