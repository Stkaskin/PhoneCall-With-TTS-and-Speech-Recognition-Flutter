import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_call/api/firebase_api.dart';
import 'package:phone_call/main.dart';
import 'package:phone_call/modules/read_book.dart';
import 'package:phone_call/special_widget/specialwidgets.dart';



class ReadApp extends StatefulWidget {
  const ReadApp({Key? key}) : super(key: key);

  @override
  _ReadApp createState() => _ReadApp();
}

class _ReadApp extends State<ReadApp> {
List<Read_Book> reads=[Read_Book(id: "id", text: "text")];
  Future<List<Read_Book>>? readF;
 

  @override  
  
  void initState() {
    super.initState();
    loadData();
  }
     loadData()async{  
       
  //readF=await readItems();
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

   return  FutureBuilder(
                
                builder: (context, AsyncSnapshot<List<Read_Book>> snapshot) {
                  if (snapshot.hasData) {

                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        reverse: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            
                            child: Card(
                              child: ListTile(onTap: (){
                                ErrorDialogPanel(context: context,text: snapshot.data![index].text,textunder:  snapshot.data![index].id);
                         
                              },
                                title: Text(
                                    "F"),
                                subtitle: Text("#" +
                                  
                                    "\n" +
                                   "E"
                                        .toString()
                                       /* .substring(0, 16)*/),
                                leading:
                                    Text("R"),
                                isThreeLine: (true),
                                trailing:  const Text("Ks"),
                                                              ),
                                ),
                              
                            
                          );
                        });
                  } else {
                    return const SizedBox();
                  }
                },future:  readF);

}

}



