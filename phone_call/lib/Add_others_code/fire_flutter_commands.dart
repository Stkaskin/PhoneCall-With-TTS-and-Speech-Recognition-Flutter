//https://firebase.flutter.dev/docs/auth/usage/ >> kaynak
//FirebaseAuth auth=FirebaseFirestore.instance;
//var a=FirebaseFirestore.instance;


//
/*
ADD doc
     // FirebaseFirestore.instance.collection("read_book").doc().set({'text': "book.text"});
  //    return Future.value(books);

 */
/*
try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "ask_1081@hotmail.com",
    password: "123456789.qQ"
  );
  if(userCredential!=null){
    print("giris başarılı.: "+    FirebaseAuth.instance.currentUser!.uid);

  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  
}*/

/*

17

This might sound a ridiculous solution but actually works so well, It's almost like the Like '%' query from SQL

In the TextField as you type a value the inside where() isGreaterThanOrEqualTowill compare it and all the string values greater than the input and If you concatinate a 'Z' At the end then isLessThan will end just after your search keyword and You get the desired Result from firestore.

// Declare your searchkey and Stream variables first
String searchKey;
Stream streamQuery;

TextField(
              onChanged: (value){
                  setState(() {
                    searchKey = value;
                    streamQuery = _firestore.collection('Col-Name')
                        .where('fieldName', isGreaterThanOrEqualTo: searchKey)
                        .where('fieldName', isLessThan: searchKey +'z')
                        .snapshots();
                  });
    }),

Future<List<DocumentSnapshot>> getSuggestion(String suggestion) =>
  Firestore.instance
      .collection('your-collection')
      .orderBy('your-document')
      .startAt([searchkey])
      .endAt([searchkey + '\uf8ff'])
      .getDocuments()
      .then((snapshot) {
        return snapshot.documents;
      });


      await Firestore.instance.collection('name of your collection').where('name of your list saved in the firebase', arrayContains: 'the name you are searching').getDocuments();


 response = await FirebaseFirestore.instance
                .collection('pointOFSale')
                .orderBy("title")
                .startAt([val.capitalize()]).endAt(
                    [val[0].toUpperCase() + '\uf8ff']).get();



               

soo simple and fast.

if (text.length > 1) {
  setState(() {
    tempSearchStore = _listPkh.documents.where((d) {
      if (d['nama'].toLowerCase().indexOf(text) > -1) {
        return true;
      } else if (d['alamat'].toLowerCase().indexOf(text) > -1) {
        return true;
      }
      return false;
    }).toList();
  });
} else {
  setState(() {
    tempSearchStore = _listPkh.documents;
  });
}
*/
