import 'package:http/http.dart';
import 'dart:convert';
class CountryStats {
  String worldtotal;
  String  worldrecover;
  String  worlddeaths;
  String todaycases;
  String todaydeaths;
  String activecases;
  String criticalcases;
  String totaltests;
  String casesmil;
  String url;
  String flag;
  String location;

  CountryStats({ this.url,
                 this.flag});

  Future<void> getTime() async {
    print('hk');
    try{

      Response response = await get('https://letshunt.herokuapp.com/get_country?name=$url');
      Map data = jsonDecode(response.body);
      //final jsonItems =jsonDecode(response.body);
      //final jsonItems = json.decode(response.body);
     // print(jsonItems);
      worldtotal=data['TotalCases'];
      print(worldtotal);
      worldrecover=data['TotalRecovered'];
      worlddeaths=data['TotalDeaths'];
       todaycases=data['NewCases'];
       todaydeaths=data['NewDeaths'];
       activecases=data['ActiveCases'];
       criticalcases=data['SeriousCritical'];
       //totaltests=data['TotalTests'].toString();
      totaltests='0';
       casesmil=data['TotCasesper1Mpop'].toString();
       if (totaltests=='0'){
         totaltests="TBC";}
       if (casesmil=='0')
         {
           casesmil="TBC";}
      location=url;
      print(worldtotal);

    }
    catch (e) {
      print("not affected by corona");
      worldrecover = '0';
      worldtotal= '0';
      worlddeaths= '0';

    }

  }

}