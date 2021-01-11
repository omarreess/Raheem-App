

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raheem/Network%20Layer/StoriesRemote.dart';
import 'package:raheem/Pojo/StoryModel.dart';
import 'package:raheem/Repository/StoriesRepo.dart';
import 'package:raheem/UI/home/HomePresenter.dart';



//Whole Story Component
class StoryWidget extends StatefulWidget {
      BoxConstraints constraints ;
  double scaleFactor ;

  StoryWidget ({@required this.constraints});

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override


  @override
  Widget build(BuildContext context) {
    return Container(height: widget.constraints.maxHeight*0.20
        ,child: Card ( elevation : 15 ,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ) ,
      child: StoryList(constraints: widget.constraints,),)) ;
  }
}


//List Builder for Story HeadElement
class StoryList extends StatefulWidget {
  BoxConstraints constraints ;

  StoryList ({@required this.constraints});

  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {


  List<StoryModel> storiesList = List();

  @override
  Widget build(BuildContext context) {

    Firebase.initializeApp().whenComplete(
            () {
          HomePresenter().getStoriesList().then((snap)
          { storiesList.clear();
          snap.docs.forEach((story) {
            storiesList.add(
                StoryModel(headTitle: story['headTitle'],
                  imgUrl: story['imgUrl'] ,
                  content:story['content']  ,
                )); });
          setState(() {});
          });

        });
     if(storiesList.isEmpty)
        {
    return Container(width:double.infinity , height: 40,child: Center(child: CircularProgressIndicator()) );}
        else { return ListView.builder
      (
        scrollDirection: Axis.horizontal,
        itemCount: storiesList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return GestureDetector(
            onTap: ()=> HomePresenter( ).toStoryScreen(context , storiesList , index ),
             child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:  StoryHead(storiesList[index] , widget.constraints),
            ),
          );

        }


    );}

  }

}



//Story Head with Colourd Border
class StoryHead extends StatefulWidget {
  StoryModel storyModel;
  BoxConstraints constraints ;
  StoryHead(this.storyModel , this.constraints);


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
           radius: widget.constraints.maxWidth*0.082,
           child:  CircleAvatar(

             backgroundColor:
            Color(int.parse('#cad1f7'.replaceAll('#', '0xff'))) ,
             radius:widget.constraints.maxWidth*0.07,
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
            style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , ),
          ),
        )],
    );
  }
}

