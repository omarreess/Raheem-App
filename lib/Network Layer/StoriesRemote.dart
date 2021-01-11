


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raheem/Pojo/StoryModel.dart';
import 'package:firebase_core/firebase_core.dart';


class StoriesRemote {

  StoriesRemote(){init();}
    void init() async{
     // await Firebase.initializeApp();

    }

Future<QuerySnapshot>   getStoriesList  () {
     var  users = FirebaseFirestore.instance.collection('Stories')      ;

    return users.get();


  }

  //Post Data

  //Testing data
    void postStories () async{

       List<StoryModel> getDataList () {
        return List<StoryModel>()
          ..add(StoryModel(headTitle: "Azkar",
              imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"))
          ..add(StoryModel(headTitle: "Dua",
              imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg" ))
          ..add(StoryModel(headTitle: "Tafsir",
              content: 'sdas' ))


          ..add(StoryModel(headTitle: "Sadqah",
              imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg" ))
          ..add(StoryModel(headTitle: "Hadith",
              imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"))
          ..add(StoryModel(headTitle: "Sunnah",
              imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"));

      }
    }


 }