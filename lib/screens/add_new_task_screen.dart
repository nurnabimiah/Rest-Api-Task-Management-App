import 'package:flutter/material.dart';
import 'package:task_management_app/network_services/network_requester.dart';
import 'package:task_management_app/widgets/background_image.dart';
import 'package:task_management_app/widgets/reusable_elevated_button.dart';
import 'package:task_management_app/widgets/text_style.dart';

import '../widgets/reusable_appbar.dart';
import '../widgets/textfiled_input_decoration.dart';

class AddNewTaskScreen extends StatefulWidget {
  static const String routeName = '/addNew_task_screen';
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController subTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool inprogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(context, isTapable: false),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Task',
                    style: pageTitleTextStyle(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: subTextEditingController,
                    decoration: textFiledinputDecoration('Subject'),
                    validator: (String?value) {
                      if (value == null || value.isEmpty || value.trim().isEmpty) {
                        return 'Enter your task subject';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: descriptionTextEditingController,
                    maxLines: 10,
                    decoration: textFiledinputDecoration('Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty|| value.trim().isEmpty) {
                        return 'Enter your task description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  if(inprogress)
                    Center(child: CircularProgressIndicator(),)
                  else
                  ReusableElevattedButton(
                    onTap: () async {
                      inprogress = true;
                      setState((){

                      });
                      if (_formkey.currentState!.validate()) {
                        final response = await NetworkRequester().postRequest(
                            'https://task.teamrabbil.com/api/v1/createTask', {
                          "title": subTextEditingController.text.trim(),
                          "description": descriptionTextEditingController.text.trim(),
                          "status": "New"
                        });

                        print(response);
                        inprogress  = false;
                        setState((){

                        });

                        if(response['status']=='success'){
                          subTextEditingController.text = '';
                          descriptionTextEditingController.text = '';
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
                           'New task has been added'
                          )));

                        }
                      }

                    },
                    text: 'Add Task',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
