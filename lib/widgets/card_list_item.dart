import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMenuRowTwo extends StatelessWidget {
  final firstLabel;
  final secondLabel;


  const DashboardMenuRowTwo({
    Key key,
    this.firstLabel,

    this.secondLabel,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.square(deviceSize.width / 3.3),
            child: Card(
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  ListTile(
                  title: Container(
              padding: const EdgeInsets.all(10.0),
              decoration:const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),))),
              ),

                  Text('Zip'+ firstLabel,  style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 5)),
                  Text('Top crops',  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 5)),
                  Text('Red Gram:'+ secondLabel,  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 5)),
                  Text('Green Gram:'+ secondLabel,  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 5)),
                  Text('Cotton:'+ secondLabel,  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 5)),
                  Text('Cotton:'+ secondLabel,  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 5)),


                ],
              )
            ),


          ),
        ],
      ),
    );
  }
}