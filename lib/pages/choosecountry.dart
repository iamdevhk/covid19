import 'package:flutter/material.dart';
import 'package:covid19/services/countries.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  TextEditingController searchController = new TextEditingController();
  String filter;
  List<CountryStats> locations = [
    CountryStats(url: 'India', flag: 'icons/flags/png/in.png'),
    CountryStats(url: 'USA', flag: 'icons/flags/png/us.png'),
    CountryStats(url: 'Sweden', flag: 'icons/flags/png/se.png'),
    CountryStats(url: 'Italy', flag: 'icons/flags/png/it.png'),
    CountryStats(url: 'Australia', flag: 'icons/flags/png/au.png'),
    CountryStats(url: 'UK', flag: 'icons/flags/png/gb.png'),
    CountryStats(url: 'Sweden', flag: 'icons/flags/png/se.png'),
    CountryStats(url: 'Canada', flag: 'icons/flags/png/ca.png'),
    CountryStats(url: 'Andorra', flag: 'icons/flags/png/ad.png'),
    CountryStats(url: 'United Arab Emirates', flag: 'icons/flags/png/ae.png'),
    CountryStats(url: 'Afghanistan', flag: 'icons/flags/png/af.png'),
    CountryStats(url: 'Antigua and Barbuda', flag: 'icons/flags/png/ag.png'),
    CountryStats(url: 'Anguilla', flag: 'icons/flags/png/ai.png'),
    CountryStats(url: 'Albania', flag: 'icons/flags/png/al.png'),
    CountryStats(url: 'Armenia', flag: 'icons/flags/png/am.png'),
    CountryStats(url: 'Angola', flag: 'icons/flags/png/ao.png'),
    CountryStats(url: 'Antarctica', flag: 'icons/flags/png/aq.png'),
    CountryStats(url: 'Argentina', flag: 'icons/flags/png/ar.png'),
    CountryStats(url: 'American Samoa', flag: 'icons/flags/png/as.png'),
    CountryStats(url: 'Austria', flag: 'icons/flags/png/at.png'),
    CountryStats(url: 'Australia', flag: 'icons/flags/png/au.png'),
    CountryStats(url: 'Aruba', flag: 'icons/flags/png/aw.png'),
    CountryStats(url: 'Åland Islands', flag: 'icons/flags/png/ax.png'),
    CountryStats(url: 'Azerbaijan', flag: 'icons/flags/png/az.png'),
    CountryStats(url: 'Bosnia and Herzegovina', flag: 'icons/flags/png/ba.png'),
    CountryStats(url: 'Barbados', flag: 'icons/flags/png/bb.png'),
    CountryStats(url: 'Bangladesh', flag: 'icons/flags/png/bd.png'),
    CountryStats(url: 'Belgium', flag: 'icons/flags/png/be.png'),
    CountryStats(url: 'Burkina Faso', flag: 'icons/flags/png/bf.png'),
    CountryStats(url: 'Bulgaria', flag: 'icons/flags/png/bg.png'),
    CountryStats(url: 'Bahrain', flag: 'icons/flags/png/bh.png'),
    CountryStats(url: 'Burundi', flag: 'icons/flags/png/bi.png'),
    CountryStats(url: 'Benin', flag: 'icons/flags/png/bj.png'),
    CountryStats(url: 'Saint Barthélemy', flag: 'icons/flags/png/bl.png'),
    CountryStats(url: 'Bermuda', flag: 'icons/flags/png/bm.png'),
    CountryStats(url: 'Brunei Darussalam', flag: 'icons/flags/png/bn.png'),
    CountryStats(
        url: 'Bolivia, Plurinational State of', flag: 'icons/flags/png/bo.png'),
    CountryStats(url: 'Caribbean Netherlands', flag: 'icons/flags/png/bq.png'),
    CountryStats(url: 'Brazil', flag: 'icons/flags/png/br.png'),
    CountryStats(url: 'Bahamas', flag: 'icons/flags/png/bs.png'),
    CountryStats(url: 'Bhutan', flag: 'icons/flags/png/bt.png'),
    CountryStats(url: 'Bouvet Island', flag: 'icons/flags/png/bv.png'),
    CountryStats(url: 'Botswana', flag: 'icons/flags/png/bw.png'),
    CountryStats(url: 'Belarus', flag: 'icons/flags/png/by.png'),
    CountryStats(url: 'Belize', flag: 'icons/flags/png/bz.png'),
    CountryStats(url: 'Canada', flag: 'icons/flags/png/ca.png'),
    CountryStats(
        url: 'Cocos (Keeling) Islands', flag: 'icons/flags/png/cc.png'),
    CountryStats(url: 'Congo, the Democratic Republic of the',
        flag: 'icons/flags/png/cd.png'),
    CountryStats(
        url: 'Central African Republic', flag: 'icons/flags/png/cf.png'),
    CountryStats(url: 'Congo', flag: 'icons/flags/png/cg.png'),
    CountryStats(url: 'Switzerland', flag: 'icons/flags/png/ch.png'),

    CountryStats(url: 'Cook Islands', flag: 'icons/flags/png/ck.png'),
    CountryStats(url: 'Chile', flag: 'icons/flags/png/cl.png'),
    CountryStats(url: 'Cameroon', flag: 'icons/flags/png/cm.png'),
    CountryStats(url: 'China', flag: 'icons/flags/png/cn.png'),
    CountryStats(url: 'Colombia', flag: 'icons/flags/png/co.png'),
    CountryStats(url: 'Costa Rica', flag: 'icons/flags/png/cr.png'),
    CountryStats(url: 'Cuba', flag: 'icons/flags/png/cu.png'),
    CountryStats(url: 'Cape Verde', flag: 'icons/flags/png/cv.png'),
    CountryStats(url: 'Curaçao', flag: 'icons/flags/png/cw.png'),
    CountryStats(url: 'Christmas Island', flag: 'icons/flags/png/cx.png'),
    CountryStats(url: 'Cyprus', flag: 'icons/flags/png/cy.png'),
    CountryStats(url: 'Czech Republic', flag: 'icons/flags/png/cz.png'),
    CountryStats(url: 'Germany', flag: 'icons/flags/png/de.png'),
    CountryStats(url: 'Djibouti', flag: 'icons/flags/png/dj.png'),
    CountryStats(url: 'Denmark', flag: 'icons/flags/png/dk.png'),
    CountryStats(url: 'Dominica', flag: 'icons/flags/png/dm.png'),
    CountryStats(url: 'Dominican Republic', flag: 'icons/flags/png/do.png'),
    CountryStats(url: 'Algeria', flag: 'icons/flags/png/dz.png'),
    CountryStats(url: 'Ecuador', flag: 'icons/flags/png/ec.png'),
    CountryStats(url: 'Estonia', flag: 'icons/flags/png/ee.png'),
    CountryStats(url: 'Egypt', flag: 'icons/flags/png/eg.png'),
    CountryStats(url: 'Western Sahara', flag: 'icons/flags/png/eh.png'),
    CountryStats(url: 'Eritrea', flag: 'icons/flags/png/er.png'),
    CountryStats(url: 'Spain', flag: 'icons/flags/png/es.png'),
    CountryStats(url: 'Ethiopia', flag: 'icons/flags/png/et.png'),
    CountryStats(url: 'Europe', flag: 'icons/flags/png/eu.png'),
    CountryStats(url: 'Finland', flag: 'icons/flags/png/fi.png'),
    CountryStats(url: 'Fiji', flag: 'icons/flags/png/fj.png'),
    CountryStats(
        url: 'Falkland Islands (Malvinas)', flag: 'icons/flags/png/fk.png'),
    CountryStats(
        url: 'Micronesia, Federated States of', flag: 'icons/flags/png/fm.png'),
    CountryStats(url: 'Faroe Islands', flag: 'icons/flags/png/fo.png'),
    CountryStats(url: 'France', flag: 'icons/flags/png/fr.png'),
    CountryStats(url: 'Gabon', flag: 'icons/flags/png/ga.png'),
    CountryStats(url: 'England', flag: 'icons/flags/png/gb-eng.png'),
    CountryStats(url: 'Northern Ireland', flag: 'icons/flags/png/gb-nir.png'),
    CountryStats(url: 'Scotland', flag: 'icons/flags/png/gb-sct.png'),
    CountryStats(url: 'Wales', flag: 'icons/flags/png/gb-wls.png'),
    CountryStats(url: 'United Kingdom', flag: 'icons/flags/png/gb.png'),
    CountryStats(url: 'Grenada', flag: 'icons/flags/png/gd.png'),
    CountryStats(url: 'Georgia', flag: 'icons/flags/png/ge.png'),
    CountryStats(url: 'French Guiana', flag: 'icons/flags/png/gf.png'),
    CountryStats(url: 'Guernsey', flag: 'icons/flags/png/gg.png'),
    CountryStats(url: 'Ghana', flag: 'icons/flags/png/gh.png'),
    CountryStats(url: 'Gibraltar', flag: 'icons/flags/png/gi.png'),
    CountryStats(url: 'Greenland', flag: 'icons/flags/png/gl.png'),
    CountryStats(url: 'Gambia', flag: 'icons/flags/png/gm.png'),
    CountryStats(url: 'Guinea', flag: 'icons/flags/png/gn.png'),
    CountryStats(url: 'Guadeloupe', flag: 'icons/flags/png/gp.png'),
    CountryStats(url: 'Equatorial Guinea', flag: 'icons/flags/png/gq.png'),
    CountryStats(url: 'Greece', flag: 'icons/flags/png/gr.png'),
    CountryStats(url: 'South Georgia and the South Sandwich Islands',
        flag: 'icons/flags/png/gs.png'),
    CountryStats(url: 'Guatemala', flag: 'icons/flags/png/gt.png'),
    CountryStats(url: 'Guam', flag: 'icons/flags/png/gu.png'),
    CountryStats(url: 'Guinea-Bissau', flag: 'icons/flags/png/gw.png'),
    CountryStats(url: 'Guyana', flag: 'icons/flags/png/gy.png'),
    CountryStats(url: 'Hong Kong', flag: 'icons/flags/png/hk.png'),
    CountryStats(url: 'Heard Island and McDonald Islands',
        flag: 'icons/flags/png/hm.png'),
    CountryStats(url: 'Honduras', flag: 'icons/flags/png/hn.png'),
    CountryStats(url: 'Croatia', flag: 'icons/flags/png/hr.png'),
    CountryStats(url: 'Haiti', flag: 'icons/flags/png/ht.png'),
    CountryStats(url: 'Hungary', flag: 'icons/flags/png/hu.png'),
    CountryStats(url: 'Indonesia', flag: 'icons/flags/png/id.png'),
    CountryStats(url: 'Ireland', flag: 'icons/flags/png/ie.png'),
    CountryStats(url: 'Israel', flag: 'icons/flags/png/il.png'),
    CountryStats(url: 'Isle of Man', flag: 'icons/flags/png/im.png'),
    CountryStats(url: 'India', flag: 'icons/flags/png/in.png'),
    CountryStats(
        url: 'British Indian Ocean Territory', flag: 'icons/flags/png/io.png'),
    CountryStats(url: 'Iraq', flag: 'icons/flags/png/iq.png'),
    CountryStats(
        url: 'Iran, Islamic Republic of', flag: 'icons/flags/png/ir.png'),
    CountryStats(url: 'Iceland', flag: 'icons/flags/png/is.png'),
    CountryStats(url: 'Italy', flag: 'icons/flags/png/it.png'),
    CountryStats(url: 'Jersey', flag: 'icons/flags/png/je.png'),
    CountryStats(url: 'Jamaica', flag: 'icons/flags/png/jm.png'),
    CountryStats(url: 'Jordan', flag: 'icons/flags/png/jo.png'),
    CountryStats(url: 'Japan', flag: 'icons/flags/png/jp.png'),
    CountryStats(url: 'Kenya', flag: 'icons/flags/png/ke.png'),
    CountryStats(url: 'Kyrgyzstan', flag: 'icons/flags/png/kg.png'),
    CountryStats(url: 'Cambodia', flag: 'icons/flags/png/kh.png'),
    CountryStats(url: 'Kiribati', flag: 'icons/flags/png/ki.png'),
    CountryStats(url: 'Comoros', flag: 'icons/flags/png/km.png'),
    CountryStats(url: 'Saint Kitts and Nevis', flag: 'icons/flags/png/kn.png'),

    CountryStats(url: 'Korea, Republic of', flag: 'icons/flags/png/kr.png'),
    CountryStats(url: 'Kuwait', flag: 'icons/flags/png/kw.png'),
    CountryStats(url: 'Cayman Islands', flag: 'icons/flags/png/ky.png'),
    CountryStats(url: 'Kazakhstan', flag: 'icons/flags/png/kz.png'),

    CountryStats(url: 'Lebanon', flag: 'icons/flags/png/lb.png'),
    CountryStats(url: 'Saint Lucia', flag: 'icons/flags/png/lc.png'),
    CountryStats(url: 'Liechtenstein', flag: 'icons/flags/png/li.png'),
    CountryStats(url: 'Sri Lanka', flag: 'icons/flags/png/lk.png'),
    CountryStats(url: 'Liberia', flag: 'icons/flags/png/lr.png'),
    CountryStats(url: 'Lesotho', flag: 'icons/flags/png/ls.png'),
    CountryStats(url: 'Lithuania', flag: 'icons/flags/png/lt.png'),
    CountryStats(url: 'Luxembourg', flag: 'icons/flags/png/lu.png'),
    CountryStats(url: 'Latvia', flag: 'icons/flags/png/lv.png'),
    CountryStats(url: 'Libya', flag: 'icons/flags/png/ly.png'),
    CountryStats(url: 'Morocco', flag: 'icons/flags/png/ma.png'),
    CountryStats(url: 'Monaco', flag: 'icons/flags/png/mc.png'),
    CountryStats(url: 'Moldova, Republic of', flag: 'icons/flags/png/md.png'),
    CountryStats(url: 'Montenegro', flag: 'icons/flags/png/me.png'),
    CountryStats(url: 'Saint Martin', flag: 'icons/flags/png/mf.png'),
    CountryStats(url: 'Madagascar', flag: 'icons/flags/png/mg.png'),
    CountryStats(url: 'Marshall Islands', flag: 'icons/flags/png/mh.png'),
    CountryStats(url: 'Macedonia, the former Yugoslav Republic of',
        flag: 'icons/flags/png/mk.png'),
    CountryStats(url: 'Mali', flag: 'icons/flags/png/ml.png'),
    CountryStats(url: 'Myanmar', flag: 'icons/flags/png/mm.png'),
    CountryStats(url: 'Mongolia', flag: 'icons/flags/png/mn.png'),
    CountryStats(url: 'Macao', flag: 'icons/flags/png/mo.png'),
    CountryStats(
        url: 'Northern Mariana Islands', flag: 'icons/flags/png/mp.png'),
    CountryStats(url: 'Martinique', flag: 'icons/flags/png/mq.png'),
    CountryStats(url: 'Mauritania', flag: 'icons/flags/png/mr.png'),
    CountryStats(url: 'Montserrat', flag: 'icons/flags/png/ms.png'),
    CountryStats(url: 'Malta', flag: 'icons/flags/png/mt.png'),
    CountryStats(url: 'Mauritius', flag: 'icons/flags/png/mu.png'),
    CountryStats(url: 'Maldives', flag: 'icons/flags/png/mv.png'),
    CountryStats(url: 'Malawi', flag: 'icons/flags/png/mw.png'),
    CountryStats(url: 'Mexico', flag: 'icons/flags/png/mx.png'),
    CountryStats(url: 'Malaysia', flag: 'icons/flags/png/my.png'),
    CountryStats(url: 'Mozambique', flag: 'icons/flags/png/mz.png'),
    CountryStats(url: 'Namibia', flag: 'icons/flags/png/na.png'),
    CountryStats(url: 'New Caledonia', flag: 'icons/flags/png/nc.png'),
    CountryStats(url: 'Niger', flag: 'icons/flags/png/ne.png'),
    CountryStats(url: 'Norfolk Island', flag: 'icons/flags/png/nf.png'),
    CountryStats(url: 'Nigeria', flag: 'icons/flags/png/ng.png'),
    CountryStats(url: 'Nicaragua', flag: 'icons/flags/png/ni.png'),
    CountryStats(url: 'Netherlands', flag: 'icons/flags/png/nl.png'),
    CountryStats(url: 'Norway', flag: 'icons/flags/png/no.png'),
    CountryStats(url: 'Nepal', flag: 'icons/flags/png/np.png'),
    CountryStats(url: 'Nauru', flag: 'icons/flags/png/nr.png'),
    CountryStats(url: 'Niue', flag: 'icons/flags/png/nu.png'),
    CountryStats(url: 'New Zealand', flag: 'icons/flags/png/nz.png'),
    CountryStats(url: 'Oman', flag: 'icons/flags/png/om.png'),
    CountryStats(url: 'Panama', flag: 'icons/flags/png/pa.png'),
    CountryStats(url: 'Peru', flag: 'icons/flags/png/pe.png'),
    CountryStats(url: 'French Polynesia', flag: 'icons/flags/png/pf.png'),
    CountryStats(url: 'Papua New Guinea', flag: 'icons/flags/png/pg.png'),
    CountryStats(url: 'Philippines', flag: 'icons/flags/png/ph.png'),
    CountryStats(url: 'Pakistan', flag: 'icons/flags/png/pk.png'),
    CountryStats(url: 'Poland', flag: 'icons/flags/png/pl.png'),
    CountryStats(
        url: 'Saint Pierre and Miquelon', flag: 'icons/flags/png/pm.png'),
    CountryStats(url: 'Pitcairn', flag: 'icons/flags/png/pn.png'),
    CountryStats(url: 'Puerto Rico', flag: 'icons/flags/png/pr.png'),
    CountryStats(url: 'Palestine', flag: 'icons/flags/png/ps.png'),
    CountryStats(url: 'Portugal', flag: 'icons/flags/png/pt.png'),
    CountryStats(url: 'Palau', flag: 'icons/flags/png/pw.png'),
    CountryStats(url: 'Paraguay', flag: 'icons/flags/png/py.png'),
    CountryStats(url: 'Qatar', flag: 'icons/flags/png/qa.png'),
    CountryStats(url: 'Réunion', flag: 'icons/flags/png/re.png'),
    CountryStats(url: 'Romania', flag: 'icons/flags/png/ro.png'),
    CountryStats(url: 'Serbia', flag: 'icons/flags/png/rs.png'),
    CountryStats(url: 'Russian Federation', flag: 'icons/flags/png/ru.png'),
    CountryStats(url: 'Rwanda', flag: 'icons/flags/png/rw.png'),
    CountryStats(url: 'Saudi Arabia', flag: 'icons/flags/png/sa.png'),
    CountryStats(url: 'Solomon Islands', flag: 'icons/flags/png/sb.png'),
    CountryStats(url: 'Seychelles', flag: 'icons/flags/png/sc.png'),
    CountryStats(url: 'Sudan', flag: 'icons/flags/png/sd.png'),
    CountryStats(url: 'Sweden', flag: 'icons/flags/png/se.png'),
    CountryStats(url: 'Singapore', flag: 'icons/flags/png/sg.png'),
    CountryStats(url: 'Saint Helena, Ascension and Tristan da Cunha',
        flag: 'icons/flags/png/sh.png'),
    CountryStats(url: 'Slovenia', flag: 'icons/flags/png/si.png'),
    CountryStats(
        url: 'Svalbard and Jan Mayen Islands', flag: 'icons/flags/png/sj.png'),
    CountryStats(url: 'Slovakia', flag: 'icons/flags/png/sk.png'),
    CountryStats(url: 'Sierra Leone', flag: 'icons/flags/png/sl.png'),
    CountryStats(url: 'San Marino', flag: 'icons/flags/png/sm.png'),
    CountryStats(url: 'Senegal', flag: 'icons/flags/png/sn.png'),
    CountryStats(url: 'Somalia', flag: 'icons/flags/png/so.png'),
    CountryStats(url: 'Suriname', flag: 'icons/flags/png/sr.png'),
    CountryStats(url: 'South Sudan', flag: 'icons/flags/png/ss.png'),
    CountryStats(url: 'Sao Tome and Principe', flag: 'icons/flags/png/st.png'),
    CountryStats(url: 'El Salvador', flag: 'icons/flags/png/sv.png'),
    CountryStats(
        url: 'Sint Maarten (Dutch part)', flag: 'icons/flags/png/sx.png'),
    CountryStats(url: 'Syrian Arab Republic', flag: 'icons/flags/png/sy.png'),
    CountryStats(url: 'Swaziland', flag: 'icons/flags/png/sz.png'),
    CountryStats(
        url: 'Turks and Caicos Islands', flag: 'icons/flags/png/tc.png'),
    CountryStats(url: 'Chad', flag: 'icons/flags/png/td.png'),
    CountryStats(
        url: 'French Southern Territories', flag: 'icons/flags/png/tf.png'),
    CountryStats(url: 'Togo', flag: 'icons/flags/png/tg.png'),
    CountryStats(url: 'Thailand', flag: 'icons/flags/png/th.png'),
    CountryStats(url: 'Tajikistan', flag: 'icons/flags/png/tj.png'),
    CountryStats(url: 'Tokelau', flag: 'icons/flags/png/tk.png'),
    CountryStats(url: 'Timor-Leste', flag: 'icons/flags/png/tl.png'),
    CountryStats(url: 'Turkmenistan', flag: 'icons/flags/png/tm.png'),
    CountryStats(url: 'Tunisia', flag: 'icons/flags/png/tn.png'),
    CountryStats(url: 'Tonga', flag: 'icons/flags/png/to.png'),
    CountryStats(url: 'Turkey', flag: 'icons/flags/png/tr.png'),
    CountryStats(url: 'Trinidad and Tobago', flag: 'icons/flags/png/tt.png'),
    CountryStats(url: 'Tuvalu', flag: 'icons/flags/png/tv.png'),
    CountryStats(url: 'Taiwan', flag: 'icons/flags/png/tw.png'),
    CountryStats(
        url: 'Tanzania, United Republic of', flag: 'icons/flags/png/tz.png'),
    CountryStats(url: 'Ukraine', flag: 'icons/flags/png/ua.png'),
    CountryStats(url: 'Uganda', flag: 'icons/flags/png/ug.png'),
    CountryStats(
        url: 'US Minor Outlying Islands', flag: 'icons/flags/png/um.png'),
    CountryStats(url: 'United States', flag: 'icons/flags/png/us.png'),
    CountryStats(url: 'Uruguay', flag: 'icons/flags/png/uy.png'),
    CountryStats(url: 'Uzbekistan', flag: 'icons/flags/png/uz.png'),
    CountryStats(
        url: 'Holy See (Vatican City State)', flag: 'icons/flags/png/va.png'),
    CountryStats(url: 'Saint Vincent and the Grenadines',
        flag: 'icons/flags/png/vc.png'),
    CountryStats(url: 'Venezuela, Bolivarian Republic of',
        flag: 'icons/flags/png/ve.png'),
    CountryStats(
        url: 'Virgin Islands, British', flag: 'icons/flags/png/vg.png'),
    CountryStats(url: 'Virgin Islands, U.S.', flag: 'icons/flags/png/vi.png'),
    CountryStats(url: 'Viet Nam', flag: 'icons/flags/png/vn.png'),
    CountryStats(url: 'Vanuatu', flag: 'icons/flags/png/vu.png'),
    CountryStats(
        url: 'Wallis and Futuna Islands', flag: 'icons/flags/png/wf.png'),
    CountryStats(url: 'Kosovo', flag: 'icons/flags/png/xk.png'),
    CountryStats(url: 'Samoa', flag: 'icons/flags/png/ws.png'),
    CountryStats(url: 'Yemen', flag: 'icons/flags/png/ye.png'),
    CountryStats(url: 'Mayotte', flag: 'icons/flags/png/yt.png'),
    CountryStats(url: 'South Africa', flag: 'icons/flags/png/za.png'),
    CountryStats(url: 'Zambia', flag: 'icons/flags/png/zm.png'),
    CountryStats(url: 'Zimbabwe', flag: 'icons/flags/png/zw.png'),


  ];

  void updateTime(index) async {
    CountryStats instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'worldtotal': instance.worldtotal,
      'worldrecover': instance.worldrecover,
      'worlddeaths': instance.worlddeaths,
      'todaycases': instance.todaycases,
      'todaydeaths': instance.todaydeaths,
      'activecases': instance.activecases,
      'criticalcases': instance.criticalcases,
      'totaltests': instance.totaltests,
      'casesmil': instance.casesmil,

    });
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
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.teal[200],
          title: Text('Choose a Country'),
          centerTitle: true,
          elevation: 0,
        ),
        body: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search a Country',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
              ),
            ),
            new Expanded(
              child: new ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return  filter == null || filter == "" ?ListTile(

                        title: Card(
                          child: ListTile(
                                   onTap: () {
                    updateTime(index);
    },
    title: Text(locations[index].url),
    leading: CircleAvatar(
    backgroundImage: AssetImage('${locations[index].flag}', package: 'country_icons'),
    ),
    ),
    ),

                    )
:'${locations[index].url}'.toLowerCase().contains(filter.toLowerCase())
                        ? ListTile(
                      title: Text(
                        '${locations[index].url}',
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('${locations[index].flag}', package: 'country_icons'),
                      ),
                        onTap: () {
                          updateTime(index);
                        },)
                        : new Container();



                  }
              ),
            ),
          ],
        ));
  }
}