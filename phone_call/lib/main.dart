

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_call/api/firebase_api.dart';
import 'package:phone_call/modules/firebase_file.dart';
import 'package:phone_call/modules/read_book.dart';
import 'package:phone_call/special_widget/specialwidgets.dart';
import 'package:phone_call/view/addRead.dart';
import 'package:phone_call/view/detail_and_call.dart';
import 'package:phone_call/view/question_page.dart';
import 'package:phone_call/view/read_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  
 // runApp( FireApp());
 runApp( FireApp());
}
var a=0;
class FireApp extends StatelessWidget {
  const FireApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: 
     // MessageApp(),
        //QuestionApp(),
    // Read_Page()
     FirePage(title: 'Page'),
    );
  }
}
var ncall=TextEditingController();
class FirePage extends StatefulWidget {
  const FirePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirePage> createState() => _FirePageState();
}

class _FirePageState extends State<FirePage> {
  
  late Future<List<FirebaseFile>> futureFiles;
  
  @override
  void initState(){
    super.initState();
loadData();

  }
  loadData() {
    futureFiles  =  FirebaseApi.listAll('files/');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
      // ReadApp()
        
      Column(children: [
                      NewButtonElement(function:
                       (){  Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>MessageApp()),); }),
                         FutureFileGet()],
         
          
    ));
  }

  FutureBuilder<List<FirebaseFile>> FutureFileGet() {
    return FutureBuilder<List<FirebaseFile>>(future: 
      futureFiles,builder: (context,snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
          
          default:
          if (snapshot.hasError){
            return Center(child: Text("Some error occured!"));
           
          }
           else {
          final files=snapshot.data!;
           return Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             //buildHeader(0),
          const SizedBox(height: 12,),
          Expanded(child: 
          ListView.builder(itemBuilder: 
          (context,index){
 final file=files[index];

 return buildFile(context,file);

          },
          itemCount: files.length,)
          )
           
           ],
            );
          }
        }
      }
      
      
      ,);
  }
  Widget buildFile(BuildContext context,FirebaseFile file)=>ListTile(

title:Text(file.name)

  );
 /* Widget buildHeader(int lenght)=>ListTile( 
    tileColor: Colors.blue,
    leading: Container(
      width: 52,height: 52,
      child: Icon(Icons.file_copy),
    
    )
  );*/

  // ignore: non_constant_identifier_names

}


