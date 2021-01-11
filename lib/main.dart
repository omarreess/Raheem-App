import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raheem/Network%20Layer/StoriesRemote.dart';
import 'package:raheem/UI/home/HomePresenter.dart';
import 'package:raheem/UI/home/HomeScreen.dart';
import 'package:raheem/UI/intro/IntroScreen.dart';
import 'file:///E:/Dart/Projects/raheem/lib/UI/home/PrayerTimeWidget.dart';
import 'file:///E:/Dart/Projects/raheem/lib/UI/home/StoryWidget.dart';
import 'package:raheem/UI/splash/SplashScreen.dart';
import 'package:raheem/UI/story/StoryScreen.dart';
import 'package:location/location.dart';
 import 'package:geocoder/geocoder.dart';




void main() {

  //For Locking Landscape-Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(App());
  });



 }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Raheem App',
          initialRoute: 'splash',
      routes: appRoutes,
      theme: ThemeData(

        primaryColor: Color(int.parse('#5d6d94'.replaceAll('#', '0xff'))),
             primaryColorLight:Color(int.parse('#8c9bc5'.replaceAll('#', '0xff')) ),
             primaryColorDark: Color(304363),
            textTheme: GoogleFonts.cairoTextTheme()

       ),
       // home:  AppScaffold()
    );
  }
}

final appRoutes =   {
'into': (context) => IntroScreen(),

'splash': (context) => SplashScreen(),
'home': (context) => HomeScreen(),
'story': (context) => StoryScreen(),


};


