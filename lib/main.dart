import 'package:flutter/material.dart';
import 'package:raheem/UI/PrayerTime.dart';
import 'package:raheem/UI/Story.dart';


Color backgroundBlue = Color(int.parse('#5d6d94'.replaceAll('#', '0xff')));

void main() {
  runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raheem App',
      theme: ThemeData(
        primaryColor: backgroundBlue,
             primaryColorDark: Color(304363)
       ),
      home:  Home()
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlue,
        appBar: AppBar(backgroundColor :backgroundBlue,title: Text('Raheem App ')),
    body:  Padding(

      padding: const EdgeInsets.all(10.5),



         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
           children: [
             Story(),
             Divider(
               height: 30
               , indent: double.infinity,
               endIndent: double.infinity,),
             PrayerTime(),

            ],
         )
         ),

    );


  }
}

   
   
