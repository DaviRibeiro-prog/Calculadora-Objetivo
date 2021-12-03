import 'package:flutter/material.dart';
import './HomePage_view.dart' as first;
import 'MediaTrimestral_view.dart' as second;
import 'MediaRT_view.dart' as third;
import 'MediaRF_view.dart' as fourth;
import 'MediaPGA_view.dart' as fifth;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    first.HomePage(),
    second.Media(),
    third.MediaRt(),
    fourth.MediaRf(),
    fifth.MediaPga(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.indigo,
          textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.grey)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.indigo,
          currentIndex: _currentIndex,
          iconSize: 35,
          selectedFontSize: 14,
          unselectedFontSize: 10,
          unselectedItemColor: Colors.black,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: 'Média Trimestral'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Média RT'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: 'Média RF'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Nota PGA'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
