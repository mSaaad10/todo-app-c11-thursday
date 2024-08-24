import 'package:flutter/material.dart';
import 'package:todo_c11_thursday/core/theme/app_theme.dart';
import 'package:todo_c11_thursday/ui/home/settings_tab/settings_tab.dart';
import 'package:todo_c11_thursday/ui/home/tasks_tab/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.lightPrimaryColor,
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings'),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    TasksTab(),
    SettingsTab(),
  ];
}
