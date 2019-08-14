import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card Details'),
          backgroundColor: Color(0xFF673AB7),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(100, (index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(1),
                  color: Colors.grey,
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            }),
          ),
        ));
  }
}
