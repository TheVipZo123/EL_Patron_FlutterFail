
import 'package:flutter/material.dart';
import 'package:flutter_application_el_patron/reusableWidgets/reusable_widget.dart';



class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Color(0xFF1a2f45),
          
          centerTitle: true,
        ),
      );
}
