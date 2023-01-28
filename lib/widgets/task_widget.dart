

import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.type,
    required this.OnEditTap,
    required this.onDeleteTap,
    required this.date,
  }) : super(key: key);

  final String title, description, type,date;
  final VoidCallback OnEditTap, onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListTile(
        tileColor: Colors.green.withOpacity(0.1),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Text(date),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(type),
                  backgroundColor: Colors.green,
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      onPressed: onDeleteTap,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: OnEditTap,
                      icon: Icon(
                        Icons.edit_note,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}