
import 'package:flutter/material.dart';
import 'package:task_management_app/widgets/task_widget.dart';

class CompletedTaskScreen extends StatefulWidget {
  static const String routeName = '/completedtask_screen';

  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
         return TaskWidget(
           title: 'Title',
           description: 'Sub title is here',
           type: 'Completed',
           onDeleteTap: () {  },
           OnEditTap: () {  },
           date: '23 january',
         );
        });
  }
}
