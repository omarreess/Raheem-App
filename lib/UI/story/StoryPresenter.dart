import 'package:flutter/material.dart';

class StoryPresenter {

  BuildContext context ;
  StoryPresenter ({@required this.context}) ;


  void toStoryScreen () {
    Navigator.pushNamed(context, 'story');
  }


}