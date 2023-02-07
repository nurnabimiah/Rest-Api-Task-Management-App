import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_management_app/models/new_task_model.dart';
import 'package:task_management_app/network_services/network_requester.dart';
import 'package:task_management_app/network_services/urls.dart';
import 'package:task_management_app/widgets/reusable_elevated_button.dart';

import '../widgets/app_summary_card.dart';
import '../widgets/task_widget.dart';
import '../widgets/text_style.dart';

class NewTaskScreen extends StatefulWidget {
  static const String routeName = '/newtask_screen';

  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  NewTaskModel? _newTaskModel;

  @override
  void initState() {
    super.initState();
    /*
    * build method call houar age se api ta k call kore nite para
    * ai karone code k optimize korar jonno amra widgets binding er instance
    * ta amra create kore nibo
    * */

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllNewtaskFromApi();
    });
  }

  Future<void> getAllNewtaskFromApi() async {
    final response = await NetworkRequester().getRequest(Urls.newTaskurl);
    if (response['status'] == 'success') {
      _newTaskModel = NewTaskModel.fromJson(response);
      setState(() {});
    }
  }

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
        if (_newTaskModel == null)
          Expanded(
              child: Center(
            child: CircularProgressIndicator(),
          ))
        else
          Expanded(
            child: RefreshIndicator(

              onRefresh: () async {
                getAllNewtaskFromApi();
              },
              child: ListView.builder(
                  itemCount: _newTaskModel?.tasks?.length ?? 0,
                  itemBuilder: (context, index) {
                    final task = _newTaskModel!.tasks![index];

                    return TaskWidget(
                      title: task.title ?? 'Unknown',
                      description: task.description ?? 'Unknown',
                      type: task.status ?? 'New',
                      onDeleteTap: () {},
                      OnEditTap: () {
                        showModalSheetForChangeStatus(task.sId ?? '');
                      },
                      date: task.createdDate ?? 'Unknwon',
                    );
                  }),
            ),
          ),
      ],
    );
  }

  void showModalSheetForChangeStatus(String taskId) {
    String? taskStatus = 'In Progress';

    bool taskStatusChangeInProgress = false;

    showModalBottomSheet(
        context: context,
        builder: (context,) {
          /*

           **
           **
           changestate ta setState er motho
           */
          return StatefulBuilder(builder: (context, changeState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Change status of task', style: pageTitleTextStyle()),
                  const SizedBox(height: 24),
                  RadioListTile(
                      title: const Text('In Progress'),
                      value: 'In Progress',
                      onChanged: (value) {
                        /*value mane holo jeita type kortase seita*/
                        taskStatus = value! as String;
                        changeState(() {});
                      },
                      groupValue: taskStatus),
                  RadioListTile(
                    groupValue: taskStatus,
                    title: const Text('Completed'),
                    value: 'Completed',
                    onChanged: (value) {
                      taskStatus = value! as String?;
                      changeState(() {});
                    },
                  ),
                  RadioListTile(
                    groupValue: taskStatus,
                    title: const Text('Cancelled'),
                    value: 'Cancelled',
                    onChanged: (value) {

                      changeState(() { taskStatus = value! as String?;});
                    },
                  ),
                  const SizedBox(height: 24),
                  if (taskStatusChangeInProgress)
                    const Center(child: CircularProgressIndicator())
                  else
                    ReusableElevattedButton(
                      text: 'Submit',
                      onTap: () async {
                        taskStatusChangeInProgress = true;
                        changeState(() {});
                        final response = await NetworkRequester()
                            .getRequest(Urls.changeStatus(taskId, taskStatus!));
                        taskStatusChangeInProgress = false;
                        changeState(() {});
                        if (response['status'] == 'success') {
                             getAllNewtaskFromApi();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Status change successful!')));
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Status change failed! Try again')));
                        }
                      },

                    )

                ]
              ),
            );
          });
        });
  }
}
