import 'package:flutter/material.dart';
import 'package:sqlliteexample/helpers/Detabasehanderler.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  Future<List>? allproducts;

  Future<List> getdata() async
  {

    DatabaseHandler obj = new DatabaseHandler();
    var alldata = await obj.viewproduct();
    return alldata;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      allproducts = getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProduct"),
      ),
      body: FutureBuilder(
        future: allproducts,
        builder: (context,snapshots)
        {
          if(snapshots.hasData)
          {
            if(snapshots.data!.length==0)
            {
              return Center(
                child: Text("No Data Found"),
              );
            }
            else
            {
              return ListView.builder(
                itemCount: snapshots.data!.length,
                itemBuilder: (context,index)
                {
                  return Container(
                    color: Colors.red,
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(snapshots.data![index]["productname"].toString()),
                      ],
                    ),
                  );
                  // return ListTile(
                  //   title: Text(snapshots.data![index]["productname"].toString()),
                  //   subtitle:  Text(snapshots.data![index]["productcategory"].toString()),
                  //   trailing: Text("Rs."+snapshots.data![index]["productprice"].toString()),
                  // );
                },
              );
            }
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
