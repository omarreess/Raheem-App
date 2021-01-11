



 import 'package:adhan/adhan.dart' as adhan ;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' ;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:raheem/Network%20Layer/StoriesRemote.dart';
import 'package:raheem/Pojo/PrayerTimeModel.dart';
import 'package:raheem/Pojo/StoryModel.dart';

class HomePresenter {

   List<StoryModel> storiesList = List ();
   HomePresenter ( ) ;


  void toStoryScreen (BuildContext context , List<StoryModel> list , int index) {
    Map<String , dynamic > args = {
      'index':index ,
      'list':list ,
    };

    Navigator.pushNamed(context, 'story' ,arguments:args  );
  }



   Future<LocationData> getLocation  ()  async {


     Location location = new Location();

     bool _serviceEnabled;
     PermissionStatus _permissionGranted;
     LocationData _locationData;


     _serviceEnabled = await location.serviceEnabled();
     if (!_serviceEnabled) {
       _serviceEnabled = await location.requestService();

     }

     _permissionGranted = await location.hasPermission();
     if (_permissionGranted == PermissionStatus.denied) {
       _permissionGranted = await location.requestPermission();
       if (_permissionGranted != PermissionStatus.granted) {
       }
     }

     _locationData = await location.getLocation();
     return _locationData ; }

   Future<String> getLocationDetails (double lat , double lang) async {
     // From coordinates
     final coordinates =  Coordinates(lat, lang);
     var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
     var first = addresses.first;


     return first.featureName ;
   }


   List<PrayerTimeModel> getPrayerTimeList (double lat , double lang) {
     final myCoordinates =  adhan.Coordinates(lat , lang ); // Replace with your own location lat, lng.
     final params = adhan.CalculationMethod.egyptian.getParameters();
     params.madhab = adhan.Madhab.shafi;
     final prayerTimes = adhan. PrayerTimes.today(myCoordinates, params);



     return List<PrayerTimeModel>()..add(PrayerTimeModel(prayerName: 'Fajr',prayerTime:DateFormat.jm().format(prayerTimes.fajr) ))
       ..add(PrayerTimeModel(prayerName: 'Sunrise',prayerTime:DateFormat.jm().format(prayerTimes.sunrise) ))
       ..add(PrayerTimeModel(prayerName: 'Duhur',prayerTime:DateFormat.jm().format(prayerTimes.dhuhr) ))
       ..add(PrayerTimeModel(prayerName: 'Asr',prayerTime:DateFormat.jm().format(prayerTimes.asr)))
       ..add(PrayerTimeModel(prayerName: 'Maghrib',prayerTime:DateFormat.jm().format(prayerTimes.maghrib)))
       ..add(PrayerTimeModel(prayerName: 'Isha',prayerTime:DateFormat.jm().format(prayerTimes.isha)));

   }

   Future<QuerySnapshot > getStoriesList ()   {
     return StoriesRemote().getStoriesList();




   }

}