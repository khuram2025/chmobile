import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/home.dart';
import 'package:admin/screens/AnimalListScreen.dart';
import 'package:admin/screens/main/animal_detail.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'screens/EmployeesScreen.dart';
import 'screens/ExpenseScreen.dart';
import 'screens/IncomeScreen.dart';
import 'screens/ProfileScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MenuAppController menuAppController = MenuAppController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuAppController>.value(value: menuAppController),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MainScreen(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/animaldetail': (context) => AnimalDetail(),
          '/animallist': (context) => AnimalListScreen(),
          '/income': (context) => IncomeScreen(),
          '/expense': (context) => ExpenseScreen(),
          '/employees': (context) => EmployeesScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
