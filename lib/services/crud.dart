import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: camel_case_types
class crudMethods {
  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser() != null){
      return true;
    }else{
      return false;
    }}

  Future<void> addData(dataPass) async{
    if(isLoggedIn()){
      Firestore.instance.collection('markers').add(dataPass).catchError((e){
        print(e);
      });
    }else{
      print('You need to be logged in');
    }}

  getData() async{
    return await Firestore.instance.collection('markers').getDocuments();
  }}