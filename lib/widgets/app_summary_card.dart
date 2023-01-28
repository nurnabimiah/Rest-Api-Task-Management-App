
import 'package:flutter/material.dart';

Card appSummaryCard(int counter, String title) {
  return Card(
    elevation: 5,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Text(counter.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          FittedBox(child: Text('$title Task')),
        ],
      ),
    ),
  );
}