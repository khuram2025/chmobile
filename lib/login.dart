import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'controllers/api_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileLayout(context);
          } else {
            return _buildTabletLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to Channab',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: 'Mobile Number'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final response = await _apiService.login(_phoneController.text, _passwordController.text);
              if (response == null) {
                // if the login is successful, navigate to home page
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                // show error message
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(response)));
              }
            },
            child: Text('Login'),
          ),

          TextButton(
            onPressed: () {
              // Add your forgot password logic here.
            },
            child: Text('Forgot Password?'),
          ),
          TextButton(
            onPressed: () {
              // Add your sign up logic here.
            },
            child: Text('Don\'t have an account? Sign Up'),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Channab',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final response = await _apiService.login(_phoneController.text, _passwordController.text);
                if (response == null) {
                  // if the login is successful, navigate to home page
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // show error message
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(response)));
                }
              },
              child: Text('Login'),
            ),

            TextButton(
              onPressed: () {
                // Add your forgot password logic here.
              },
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                // Add your sign up logic here.
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
