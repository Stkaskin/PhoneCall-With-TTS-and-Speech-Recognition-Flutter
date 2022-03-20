


import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
showDialog<void>(context: context, builder: (_) =>funtion(), barrierDismissible: false);                 
*/

// ignore: must_be_immutable
class RadiusContainerWidget extends StatelessWidget {
  final Color color;
  Widget? child;
  double color_opacity=1.0;
 // double sizehigh;
  // ignore: use_key_in_widget_constructors
  RadiusContainerWidget({
    this.color = Colors.white,
     this.child,
      this.color_opacity=1
      });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container( 
        child: child,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(border: Border.symmetric(),
            borderRadius: BorderRadius.circular(120.0), color: color.withOpacity(color_opacity)),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget TextFieldInputDec(
    {TextEditingController? controllername, String? text}) {
  return TextField(
    controller: controllername,
    decoration: InputDecoration(
      icon: const Icon(Icons.send),
      hintText: text,
      helperText: text,
      //counterText: '0 characters',

      border: const OutlineInputBorder(),
    ),
  );
}



// ignore: non_constant_identifier_names
Widget NewButtonElement({    Key? key  ,    
  double  height=45,
    double  widht=125,
  Function? function,
  String text="Button",
  Color colortext=Colors.deepPurpleAccent,


Color colorbutton=Colors.white24,
double button_color_opacity=1.0,
double font_size=17
}){
  return ElevatedButton( 
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: font_size)),
          minimumSize:MaterialStateProperty.all<Size>(Size(widht,height)),
        backgroundColor:  MaterialStateProperty.all<Color>(colorbutton.withOpacity(button_color_opacity)) 
        ),            
        onPressed: () {
          if (function != null) {
            function();
          }
        },
        child: Text( text,
          style: TextStyle(color: colortext,)
  ));
  } 
// ignore: non_constant_identifier_names
Widget Correct_Dialog_Panel({required BuildContext context,String text="Top Text",String textunder="Bottom Text"}){
  return CupertinoAlertDialog(
    title: Text(text),
    content: Text(textunder),
    actions: [
      NewButtonElement(
        text: "Sonraki Soru",
        colortext: Colors.white,colorbutton: Colors.green.shade500,
        function: () {
      

        Navigator.pop(context);
      })
    ],
  );
  
}
// ignore: non_constant_identifier_names
Widget ErrorDialogPanel({required BuildContext context,String text="Top Text",String textunder="Bottom Text"}){
  return CupertinoAlertDialog(
    title: Text(text),
    content: Text(textunder),
    actions: [
      NewButtonElement(
        text: "Tamam",
        colortext: Colors.white,colorbutton: Colors.red.shade500,
        function: () {
      

        Navigator.pop(context);
      })
    ],
  );
  
}
// ignore: non_constant_identifier_names
Widget AletDialogPanel({required BuildContext context,String text="Top Text",String textunder="Bottom Text",Function? functionfirst }) {
  return CupertinoAlertDialog(
    title: Text(text),
    content: Text(textunder),
    actions: [
      NewButtonElement(
        text: "ARA",
        colortext: Colors.white,colorbutton: Colors.green,
        function: () {
      
    // ignore: prefer_if_null_operators
       functionfirst!=null?functionfirst:(){};
        Navigator.pop(context);
      }),
         NewButtonElement(
        text: "GERİ",
        
        colortext: Colors.white,colorbutton: Colors.red,
        function: () {
      
   // control();
        Navigator.pop(context);
      })
    ],
  );
}

// ignore: non_constant_identifier_names
AlertDialog MyWidgetAlertDialog({required BuildContext context,String? onaytext="Onayla",String? redtext="Red et",String? uptext="Yukarı Text",String? centertext="Orta Text",Function? onaybtnfunc,Function? redbtnfunc,Function? iptalbtnfunc}){
return  AlertDialog(
      title: Text(uptext!),
      
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Text(centertext!)
        ],
      ),
      actions: [
        NewButtonElement(colortext:   Colors.yellow,colorbutton: Colors.green,text: onaytext!,function: (){Navigator.pop(context);
        if (onaybtnfunc!=null){onaybtnfunc();}
        } ),
     NewButtonElement(colortext: Colors.yellow,colorbutton: Colors.red,text: redtext!,function: (){Navigator.pop(context);
           if (redbtnfunc!=null){redbtnfunc();}
     
     } ),
     NewButtonElement(colortext: Colors.yellow,colorbutton: Colors.brown,text: "Daha Sonra",function: (){Navigator.pop(context);
           if (iptalbtnfunc!=null){iptalbtnfunc();}
     } )

      
      ],
    );
}