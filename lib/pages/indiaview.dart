import 'dart:convert';
import 'package:covid19/services/india.dart';
import 'package:covid19/services/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'CutstomDialog.dart';



class Indiaview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
              child: JSONListView()
          ),
        ));
  }
}

class GetUsers {

  int id;
  String name;
  String email;
  String phoneNumber;
  String deaths;
  String active;

  GetUsers({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.deaths,
    this.active
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(

        name: json['state'],
        email: json['confirmed'],
        phoneNumber: json['recovered'],
        active:json['active'],
        deaths:json['death']
    );
  }
}

class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {
  TextEditingController searchController = new TextEditingController();
  String filter;
  final String apiURL = 'https://letshunt.herokuapp.com/get_report';

  Future<List<GetUsers>> fetchJSONData() async {
    print(apiURL);
    var jsonResponse = await http.get(apiURL);

    if (jsonResponse.statusCode == 200) {
      print(apiURL);
      final jsonItems = json.decode(jsonResponse.body);
      print(jsonItems);
      final h=jsonItems['state_wise'].cast<Map<String, dynamic>>();
      print(h);
      List<GetUsers> usersList = h.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();

      return usersList;

    } else {
      throw Exception('Failed to load data from internet');
    }
  }
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text('State Stats'),
        centerTitle: true,

      ),
      body:new Column(

        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search a State',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          new Expanded(child: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(

            children: snapshot.data
                .map((user) => Card(
              elevation: 14.0,
              margin:EdgeInsets.all(10.0),
              child:ListTile(

              title: Text(user.name ,textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: (){ showDialog(
                context: context,
                builder: (BuildContext context) => CustomDialog(
                  title: user.name,
                  description:
                  "Recovery Rate= "+(int.parse(user.phoneNumber)/int.parse(user.email)*100).toStringAsFixed(2)+"%\n Death Rate="+(int.parse(user.deaths)/int.parse(user.email)*100).toStringAsFixed(2)+"%",
                  buttonText: "Cool!",
                  rate:(int.parse(user.phoneNumber)/int.parse(user.email)*100).toStringAsFixed(2)+"%",
                ),
              );print(user.name); },
              //subtitle: Text(user.phoneNumber),
              subtitle:Wrap(
                alignment:WrapAlignment.center,
                children: <Widget>[SizedBox(
                width: 120.0,
                height: 90.0,
                child:  Card(
                  color: Colors.teal[200],
                    child: ListTile(
                  title:Text('confirmed' ,textAlign: TextAlign.center),
                  subtitle:Text(user.email,textAlign: TextAlign.center ,)
                )),
              ),
                SizedBox(
                  width: 120.0,
                  height: 90.0,
                  child: Card(
                      color: Colors.teal[100],
                      child: ListTile(

                      title:Text('active' ,textAlign: TextAlign.center),
                      subtitle:Text(user.active,textAlign: TextAlign.center ,)
                  )),
                ),
                SizedBox(
                  width: 120.0,
                  height: 90.0,
                  child: Card(
                      color: Colors.teal[100],
                      child: ListTile(
                      title:Text('recovered' ,textAlign: TextAlign.center),
                      subtitle:Text(user.phoneNumber,textAlign: TextAlign.center ,)
                  )),
                ),
                SizedBox(
                  width: 120.0,
                  height: 90.0,
                  child:  Card(
                      color: Colors.teal[200],
                      child: ListTile(
                      title:Text('deaths' ,textAlign: TextAlign.center),
                      subtitle:Text(user.deaths,textAlign: TextAlign.center ,)
                  )),
                ),
              ],),

            ),

            ),
            )
                .toList(),

          );

        },
      ),
    ),
    ],
    ),
    );
  }
}