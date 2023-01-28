
import 'package:flutter/material.dart';

import '../widgets/task_widget.dart';

class CancelTaskScreen extends StatefulWidget {

  static const String routeName = '/canceltask_screen';

  const CancelTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return TaskWidget(
            title: 'Title',
            description: 'Sub title is here',
            type: 'Cancelled',
            onDeleteTap: () {  },
            OnEditTap: () {  },
            date: '23 january',
          );
        });
  }
}
