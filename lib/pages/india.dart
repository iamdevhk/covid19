import 'package:covid19/pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid19/pages/home.dart';
import 'package:covid19/pages/SizeConfig.dart';
import 'package:covid19/services/countries.dart';
class India extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();

}


class _HomeState extends State<India> {
  int _selectedIndex = 0;
  Map data = {};
  int worldtotal;
  int  worldrecover;
  int  worlddeaths;
  int todaycases;
  int todaydeaths;
  int activecases;
  int criticalcases;
  String totaltests;
  String casesmil;
  String loc;
  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  void setupWorldTime() async {

    CountryStats instance=CountryStats(url:'India');
    await instance.getTime();


      loc='india';
    //worldtotal= instance.worldtotal;
    //worldrecover=instance.worldrecover;
   // worlddeaths= instance.worlddeaths;
    //todaycases=instance.todaycases;
    //todaydeaths=instance.todaydeaths;
    //activecases=instance.activecases;
   // criticalcases=instance.criticalcases;
    //totaltests=instance.totaltests;
    //casesmil=instance.casesmil;
    worldtotal= 1;
    worldrecover=1;
    worlddeaths= 11;
    todaycases=1;
    todaydeaths=1;
    activecases=1;
    criticalcases=1;
    totaltests='1';
    casesmil='1';

  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==1)
      {
        Navigator.pushNamed(context, '/india');
      }
    });
  }
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
      body:  SingleChildScrollView(

        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
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
                      loc,
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
                    Navigator.pushNamed(context, '/ind');

                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Choose state",
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
                      label: Text("Total Cases:"+worldtotal.toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*5,

                          )),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.green, ),
                      label: Text("Total Recovered:"+worldrecover.toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*5,

                          )),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.red, ),
                      label: Text("Total Deaths:"+worlddeaths.toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal*5,

                          )),
                    ),

                  ],
                ),
                SizedBox(height:  SizeConfig.blockSizeVertical * 2),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 80,
                  height:  SizeConfig.blockSizeVertical * 45,
                  child: GridView.count(
                    primary: false,
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
                              todaycases.toString(),
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
                              todaydeaths.toString(),
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
                              activecases.toString(),
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
                              totaltests.toString(),
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
                              casesmil.toString(),
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

      ),

      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.teal[100],
        selectedItemColor: Colors.deepPurple[900],
        unselectedItemColor: Colors.black,
        // this will be set when a new tab is tapped

        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
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
}