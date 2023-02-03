


import 'package:flutter/material.dart';
import 'package:task_management_app/screens/add_new_task_screen.dart';
import 'package:task_management_app/screens/cancel_task_screen.dart';
import 'package:task_management_app/screens/completed_task_screen.dart';
import 'package:task_management_app/screens/inprogress_task_screen.dart';
import 'package:task_management_app/screens/new_task_screen.dart';

import '../widgets/reusable_appbar.dart';

class MainBottomNavBar extends StatefulWidget {
  static const String routeName = '/bottom_navbar_screen';
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {

  int currentSelectedScreen = 0;

  final List<Widget> screens = const[
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),
    InProgressTaskScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //
      //
      //floating action button
      floatingActionButton: currentSelectedScreen ==0 ?FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushNamed(context, AddNewTaskScreen.routeName);
        },
        child: Icon(Icons.add,),

      ):const SizedBox(),

      appBar: reusableAppbar(context,isTapable: true),
      //
      //.......................................
      //screen er vitor tmi current select screen ta k rakho

      body: screens[currentSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        currentIndex: currentSelectedScreen,
        showUnselectedLabels: true,
        elevation: 8,

        //
        //
        //  currentslected screen er vitor tomi rakho j item ta ke se select korse
        onTap: (index) {
          setState(() {
            currentSelectedScreen = index;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'New Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: 'Cancelled'),
          BottomNavigationBarItem(
              icon: Icon(Icons.refresh), label: 'In Progress'),
        ],

      ),
    );
  }

}
