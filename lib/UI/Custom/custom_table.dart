import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  CustomTable({super.key, required this.tableItems});

  List<String> tableItems = [];
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: <TableRow>[
        TableRow(children: [Text("hello world")]),
      ],
    );
  }
}
