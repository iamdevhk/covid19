import 'package:covid19/pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid19/pages/home.dart';
import 'package:covid19/pages/choosecountry.dart';
import 'package:covid19/pages/SizeConfig.dart';
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

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();

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

class _HomeState extends State<Home> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;
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
  int _selectedIndex = 0;
  Map data = {};

  @override
  Widget build(BuildContext context) {


    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    // set background image
    String bgImage =  'Premium.jpg';
    int _currentIndex=0;
    Color bgColor =  Colors.white;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text('Covid-19'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),




     drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.teal[100],
        selectedItemColor: Colors.deepPurple[900],
        unselectedItemColor: Colors.black,
         // this will be set when a new tab is tapped

        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),


          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              title: Text('India'),

          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.language),
            title: new Text('Predictions'),
          ),

        ],

      ),

    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Account");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Settings");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Account":
        return MaterialPageRoute(builder: (context) =>
        new Column(

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
      case "Settings":
        return MaterialPageRoute(builder: (context) => Container(color: Colors.green,child: Center(child: Text("Settings"))));
      default:
        return MaterialPageRoute(builder: (context) =>
            SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Premium.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40.0, 20, 0),

            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal*7,
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height:  SizeConfig.blockSizeVertical * 1,
                ),
                FlatButton.icon(
                  onPressed: () async {
                    //dynamic result = await Navigator.pushNamed(context, '/location');
                    dynamic result=await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChooseLocation()));
                    if(result != null){
                      setState(() {
                        data = {
                          //'time': result['time'],
                          'location': result['location'],
                          //'isDaytime': result['isDaytime'],
                          //'flag': result['flag']
                          'worldtotal':result['worldtotal'],
                          'worldrecover':result['worldrecover'],
                          'worlddeaths':result['worlddeaths'],
                          'todaycases':result['todaycases'],
                          'todaydeaths':result['todaydeaths'],
                          'activecases':result['activecases'],
                          'criticalcases':result['criticalcases'],
                          'totaltests':result['totaltests'],
                          'casesmil':result['casesmil'],
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Choose Country",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox( height:  SizeConfig.blockSizeVertical * 1),


                SizedBox( height:  SizeConfig.blockSizeVertical * 1),
                Wrap(

                  spacing: 2.0, // gap between adjacent chips
                  runSpacing: 1.0, // gap between lines
                  children: <Widget>[
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900,),
                      label: Text("Total Cases:"+data['worldtotal'].toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*5,

                          )),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.green, ),
                      label: Text("Total Recovered:"+data['worldrecover'].toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*5,

                          )),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.red, ),
                      label: Text("Total Deaths:"+data['worlddeaths'].toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*5,

                          )),
                    ),

                  ],
                ),
                SizedBox(height:  SizeConfig.blockSizeVertical * 1),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 80,
                  height:  SizeConfig.blockSizeVertical * 60,
                  child: GridView.count(
                    primary: false,
                    physics: new NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Today Cases",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.5,

                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 4),
                            Text(
                              data['todaycases'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.2,

                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 2),

                          ],
                        ),

                        color: Colors.teal[100],

                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Today Deaths",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.5,

                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 4),
                            Text(
                              data['todaydeaths'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.2,

                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 2),

                          ],
                        ),

                        color: Colors.teal[100],

                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Active Cases",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.5,

                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 4),
                            Text(
                              data['activecases'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.2,

                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 2),

                          ],
                        ),

                        color: Colors.teal[100],

                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Critical Cases",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.5,

                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 4),
                            Text(
                              data['criticalcases'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.2,

                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 2),

                          ],
                        ),

                        color: Colors.teal[100],

                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Total Tests",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.5,

                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 4),
                            Text(
                              data['totaltests'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.2,

                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 2),

                          ],
                        ),

                        color: Colors.teal[100],

                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Cases/Mil",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.5,

                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 4),
                            Text(
                              data['casesmil'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal*4.2,

                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height:  SizeConfig.blockSizeVertical * 2),

                          ],
                        ),

                        color: Colors.teal[100],

                      ),
                    ],
                  ),

                ),




              ],

            ),

          ),
        ),


    ),);
    }
  }
}