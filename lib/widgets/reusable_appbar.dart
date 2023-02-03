


import 'package:flutter/material.dart';
import 'package:task_management_app/screens/profile_update_screen.dart';


//
//
//
//
// reusable appbar er kaj holo take tap korar por se onno ekta
// page a jabe kina tar desicon se niye nei
//
//

AppBar reusableAppbar(context,{bool isTapable = true}) {
  return AppBar(
    backgroundColor: Colors.green,
    title: ListTile(
      onTap: (){
        if(isTapable==false){
          return;
        }
        Navigator.pushNamed(context, ProfileUpdateScreen.routeName);
      },
      leading:  CircleAvatar(child: Icon(Icons.person,),backgroundColor: Colors.green.shade800,),
      title: Text('Nayon Ahmed'),
      subtitle: Text('Flutter Developer'),
    ),);
}
