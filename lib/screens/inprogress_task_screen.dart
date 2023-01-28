
import 'package:flutter/material.dart';

import '../widgets/task_widget.dart';

class InProgressTaskScreen extends StatefulWidget {
  static const String routeName = '/inprogresstask_screen';
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return TaskWidget(
            title: 'Title',
            description: 'Sub title is here',
            type: 'Progress',
            onDeleteTap: () {  },
            OnEditTap: () {  },
            date: '23 january',
          );
        });
  }
}
