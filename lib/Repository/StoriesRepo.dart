


import 'package:flutter/material.dart';
import 'package:raheem/Pojo/StoryModel.dart';
import 'package:raheem/UI/home/HomePresenter.dart';

class StoriesRepo  extends ChangeNotifier

{
  List<StoryModel> storiesList;


  StoriesRepo(){
 //   getData();
}

  //Getting Data
  void getData()  {
     //   HomePresenter().getStoriesList().then((stream) {
     //   stream.listen((snap) {
     //
     //     ( snap==null)?print('  null'):
     //
     //     snap.docs.forEach((doc) {
     //       storiesList.add( StoryModel(headTitle: doc.data()['headTitle'],
     //         imgUrl: doc.data()['imgUrl'] ,
     //         content:doc.data()['content']  ,
     //       ));
     //       print('  ${storiesList.length}');
     //       notifyListeners();
     //
     //     });
     //    });
     // });




  }
}