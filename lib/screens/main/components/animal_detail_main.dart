import 'package:flutter/material.dart';

class AnimalDetailMain extends StatefulWidget {
  @override
  _AnimalDetailMainState createState() => _AnimalDetailMainState();
}

class _AnimalDetailMainState extends State<AnimalDetailMain> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Image.network('https://yourImageURL.com', fit: BoxFit.cover),
                ),
                Row(
                  children: <Widget>[
                    // Your images here
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Animal Title'),
                Text('Animal Age'),
                Text('Animal Sex'),
                Text('Animal Purchase Cost'),
                Text('Animal Category'),
              ],
            ),
          ],
        ),
        TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(text: 'Detail'),
            Tab(text: 'Health'),
            Tab(text: 'Breeding'),
            Tab(text: 'Weight'),
            Tab(text: 'Family'),
            Tab(text: 'Milk'),
          ],
        ),
        Container(
          height: 200,  // specify a height for the Container
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              Center(child: Text('Detail Tab')),
              Center(child: Text('Health Tab')),
              Center(child: Text('Breeding Tab')),
              Center(child: Text('Weight Tab')),
              Center(child: Text('Family Tab')),
              Center(child: Text('Milk Tab')),
            ],
          ),
        ),
      ],
    );
  }
}
