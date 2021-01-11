 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:raheem/Pojo/PrayerTimeModel.dart';
import 'package:raheem/Pojo/StoryModel.dart';
import 'package:raheem/Repository/PrayerTimeRepo.dart';

import '../../main.dart';


//Whole PrayerTime Component
class PrayerTimeWidget extends StatefulWidget {
  double  scaleFactor ;

  BoxConstraints constraints ;

  PrayerTimeWidget ({@required this.constraints});

  @override
  _PrayerTimeWidgetState createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {



 @override
  void didChangeDependencies() {
   widget.scaleFactor = MediaQuery.of(context).textScaleFactor;

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PrayerTimeRepo(),
    child: Consumer<PrayerTimeRepo>(
      builder: (context, prayerRepo, child) {
        return (prayerRepo.prayerTimeList==null) ?
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
             valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
             minHeight: 1.8,

          ),
        ) :
        Container(
        height: widget.constraints.maxHeight*0.72,
        width: double.infinity,
        child: Card(  elevation: 15,

        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,


        children: [
        Text(
          "Prayer Times",

        style: TextStyle(fontSize: 28.7 * widget.scaleFactor,
        // color: Colors.black87,
        fontWeight: FontWeight.bold),
        ),

        Container(
          margin: EdgeInsets.only(bottom: 10.5),
          child: Text(
          DateFormat.yMMMMd().format(new DateTime.now()),

    style:
      GoogleFonts.lato(
       // textStyle: Theme.of(context).textTheme.display1,
          fontSize: 16 * widget.scaleFactor,
          //fontWeight: FontWeight.w700,
          //fontStyle: FontStyle.italic,
       // color: Colors.black87,
      ),

    ),
        ),

    Divider(
    height: widget.constraints.maxHeight*0.0001,

    indent:   double.infinity,

    endIndent: double.infinity,
    ),
          Text(
            prayerRepo.street, //will be developed later
            style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.w400 , fontSize:45* widget.scaleFactor  ),
          ),
    Divider(
    height: widget.constraints.maxHeight*0.005,

    indent:   double.infinity,

    endIndent: double.infinity,
    ),
    PrayerTimeList (constraints: widget.constraints,prayerTimeList: prayerRepo.prayerTimeList,),





    ],
    ),
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),    )

    ),
    );
      },
    ) );
  }
}

//Next Prayer
class NextPrayer extends StatefulWidget {
  @override
  _NextPrayerState createState() => _NextPrayerState();
}

class _NextPrayerState extends State<NextPrayer> {
  @override
  Widget build(BuildContext context) {
    return Text(
      ' ', //will be developed later
       style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.w400 , fontSize:45  ),
    );



  }
}


//PrayerTimeList 
class PrayerTimeList extends StatefulWidget {
  BoxConstraints constraints ;
  List<PrayerTimeModel> prayerTimeList;
  PrayerTimeList ({@required this.constraints , @required this.prayerTimeList });

  @override
  _PrayerTimeListState createState() => _PrayerTimeListState();
}

class _PrayerTimeListState extends State<PrayerTimeList> {

  TextStyle prayerTextStyle ;
  @override
  void didChangeDependencies() {
    prayerTextStyle =TextStyle(fontSize: 17 *  MediaQuery.of(context).textScaleFactor, fontWeight: FontWeight.normal) ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height: widget.constraints.maxHeight*0.40,
      width: double.infinity,

      child:  ListView.separated(

            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              height: widget.constraints.maxHeight*0.024,
            ),
            itemCount: widget.prayerTimeList.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Text(
                  widget.prayerTimeList[index].prayerName,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: prayerTextStyle,
                ),
                Text(
                  widget.prayerTimeList[index].prayerTime,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: prayerTextStyle,
                )
              ],
            ),
          ));

  }


}





