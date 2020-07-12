import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colocationprojet/services/crud.dart';

class DashboardPage extends StatefulWidget{
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String sup;
  String adress;
  String tel;
  String capacity;
  String prix;
  String wifi;
  String lat;
  String lon;
  crudMethods crudObj = new crudMethods();
  QuerySnapshot markers;

  Future<bool> addDialog(BuildContext context) async{
    List<String> _values = ["True","False"];
    String _value = _values.elementAt(0);
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
          return AlertDialog(
            title: Text('Add Data',style: TextStyle(fontSize: 15.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration:InputDecoration(hintText: 'Adress') ,
                  onChanged: (value){
                    this.adress = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:InputDecoration(hintText: 'area') ,
                  onChanged: (value){
                    this.sup = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:InputDecoration(hintText: 'Phone Number') ,
                  onChanged: (value){
                    this.tel = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:InputDecoration(hintText: 'Capacity') ,
                  onChanged: (value){
                    this.capacity = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:InputDecoration(hintText: 'price') ,
                  onChanged: (value){
                    this.prix = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:InputDecoration(hintText: 'Wifi') ,
                  onChanged: (value){
                    this.wifi = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:InputDecoration(hintText: 'latitude') ,
                  onChanged: (value){
                    this.lat = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:InputDecoration(hintText: 'longitude') ,
                  onChanged: (value){
                    this.lon = value;
                  },
                ),
                SizedBox(height: 5.0)]),
            actions: <Widget>[
              FlatButton(
                child: Text('add'),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.of(context).pop();
                  Map<String,dynamic> Data = {
                    'Adresse':this.adress,
                    'tel':this.tel,
                    'superficie':this.sup,
                    'capacite':this.capacity,
                    'prix':this.prix,
                    'wifi':this.wifi,
                    'location':[this.lon,this.lat]
                  };
                  crudObj.addData(Data).then((result){
                    dialogTrigger(context);
                  }).catchError((e){
                    print(e);
                  });
                },
              )
            ],
          );
      });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('done',style: TextStyle(fontSize: 15.0)),
            content: Text('added'),
            actions: <Widget>[
              FlatButton(
                child: Text('Alright'),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  @override
  void initState(){
    crudObj.getData().then((results){
      setState(() {
        markers = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text('Ajouter Un offre'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              addDialog(context);
            },
          )
        ],
      ),
      body: _markersList());
  }

  Widget _markersList(){
    if(markers != null){
      return ListView.builder(
        itemCount: markers.documents.length,
        padding:EdgeInsets.all(5.0),
        itemBuilder: (context,i){
          return new ListTile(
            title: Text('Price: ${markers.documents[i].data['prix']} MAD'),
            subtitle: Text('Capacity: ${markers.documents[i].data['capacite']}'),
          );
        }
      );
    }else{
      return Text('loading.. Please wait ...');
    }
  }
}













