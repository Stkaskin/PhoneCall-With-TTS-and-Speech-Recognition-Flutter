import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:phone_call/api/firebase_api.dart';

class Call_Number {
  final String table_name = "number_call";
  final String Id;
  final String call_number;
  final String phone_name;

  final String file_name;
  final String file_path;
  const Call_Number(
      {required this.Id,
      required this.call_number,
      required this.phone_name,
      required this.file_name,
      required this.file_path});
      
  Future<List<Call_Number>> selection_get() async {
    QuerySnapshot get = await QueryGet(table_name);
    List<Call_Number> send_class = [];
    for (var item in get.docs) {
      Call_Number class_temp = Call_Number(
          Id: item.id,
          call_number: item.get("call_number"),
          phone_name: item.get("answer_true"),
          file_name: item.get("answer_false"),
          file_path: item.get("answer_false"));

      send_class.add(class_temp);
    }
    return Future.value(send_class);
  }
}
