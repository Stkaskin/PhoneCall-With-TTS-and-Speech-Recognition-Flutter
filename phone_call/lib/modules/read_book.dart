import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_call/api/firebase_api.dart';

class Read_Book{
String table_name="book_read";
final String id ;
final String text;

Read_Book({required this.id,required this.text});

  Read_Book.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        text = res["text"];
        
        

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'text': text,
    
    };
  }

 Future< List<Read_Book>>  selection_get () async {
  
QuerySnapshot get=await  QueryGet(table_name);
List<Read_Book> send_class= [];
for (var item in get.docs) {
  Read_Book class_temp=Read_Book(
    id: item.id,
     text: item.get(text)
     );
send_class.add(class_temp);

  }
  return Future.value(send_class);
}



}