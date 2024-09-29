import 'package:flutter/material.dart';
import 'package:boxigo_assignment/pages/leads.dart';

class Boxigo extends StatefulWidget {
  const Boxigo({super.key});

  @override
  State<Boxigo> createState() {
    return _BoxigoState();
  }
}

class _BoxigoState extends State<Boxigo> {
  int currentIndex = 1;
  List<Widget> widgetList = const [
    Center(
      child: Text('Home'),
    ),
    Leads(),
    Center(
      child: Text('Tasks'),
    ),
    Center(
      child: Text('Reports'),
    ),
    Center(
      child: Text('more'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.orange[900],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_alt), label: 'Leads'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reports'),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined), label: 'more'),
        ],
      ),
    );
  }
}
