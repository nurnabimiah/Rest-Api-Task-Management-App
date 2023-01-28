import 'package:flutter/material.dart';

import '../widgets/app_summary_card.dart';
import '../widgets/task_widget.dart';

class NewTaskScreen extends StatefulWidget {
  static const String routeName = '/newtask_screen';

  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: appSummaryCard(12, 'New')),
            Expanded(child: appSummaryCard(7, 'Completed')),
            Expanded(child: appSummaryCard(3, 'Cancelled')),
            Expanded(child: appSummaryCard(2, 'In Progress')),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TaskWidget(
          title: 'Title',
          description: 'Sub title is here',
          type: 'New',
          onDeleteTap: () {  },
          OnEditTap: () {  },
          date: '23 january',
        ),
        TaskWidget(
          title: 'Title',
          description: 'Sub title is here',
          type: 'New',
          onDeleteTap: () {  },
          OnEditTap: () {  },
          date: '23 january',
        ),
        TaskWidget(
          title: 'Title',
          description: 'Sub title is here',
          type: 'New',
          onDeleteTap: () {  },
          OnEditTap: () {  },
          date: '23 january',
        ),

      ],
    );
  }
}


