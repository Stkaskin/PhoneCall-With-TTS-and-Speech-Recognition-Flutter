
// ignore_for_file: file_names


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_call/api/firebase_api.dart';
import 'package:phone_call/modules/firebase_file.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_call/special_widget/specialwidgets.dart';

class FireAddApp extends StatelessWidget {
  const FireAddApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Page',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: const FireAddPage(title: 'Page'),
    );
  }
}
var ncall=TextEditingController();
class FireAddPage extends StatefulWidget {
  const FireAddPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FireAddPage> createState() => _FireAddPageState();
}

class _FireAddPageState extends State<FireAddPage> {
  late Future<List<FirebaseFile>> futureFiles;
  @override
  void initState(){
    super.initState();
    FirebaseApi.readItems();
futureFiles  =  FirebaseApi.listAll('files/');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:Text("data")
        
         /*NewButtonElement(function: (){



//add
//FirebaseFirestore.instance.collection("read_book").doc().set({'text':"fuck2"});
/**/

 FirebaseFirestore.instance
    .collection('read_book')
    //.get()
    //.then((QuerySnapshot querySnapshot) {
    //    querySnapshot.docs.forEach((doc) {
//search list item 
            print(doc["text"]);
     //       books.add(Read_Book(id: doc.id, text: doc["text"]));
//}
    //    );
        return books;
    //});

 */

      //  })*/
        
       
        
          
        );
  }
  Widget buildFile(BuildContext context,FirebaseFile file)=>ListTile(

title:Text(file.name)

  );
  Widget buildHeader(int lenght)=>ListTile( 
    tileColor: Colors.blue,
    // ignore: sized_box_for_whitespace
    leading: Container(
      width: 52,height: 52,
      child: const Icon(Icons.file_copy),
    
    )
  );

  // ignore: non_constant_identifier_names
}