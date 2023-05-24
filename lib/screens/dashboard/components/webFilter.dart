import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

class WebFilter extends StatefulWidget {
  const WebFilter({
    Key? key,
  }) : super(key: key);

  @override
  _WebFilterState createState() => _WebFilterState();
}

class _WebFilterState extends State<WebFilter> {
  String dropdownValue = 'Last 7 Days';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,

      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: DropdownButtonHideUnderline(  // Wrap DropdownButton with this
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward, color: Colors.white,),
          iconSize: 15,
          style: TextStyle(color: Colors.white, fontSize: 15),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Last 7 Days', 'Last Month', 'Last 3 Months', 'One Year']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
