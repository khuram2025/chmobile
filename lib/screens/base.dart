import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:admin/responsive.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'dashboard/components/erpFilters.dart';
import 'dashboard/components/header.dart';
import 'dashboard/components/my_fields.dart';
import 'main/components/side_menu.dart';
import 'dashboard/components/storage_details.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget content;

  BaseScreen({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                primary: false,
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
                              ERPFilter(),
                              SizedBox(height: defaultPadding),
                              content,
                              SizedBox(height: defaultPadding),
                            ],
                          ),
                        ),
                        if (!Responsive.isMobile(context))
                          SizedBox(width: defaultPadding),
                        // On Mobile means if the screen is less than 850 we don't want to show it
                        if (!Responsive.isMobile(context))
                          Expanded(
                            flex: 2,
                            child: StorageDetails(),
                          ),
                      ],
                    ),
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
