import 'package:flutter/material.dart';

class ViewEmploy extends StatefulWidget {
  const ViewEmploy({Key? key}) : super(key: key);

  @override
  State<ViewEmploy> createState() => _ViewEmployState();
}

class _ViewEmployState extends State<ViewEmploy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewEmploy"),
      ),
    );
  }
}
