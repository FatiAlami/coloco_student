import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You are now logged in'),
                SizedBox(
                  height:15.0,
              ),
              FlatButton(
                child: Text('Ajouter Un Offre'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.of(context).pushNamed("/dash");
                },
              ),
              FlatButton(
                child: Text('Lister Les Offres'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.of(context).pushNamed("/map");
                },
              ),
              new OutlineButton(
                borderSide: BorderSide(
                    color: Colors.red,
                    style: BorderStyle.solid,
                    width: 3.0
                ) ,
                child: Text('logout'),
                onPressed: (){
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) {
                    Navigator.of(context)
                        .pushReplacementNamed('/landingpage');
                  })
                      .catchError((e) {
                    print(e);
                  });
                },
              ),
            ],
          ),
        ),
      ));
  }
}
