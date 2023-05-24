import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Home",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {Navigator.pushNamed(context, '/home');},
          ),
          DrawerListTile(
            title: "AnimalList",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {Navigator.pushNamed(context, '/animallist');},
          ),
          DrawerListTile(
            title: "Income",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {Navigator.pushNamed(context, '/income');},
          ),
          DrawerListTile(
            title: "Expense",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {Navigator.pushNamed(context, '/expense');},
          ),
          DrawerListTile(
            title: "Employess",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {Navigator.pushNamed(context, '/employees');},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {Navigator.pushNamed(context, '/profile');},
          ),
          DrawerListTile(
            title: "Login",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
