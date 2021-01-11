
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


    


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // to switch after delayed time
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, 'home');
     });
    return Container(color:Color(int.parse('#DCE7FD'.replaceAll('#', '0xff'))),
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: SafeArea(
          child: Column(
            children: [

              Container(  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),),child: SvgPicture.asset('assets/quran.svg',height: 250,width: double.infinity,)),
              Divider(indent: double.infinity, height: 110,endIndent: double.infinity,) ,
              Text('رحيم',style: GoogleFonts.cairo(color:Colors.white ,decoration: TextDecoration.none ,fontWeight: FontWeight.bold ),),
              Container( padding: EdgeInsets.all(15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColorLight),
                  minHeight: 2.5,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

