import 'dart:async';
import 'dart:io';

import 'package:covid19/services/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    iccheck();

  }
  void iccheck(){
    Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            setupWorldTime();
            print('connected');
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog();
        print('not connected'); // show dialog
      }
    });
  }
  void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Internet needed!"),
        content: Text("Please turn on the internet"),
        actions: <Widget>[FlatButton(child: Text("Refresh"), onPressed: () {iccheck();})],
      ),
    );
  }
  void setupWorldTime() async {

    CountryStats instance=CountryStats(url:'World');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {

      'location':instance.location,
      'worldtotal': instance.worldtotal,
      'worldrecover': instance.worldrecover,
      'worlddeaths': instance.worlddeaths,
     'todaycases':instance.todaycases,
     'todaydeaths':instance.todaydeaths,
     'activecases':instance.activecases,
     'criticalcases':instance.criticalcases,
     'totaltests':instance.totaltests,
     'casesmil':instance.casesmil,
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}