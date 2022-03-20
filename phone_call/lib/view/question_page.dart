import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:phone_call/modules/question.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:phone_call/special_widget/specialwidgets.dart';

class QuestionApp extends StatefulWidget {
  const QuestionApp({Key? key}) : super(key: key);

  @override
  _QuestionApp createState() => _QuestionApp();
}

class _QuestionApp extends State<QuestionApp> {
  //programın geliştirici ayarları özel ayarlar
  final FlutterTts flutterTts = FlutterTts();
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  double font_ask_size = 25.0;
  double font_correct_size = 25.0;
  String font_text_family = "";

  Question_Class the_selection = Question_Class(
      Id: "Id",
      ask: "ask",
      answer_true: "answer_true",
      answer_false: "answer_false");

  List<Question_Class> read_list = [];
  bool correct_answer = false;
  var button1 = "";
  var button2 = "";
  var ask = "";
  var question_index = -1;
  var text_style;
  List search_list_name = ["sıtkı", "ali", "oğuz", "ziya"];
  @override
  void initState() {
    super.initState();
    loadData();
    _initSpeech();
    flutterTts.setLanguage("tr-TR");
    flutterTts.setPitch(1);
  }

  void _speak(String data) {
    flutterTts.setLanguage("tr-TR");
    flutterTts.setPitch(1);

    // print( await flutterTts.getVoices);
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  Future _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  loadData() async {
    read_list = await the_selection.selection_get();
    1 == 1;
    setState(() {
      read_list;
      previous_or_next_Question(1);
      text_style = TextStyle(fontSize: font_ask_size);
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
          SizedBox(
            height: 50,
          ),
          NewButtonElement(function: () {
            _listen();
          }),
          Expanded(
              flex: 2,
              child: RadiusContainerWidget(
                color: Colors.blue,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    //     previous_or_next_Question(1);

                    ElevatedButton.icon(
                        onPressed: () => previous_or_next_Question(-1),
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 35,
                        ),
                        label: Text("ÖNCEKİ"))
                  ],
                ),
              )),
          Expanded(
            flex: 10,
            child: RadiusContainerWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ask,
                    style: text_style,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RadiusContainerWidget(
              color: Colors.white10,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: row_audio_widget(
                        answer_text: button1, voice: "Dinle", answer: true),
                  ),
                  Expanded(
                    flex: 5,
                    child: row_audio_widget(
                        answer_text: button2, voice: "Dinle", answer: false),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget row_audio_widget(
      {required String voice,
      required String answer_text,
      required bool answer}) {
    return Column(
      children: [
        widget_expanded_radiuscontainer_newbutton_widget(
            text: voice,
            answer: answer,
            flex: 3,
            function: () {
              _speak(answer_text);
            }),
        widget_expanded_radiuscontainer_newbutton_widget(
            text: "SEÇ",
            answer: answer,
            flex: 5,
            function: () async {
              if (correct_answer == answer) {
                print("dogru");
                /*  showDialog<void>(
                context: context,
                builder: (_) =>
                    Correct_Dialog_Panel(context: context, text: ""),
                barrierDismissible: false);*/

                previous_or_next_Question(1);
              } else {
                await _listen();
                print("ssss:" + _text);
                //  _speak("Sıtkı");
              }
            })
      ],
    );
  }

  Expanded widget_expanded_radiuscontainer_newbutton_widget(
      {int flex = 1,
      required String text,
      required bool answer,
      required Function function}) {
    return Expanded(
      flex: flex,
      child: RadiusContainerWidget(
          child: NewButtonElement(
        text: text,

        // colorbutton: Colors.white24,
        function: () {
          function();
        },
      )),
    );
  }

  void _listen_error() {}

  bool arama = false;
  String _text = "";

  Future _listen() async {
    if (!_speechEnabled) {
      bool available = await _speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        setState(() => _speechEnabled = true);
        _speechToText.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords.toUpperCase();
            if (val.hasConfidenceRating && val.confidence > 0) {
              var _confidence = val.confidence;
              print("con:" + _confidence.toString());
              print("text:" + _text.toString());
              for (var item in search_list_name)
                // ignore: curly_braces_in_flow_control_structures
                if (patl(item.toString().toUpperCase(), _text)) {
                  //    _stopListening();
                  Future.sync(() => _speechToText.stop());
                  ara(item);
                  break;
                }
            }

            // var aa=_text.split("sıtkı");
          }),
        );

        //  return  _text;

      }
    } else {
      setState(() => _speechEnabled = false);
      _speechToText.stop();
    }
  }

  Future ara(String item) async {
    await Future.delayed(Duration(seconds: 1), () async {
      await flutterTts.speak(item + " Aranıyor");
    });
    return await Future.delayed(Duration(seconds: 3), () async {
      await FlutterPhoneDirectCaller.callNumber("05469359716");
    });
  }

  bool patl(String pat, String txt) {
    int M = pat.length;
    int N = txt.length;

    /* A loop to slide pat[] one by one */
    for (int i = 0; i <= N - M; i++) {
      int j;

      /* For current index i, check for pattern match */
      for (j = 0; j < M; j++) if (txt[i + j] != pat[j]) break;

      if (j == M) {
        // if pat[0...M-1] = txt[i, i+1, ...i+M-1]
        return true;
      }
    }
    return false;
  }

  void previous_or_next_Question(int next) {
    if (read_list.length - 2 < question_index) {
      question_index = read_list.length - 1;
    }

    question_index += next;
    if (question_index < 0) question_index = 0;
    if (question_index == read_list.length)
      question_index = read_list.length - 1;
    the_selection = read_list[question_index];
    Random a = Random();
    ask = the_selection.ask;
    int ran = a.nextInt(100);
    if (ran % 2 == 0) {
      button1 = the_selection.answer_true;
      button2 = the_selection.answer_false;

      correct_answer = true;
    } else {
      button2 = the_selection.answer_true;
      button1 = the_selection.answer_false;

      correct_answer = false;
    }

    // ignore: unnecessary_null_comparison

    setState(() {});
  }

  Widget projectWidget() {
    return FutureBuilder(
        builder: (context, AsyncSnapshot<List<Question_Class>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                reverse: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          ErrorDialogPanel(
                              context: context,
                              text: snapshot.data![index].Id,
                              textunder: snapshot.data![index].answer_false);
                        },
                        title: Text("F"),
                        subtitle: Text(
                            "#" + "\n" + "E".toString() /* .substring(0, 16)*/),
                        leading: Text("R"),
                        isThreeLine: (true),
                        trailing: const Text("Ks"),
                      ),
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
        future: Future.value(read_list));
  }
}
