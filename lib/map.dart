import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() =>runApp(MyMap());

class MyMap extends StatefulWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMapPage(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class MyMapPage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState  extends State<MyMapPage>{
  bool mapToggle = false;
  var currentLocation;
  var clients = [];
  GoogleMapController mapController;
  void initState(){
    super.initState();
    Geolocator().getCurrentPosition().then((currloc){
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Les offres') ,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height -80.0,
            width: double.infinity,
            child: mapToggle?
            GoogleMap(
               onMapCreated: onMapCreated,
               initialCameraPosition: CameraPosition(
                target: LatLng(currentLocation.latitude, currentLocation.longitude),
                zoom: 10.0,
              ),
            ):
            Center(child: 
              Text('Loading.. Please Wait..',
                style:TextStyle(
                  fontSize: 20.0
                ) ,
              )
            ),
          )
        ],
      ),
    );
  }
  void onMapCreated(controller){
    mapController = controller;
  }
}