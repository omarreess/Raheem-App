




import 'package:flutter/material.dart';
import 'package:raheem/Pojo/PrayerTimeModel.dart';
import 'package:raheem/UI/home/HomePresenter.dart';

class PrayerTimeRepo extends ChangeNotifier  {
  String street ;
  List<PrayerTimeModel> prayerTimeList;



  PrayerTimeRepo ()  {
    HomePresenter().getLocation().then((locationGeo) {

        //getting PrayerTimes
        prayerTimeList = HomePresenter().getPrayerTimeList(locationGeo.latitude, locationGeo.longitude);
        //getting StreetName
        HomePresenter().getLocationDetails(locationGeo.latitude , locationGeo.longitude).then((locationStreet)
        {
          street=locationStreet ;

          notifyListeners();

        } );



    } );


  }




}