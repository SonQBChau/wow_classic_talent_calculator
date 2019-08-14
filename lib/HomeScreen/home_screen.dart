import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List cards = List.generate(9, (i) => CustomCard());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WoW Classic Talent Calculator'),
          backgroundColor: Color(0xFF673AB7),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: 9,
                itemBuilder: (BuildContext ctxt, int index) => CustomCard())));
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: Text('Title display'),
          )
        ],
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
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
