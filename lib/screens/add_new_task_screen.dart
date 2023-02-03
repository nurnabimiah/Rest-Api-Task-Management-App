
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(context,isTapable: false),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add New Task',style: pageTitleTextStyle(),),
                const SizedBox(height: 16,),
                TextField(
                  decoration: textFiledinputDecoration('Subject'),
                ),

                const SizedBox(height: 16,),

                TextField(
                  maxLines: 10,
                  decoration: textFiledinputDecoration('Description'),
                ),
                const SizedBox(height: 16,),
                ReusableElevattedButton(onTap: (){},text: 'Add Task',)
                
              ],
            ),
          ),
        ),
      ),


    );
  }
}
