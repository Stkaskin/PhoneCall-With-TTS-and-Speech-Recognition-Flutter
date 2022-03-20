import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:phone_call/special_widget/specialwidgets.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageApp extends StatelessWidget {
  const MessageApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message Page',
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
      home: const DetailCall_Page(title: 'Page'),
    );
  }
}
var ncall=TextEditingController();
class DetailCall_Page extends StatefulWidget {
  const DetailCall_Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DetailCall_Page> createState() => _DetailCall_PageState();
}

class _DetailCall_PageState extends State<DetailCall_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

           //   TextFieldInputDec(text: "Numara",controllername: ncall),
            /*  NewButtonElement(text: "ARA",height: 70,function: ()async{
await  FlutterPhoneDirectCaller.callNumber(ncall.text);
              }),*/
              // ignore: avoid_unnecessary_containers
              call_image_container_Widget(),
                call_image_container_Widget(name: "Child  2",phone: "054693597xx"),
               call_image_container_Widget(name: "Child  3",phone: "054693597xx"),
              call_image_container_Widget(name: "Child 4",phone: "054693597xx"),
          call_image_container_Widget(name: "Child 5",phone: "054693597xx"),
            call_image_container_Widget(name: "Child 6",phone: "054693597xx"),
            ],
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  RadiusContainerWidget call_image_container_Widget({String name="OĞLUM",String phone="05469359716",String  image='assets/images/fff.jpg'}) {
    return RadiusContainerWidget(
              color: Colors.grey.shade400,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Expanded(
                          child: const Image(
                              image: AssetImage('assets/images/fff.jpg'),),
                        )
// ignore: prefer_const_constructors
                        ,
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            // ignore: prefer_const_literals_to_create_immutables
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                 Text(
                                  name,
                                  style: TextStyle(fontSize: 30),
                                ),
                                 Text(
                                  phone,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ))
                        //    Image.asset('lib/image_asset/fff.jpg')
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call,color: Colors.green,),
                        onPressed: () async{


await  FlutterPhoneDirectCaller.callNumber("05469359716");
                         // launch('tel://05469359716');
showDialog<void>(context: context, builder: (_) =>AletDialogPanel(
  
  context: context,

  text: "OĞLUN 10 SANİYE İÇİNDE ARANACAK ",
textunder: "Aramayı iptal etmek ister misin ?" ,
functionfirst:() async{launch('tel://05469359716');}


), barrierDismissible: false);

                        },
                        iconSize: 60,
                      ),
                    ],
                  )
                ],
              ),
            );
  }
}
