

import 'package:flutter/material.dart';
import 'package:raheem/Model/StoryModel.dart';



//Whole Story Component
class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 120,child: Card ( elevation : 15 ,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ) ,
      child: StoryList(),)) ;
  }
}


//List Builder for Story HeadElement
class StoryList extends StatefulWidget {
  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {


  //Testing data
  List<StoryModel> getDataList () {
    return List<StoryModel>()
      ..add(StoryModel(headTitle: "Azkar",
        imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"))
      ..add(StoryModel(headTitle: "Dua",
          imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg" ))
      ..add(StoryModel(headTitle: "Ayah",
          imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg" ))
      ..add(StoryModel(headTitle: "Sadqah",
          imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg" ))
      ..add(StoryModel(headTitle: "Hadith",
        imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"))
      ..add(StoryModel(headTitle: "Sunnah",
          imgUrl: "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"));

  }
  //
  @override
  Widget build(BuildContext context) {
    return ListView.builder
      (  scrollDirection: Axis.horizontal,
        itemCount: getDataList().length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child:  StoryHead(getDataList()[index]),
          );
        }
    )
;
  }
}



//Story Head with Colourd Border
class StoryHead extends StatefulWidget {
  StoryModel storyModel;
  StoryHead(this.storyModel);

  @override
  _StoryHeadState createState() => _StoryHeadState();
}

class _StoryHeadState extends State<StoryHead> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
        CircleAvatar(
          backgroundColor:  Color(int.parse('#8b9cc1'.replaceAll('#', '0xff'))),
          radius: 29,
          child:  CircleAvatar(

            backgroundColor:
           Color(int.parse('#cad1f7'.replaceAll('#', '0xff'))) ,
            radius: 26,
            child: Text(widget.storyModel.headTitle),




          ),//CircleAvatar
          //CircleAvatar
        ),
        Padding(
          padding: const EdgeInsets.only(top:3.0),
          child: Text(
            widget.storyModel.headTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold),
          ),
        )],
    );
  }
}

