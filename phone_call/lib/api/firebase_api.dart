/*
https://console.firebase.google.com/project/f-app-01/storage/f-app-01.appspot.com/rules
*/

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:phone_call/modules/firebase_file.dart';
import 'package:phone_call/modules/question.dart';
import 'package:phone_call/modules/read_book.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi{
static Future<List<String>> _getDowlandLinks(List<Reference> refs) async => Future.wait(refs.map((ref) =>ref.getDownloadURL()).toList());
static Future<List<FirebaseFile>> listAll(String path) async{

  final ref=FirebaseStorage.instance.ref(path);
  
  final result =await ref.listAll();
  final urls=await _getDowlandLinks(result.items);
  return urls.asMap().map((index, url) {

final ref =result.items[index];
final name=ref.name;
final file=FirebaseFile(ref: ref, name: name, url: url);
return MapEntry(index, file);
  }).values.toList();
}



 static List<Read_Book> readItems() {
//read_command 
List<Read_Book> books=[];

FirebaseFirestore.instance
    .collection('read_book')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
//search list item 
            print(doc["text"]);
            books.add(Read_Book(id: doc.id, text: doc["text"]));
        }
        );
        return books;
    });
      return books;

   


}
static addItem(Read_Book book){

  FirebaseFirestore.instance.collection("read_book").doc().set({'text': book.text});
}


 
/**
 * FirebaseFirestore.instance
    .collection('read_book')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
//search list item 
            print(doc["text"]);
            books.add(Read_Book(id: doc.id, text: doc["text"]));
        }
        );
        return books;
    });
 * 
 * 
 */
}
 Future<List<Question_Class>> readItems() async {
//read_command 
List<Question_Class> books=[];


 await FirebaseFirestore.instance
    .collection('number_call')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
//search list item 
            print(doc.id);
            books.add(Question_Class(Id: "Id", ask: "ask", answer_true: "answer_true", answer_false: "answer_false"));
        
        }
        
        );
       Future.value(books);
    });
     // FirebaseFirestore.instance.collection("read_book").doc().set({'text': "book.text"});
      return Future.value(books);

   


}
/*
void aa ()async{
  QuerySnapshot querySnapshot=await QueryGet();
  
int i =querySnapshot.docs.length;

for (var a in querySnapshot.docs)
{
print(a.get("call_number") +""+"");
}

}*/
Future<QuerySnapshot> QueryGet(String table_name) async {
 return  await FirebaseFirestore.instance
    .collection(table_name)
    .get() ;
}
/*


/*

FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  FirebaseAuth.instance
  .idTokenChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });


*/
this is  a read command . Search and for list 
//https://firebase.flutter.dev/docs/firestore/usage/
FirebaseFirestore.instance
    .collection('read_book')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
//search list item 
            print(doc["text"]);
        });
    });


////
this is add item
FirebaseFirestore.instance.collection("read_book").doc().set({'text':"fuck2"});

*/
void pss(){

}