



import 'package:flutter/material.dart';

import 'PrayerTimeModel.dart';

class NextPrayerModel implements PrayerTimeModel {

  String timeLeftForPrayer ;

  NextPrayerModel({
    @required this.prayerTime , @required this.prayerName ,
    @required this.timeLeftForPrayer ,
   }) ;

  @override
  String prayerName;

  @override
  String prayerTime;


 }