import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:phone_call/api/firebase_api.dart';

class Question_Class{

 final String table_name = "question";
  final String Id;
    final String ask;
  final String answer_true;


  final String answer_false;
  const Question_Class({
required this.Id,
required this.ask,
required this.answer_true,required this.answer_false


  });
  Future< List<Question_Class>>  selection_get () async {
  
QuerySnapshot get= await QueryGet(table_name);
List<Question_Class> send_class= [];
for (var item in get.docs) {
  Question_Class class_temp=Question_Class(Id: item.id,
   ask: item.get("ask"),
    answer_true: item.get("answer_true"),
     answer_false: item.get("answer_false"));
send_class.add(class_temp);

  }
  return Future.value(send_class);
}
}