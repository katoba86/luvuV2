import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Crud{


  late User user;

  bool isLoggedIn() {
    return (FirebaseAuth.instance.currentUser!=null);
  }

  Future<void> addData(id,taskData) async {
    if(isLoggedIn()){
      FirebaseFirestore.instance.collection('doc$id').add(taskData).catchError((e){
        print(e);
      });
    }
  }

  getData(id) async{
    if(isLoggedIn()){
      return FirebaseFirestore.instance.collection('docs$id').snapshots();
    }
  }

}