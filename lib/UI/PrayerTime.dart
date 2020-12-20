 import 'package:flutter/material.dart';
 import 'package:intl/intl.dart';
import 'package:raheem/Model/PrayerTimeModel.dart';
import 'package:raheem/Model/StoryModel.dart';

import '../main.dart';


//Whole PrayerTime Component
class PrayerTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
             width: double.infinity,
             child: Card(  elevation: 15,

      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,


          children: [
            Text(
              'Prayer Times',

               style: TextStyle(fontSize: 28.7,
                   color: Colors.black87,
                    fontWeight: FontWeight.bold),
            ),

            Text(
              DateFormat.yMMMMd().format(new DateTime.now()),

              style: TextStyle(fontSize: 16,

                  color: Colors.black87,
                  ),
            ),
            Divider(
              height: 9,

              indent:   double.infinity,

              endIndent: double.infinity,
            ),
             NextPrayer(),
            Divider(
              height: 24,

              indent:   double.infinity,

              endIndent: double.infinity,
            ),
            PrayerTimeList (),





          ],
        ),
      ),
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(12.0),    )

    ),
    );
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
      'Cairo',
       style: TextStyle(color:backgroundBlue,fontWeight: FontWeight.w400 , fontSize:45 ),
    );



  }
}


//PrayerTimeList 
class PrayerTimeList extends StatefulWidget {
  @override
  _PrayerTimeListState createState() => _PrayerTimeListState();
}

class _PrayerTimeListState extends State<PrayerTimeList> {
  //Testing data
  List<PrayerTimeModel> getDataList () {
    return List<PrayerTimeModel>()..add(PrayerTimeModel(prayerName: 'Fajr',prayerTime:'5:14 AM' ))
        ..add(PrayerTimeModel(prayerName: 'Sunrise',prayerTime:'6:46 AM' ))
        ..add(PrayerTimeModel(prayerName: 'Duhur',prayerTime:'11:53 AM' ))
        ..add(PrayerTimeModel(prayerName: 'Asr',prayerTime:'2:41 PM' ))
        ..add(PrayerTimeModel(prayerName: 'Maghrib',prayerTime:'4:59 PM' ))
        ..add(PrayerTimeModel(prayerName: 'Isha',prayerTime:'6:22 PM' ));

  }
  TextStyle prayerTextStyle =TextStyle(fontSize: 16.5 , fontWeight: FontWeight.normal) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,

      child: ListView.separated(

        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          height: 30,
        ),
        itemCount: getDataList().length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Text(
              getDataList()[index].prayerName,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: prayerTextStyle,
            ),
            Text(
              getDataList()[index].prayerTime,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: prayerTextStyle,
            )
          ],
        ),
      ),
    )
    ;
  }
}





