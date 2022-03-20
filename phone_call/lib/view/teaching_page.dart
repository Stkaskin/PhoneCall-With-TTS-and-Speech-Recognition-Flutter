import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_call/api/firebase_api.dart';
import 'package:phone_call/main.dart';
import 'package:phone_call/modules/read_book.dart';
import 'package:phone_call/special_widget/specialwidgets.dart';



class TeachApp extends StatefulWidget {
  const TeachApp({Key? key}) : super(key: key);

  @override
  _TeachApp createState() => _TeachApp();
}

class _TeachApp extends State<TeachApp> {
List<Read_Book> reads=[Read_Book(id: "id", text: "text")];
  Future<List<Read_Book>>? readF;
 

  @override  
  
  void initState() {
    super.initState();
    loadData();
  }
     loadData()async{  
       
 // reads=await readItems();
    setState(() {
        readF=Future.value(reads);
    });   
  }
  @override
  Widget build(BuildContext context) {
 // TODO: implement build
    return ScaffoldReadPage();
  }
  Scaffold ScaffoldReadPage() {
    return Scaffold(
       body: Column(
      children: [
        Expanded( child:  
        projectWidget() ,
        )  
      ],
    ),
  );
  }
  Widget projectWidget() {  

return RadiusContainerWidget(child: SizedBox(),color: Colors.blue );

}

}

