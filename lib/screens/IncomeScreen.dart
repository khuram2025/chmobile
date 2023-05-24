import 'package:flutter/material.dart';
import 'package:admin/constants.dart';
import 'package:admin/controllers/api_service.dart';
import '../models/incomelistModel.dart';
import 'base.dart';

class IncomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Income List',
      content: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: FutureBuilder<List<Income>>(
          future: apiService.getIncomeList(),
          builder: (BuildContext context, AsyncSnapshot<List<Income>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Income List",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: constraints.maxWidth),
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          columns: const <DataColumn>[
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Amount')),
                            DataColumn(label: Text('Category')),
                          ],
                          rows: snapshot.data!.map((Income income) => _createIncomeRow(income)).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  DataRow _createIncomeRow(Income income) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text('${income.date}')),
        DataCell(Text('${income.description}')),
        DataCell(Text('${income.amount}')),
        DataCell(Text('${income.category}')),
      ],
    );
  }
}
