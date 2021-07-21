import 'package:data_table/data/data.dart';
import 'package:data_table/model/data.dart';
import 'package:data_table/widget/scrollable_widget.dart';
import 'package:flutter/material.dart';

class SortablePage extends StatefulWidget {
  @override
  _SortablePageState createState() => _SortablePageState();
}

class _SortablePageState extends State<SortablePage> {
  late List<Data> _data;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    this._data = List.of(allData);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(
          child: buildDataTable(),
        ),
      );

  Widget buildDataTable() {
    final columns = [
      'STT',
      'Khoản chi',
      'Số lượng',
      'Đơn giá dự kiến',
      'Thành tiền dự kiến',
      'Ngân sách',
      'Tình trạng',
    ];

    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => const Color.fromRGBO(0, 50, 106, 1),
      ),
      dataRowColor: MaterialStateColor.resolveWith(
        (states) => Colors.white,
      ),
      headingTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(_data),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Data> _data) => _data.map((Data getData) {
        final cells = [
          getData.index,
          getData.payName,
          getData.quanity,
          getData.expectPrice,
          getData.expectPayment,
          getData.budget,
          getData.status
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    switch (columnIndex) {
      case 0:
        {
          _data.sort((_data1, _data2) =>
              compare(ascending, _data1.index, _data2.index));
          break;
        }
      case 1:
        {
          _data.sort((_data1, _data2) =>
              compareString(ascending, _data1.payName, _data2.payName));
          break;
        }
      case 2:
        {
          _data.sort((_data1, _data2) =>
              compare(ascending, _data1.quanity, _data2.quanity));
          break;
        }
      case 3:
        {
          _data.sort((_data1, _data2) =>
              compareString(ascending, _data1.expectPrice, _data2.expectPrice));
          break;
        }
      case 4:
        {
          _data.sort((_data1, _data2) => compareString(
              ascending, _data1.expectPayment, _data2.expectPayment));
          break;
        }
      case 5:
        {
          print('need sort!');
          _data.sort((_data1, _data2) =>
              compareString(ascending, _data1.budget, _data2.budget));
          break;
        }
      case 6:
        {
          print('need sort!');
          _data.sort((_data1, _data2) =>
              compareString(ascending, _data1.status, _data2.status));
          break;
        }
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compare(bool ascending, int value1, int value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
