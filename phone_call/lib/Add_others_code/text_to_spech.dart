/*

_initSpeech();
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
void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }


   void _listen() async {
    if (!_speechEnabled) {
      bool available = await _speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _speechEnabled = true);
        _speechToText.listen(
          onResult: (val) => setState(() {
        String    _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
            var  _confidence = val.confidence;
            print("con:"+_confidence.toString());
            }
            print("text:"+_text.toString());
          }),
        );
      }
    } else {
      setState(() => _speechEnabled = false);
      _speechToText.stop();
     
    }

  
  }
*/