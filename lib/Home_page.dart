/* ===================== HOME PAGE  ===================== */

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Menu_Drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EduBuddy',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
            ),
          ),
        ),
      ),
      drawer: MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 600,
            child: Center(
              child: Text(
                "Education is the backbone of a country! Container 1 ",
                style: TextStyle(color: Color.fromARGB(97, 206, 22, 22)),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: 600,
            child: Center(
              child: Text(
                "Education is the backbone of a country! Container 2",
                style: TextStyle(color: Color.fromARGB(96, 241, 4, 4)),
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: 600,
            child: Center(
              child: Text(
                "Education is the backbone of a country! Container 3",
                style: TextStyle(color: Color.fromARGB(96, 247, 77, 77)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
