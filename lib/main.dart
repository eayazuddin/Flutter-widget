import 'package:flutter/material.dart';
import 'package:hello/Fragment/AlarmFragement.dart';
import 'package:hello/Fragment/BalanceFragement.dart';
import 'package:hello/Fragment/ContactFragement.dart';
import 'package:hello/Fragment/HomeFragement.dart';
import 'package:hello/Fragment/PersonFragement.dart';
import 'package:hello/Fragment/SearchFragement.dart';
import 'package:hello/Fragment/SettingsFragement.dart';
import 'package:hello/Fragment/emailFragement.dart';
import 'package:hello/palette.dart';

void main(){
  runApp(const myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(primarySwatch: Palette.kToDark),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),);
  }
}

class HomeActivity extends StatelessWidget {
   HomeActivity({super.key});

  mysnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  myAleartDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
           return Expanded(child: AlertDialog(
             title: Text("Aleart!"),
             content: Text("Do you want to delete"),
             actions: [
               TextButton(onPressed: (){mysnackbar("Delete", context);Navigator.of(context).pop();}, child: Text("Yes")),
               TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No"))
             ],

           ));
        });
  }

   ButtonStyle buttonStyle = ElevatedButton.styleFrom(
     minimumSize: Size(double.infinity, 50),
     backgroundColor: Colors.greenAccent,
     foregroundColor: Colors.white,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.all(Radius.circular(10))
     )
   );
  var myItems = [
    {"Img":"https://shorturl.at/PDK5t","Title":"Eayaz"},
    {"Img":"https://shorturl.at/PDK5t","Title":"Roky"},
    {"Img":"https://shorturl.at/PDK5t","Title":"Hasan"},
    {"Img":"https://shorturl.at/PDK5t","Title":"Emon"},
    {"Img":"https://shorturl.at/PDK5t","Title":"Salam"},
    {"Img":"https://shorturl.at/PDK5t","Title":"Karim"},
    {"Img":"https://shorturl.at/PDK5t","Title":"Helal"},
    {"Img":"https://shorturl.at/PDK5t","Title":"Pinkay"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8, child: Scaffold(
      appBar: AppBar(title: Text("App bar"),
        backgroundColor: Colors.greenAccent,
        bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            tabs: [
             Tab(icon: Icon(Icons.home),text: "Home",),
             Tab(icon: Icon(Icons.search),text: "search",),
             Tab(icon: Icon(Icons.settings),text: "settings",),
             Tab(icon: Icon(Icons.email),text: "email",),
             Tab(icon: Icon(Icons.contact_mail),text: "contact_mail",),
             Tab(icon: Icon(Icons.person),text: "person",),
             Tab(icon: Icon(Icons.access_alarm),text: "access_alarm",),
             Tab(icon: Icon(Icons.account_balance),text: "account_balance",),
        ]),
      ),

      body: TabBarView(children: [
        Homefragement(),
        Searchfragement(),
        Settingsfragement(),
        Emailfragement(),
        Contactfragement(),
        Personfragement(),
        Alarmfragement(),
        Balancefragement()

      ]),

    ));
  }
}

