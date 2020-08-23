import 'package:covid19/pages/india.dart';
import 'package:flutter/material.dart';
import 'package:covid19/pages/home.dart';
import 'package:covid19/pages/loader.dart';
import 'package:covid19/pages/choosecountry.dart';
import 'package:covid19/pages/indiaview.dart';
import 'package:flutter/services.dart';
import 'package:covid19/pages/SizeConfig.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
  runApp(MaterialApp(

      initialRoute: '/',
      routes: {

        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
        '/ind': (context) => Indiaview(),
        '/i':(context)=>India(),
      }
  ));
}