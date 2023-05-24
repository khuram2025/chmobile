import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/webFilter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ERPFilter extends StatelessWidget {
  const ERPFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        Spacer(), // This will occupy all remaining space.
        WebFilter(),
        SizedBox(width: defaultPadding,),
        ElevatedButton(onPressed: (){}, child: Text('ADD'))
      ],
    );
  }
}
