import 'package:data_table/page/sortable_page.dart';
import 'package:flutter/material.dart';

Future main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Data Table';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  MainPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            child: Container(
              width: double.infinity,
              height: 500,
              child: SortablePage(),
            ),
          ),
        ),
      );
}
