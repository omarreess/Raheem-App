
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raheem/UI/home/PrayerTimeWidget.dart';
import 'package:raheem/UI/home/StoryWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(backgroundColor :Theme.of(context).primaryColor,elevation:0.0,title: Text('Raheem App ', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)	,)),
        body: SafeArea(

            child : Padding(
              padding: const EdgeInsets.all(7.5),
              child: LayoutBuilder(
                builder: (context,   constraints) {

                   return SingleChildScrollView(
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      children: [
                        StoryWidget(constraints: constraints),
                        Divider(
                          height: constraints.maxHeight*0.05
                          , indent: double.infinity,
                          endIndent: double.infinity,),
                        PrayerTimeWidget(constraints: constraints),

                      ],
                  ),
                   );

                },
              ),
            )
        ) ,

    drawer: Drawer(child:   (false)?
           Center(child: CircularProgressIndicator()):
      ListView(
      children: <Widget>[
        DrawerHeader(child: SvgPicture.asset('assets/quran.svg'  ,fit: BoxFit.fitWidth) ) ,



      ],
    ),
    ),

    );
  }
}


