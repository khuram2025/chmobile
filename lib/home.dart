import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'screens/dashboard/components/header.dart';
import 'screens/dashboard/components/my_files.dart';
import 'screens/main/components/side_menu.dart';
import 'package:provider/provider.dart';
import 'controllers/api_service.dart';
import 'models/animal_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<HomeAPI> futureHomeData;
  ApiService apiService = ApiService();


  @override
  void initState() {
    super.initState();
    futureHomeData = apiService.getHomeData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: FutureBuilder<HomeAPI>(
                future: futureHomeData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    HomeAPI homeData = snapshot.data!;
                    // You can now access maleAnimals, femaleAnimals, and animals
                    // from homeData and do whatever you need to do with them.
                    // For example, you might want to create a list that combines all three.
                    List<Property> allProperties = homeData.maleAnimals + homeData.femaleAnimals + homeData.animals;
                    return HomePageBody(properties: allProperties);
                  }
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  final List<Property> properties;

  HomePageBody({required this.properties});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Header(),
          SizedBox(height: defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    MyFiles(),
                    SizedBox(height: defaultPadding),
                    Column(
                      children: properties.map((property) => PropertyCard(property: property)).toList(),
                    ),
                    SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context))
                      SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context)) Text("Storage Files will be here"),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                SizedBox(width: defaultPadding),
              // On Mobile means if the screen is less than 850 we don't want to show it
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: Text("Storage Files will be here"),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final Property property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'http://farmapp.channab.com:8000/media/';
    return Container(
      height: 150,
      child: Stack(
        children: [
          Card(
            child: Row(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,

                      child: Image.network(baseUrl + property.imageUrl, fit: BoxFit.fill,),


                    ),
                  ],
                ),
                Container(
                  width: 262,
                  height: 150,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        property.tag,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        property.dob,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        property.purchaseCost.toString(),
                        style: TextStyle(color: Colors.green),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Badge(property.sex),
                          Badge(property.status),
                          Badge(property.animalType),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ... rest of the code
        ],
      ),
    );
  }

  Widget Badge(String label) {
    return Container(
      width: 77.91,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
