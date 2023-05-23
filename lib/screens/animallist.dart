import 'package:flutter/material.dart';

class Property {
  final String title;
  final String location;
  final String price;
  final String imageUrl;

  Property({required this.title, required this.location, required this.price, required this.imageUrl});
}

void main() {
  runApp(PropertyApp());
}

class PropertyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PropertyListScreen(),
    );
  }
}

class PropertyListScreen extends StatelessWidget {
  final List<Property> properties = [
    Property(
      title: '5 Marla House For Sale',
      location: 'Bahria Town, Islamabad',
      price: 'Rs. 1.5 Crore',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    // Add more properties...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Properties')),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return PropertyCard(property: properties[index]);
        },
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Property property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: Image.network(
                property.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 262,
              height: 150,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      property.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      property.location,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      property.price,
                      style: TextStyle(color: Colors.green),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Add more rows as needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
