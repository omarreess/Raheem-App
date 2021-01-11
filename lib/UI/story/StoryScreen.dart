import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raheem/Pojo/StoryModel.dart';

class StoryScreen extends StatefulWidget {

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {

  void toNextStory(){
    Future.delayed(const Duration(milliseconds: 3500), () {
      index++;
       ( index< storyList.length) ?setState((){

     }) : Navigator.pop(context);

    });
  }

  @override
  void didChangeDependencies() {
    //args
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments  as Map<String,dynamic> ;
    storyList=args['list'] as List;
    index=args['index'] ;
  }

  @override
  Widget build(BuildContext context) {

    //Switching Next Story
   toNextStory();

    return
        SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1080 / 1920,
            child: Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColorLight),
              child:Padding(
                padding: const EdgeInsets.all(12.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [

                        Container( height: constraints.maxHeight*0.10, child: StoryHeaderWidget()),
                        Divider(height: constraints.maxHeight*0.05 , endIndent: double.infinity,indent: double.infinity,),
                        Container(height: constraints.maxHeight*0.85, child: StoryContentWidget()),
                      ],
                    );



                  },
                ),
              )

            ),
          ),
        ),

    );
  }
}

//Header
class StoryHeaderWidget extends StatefulWidget {


  @override
  _StoryHeaderWidgetState createState() => _StoryHeaderWidgetState();
}

class _StoryHeaderWidgetState extends State<StoryHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

         return Row(
           children: [
         CircleAvatar(
         backgroundColor:  Colors.white,
        radius: constraints.maxWidth*0.07,
        child:  CircleAvatar(

        backgroundColor:Color(int.parse('#cad1f7'.replaceAll('#', '0xff'))) ,
        radius:constraints.maxWidth*0.06,





        ),//CircleAvatar
        //CircleAvatar
        ),
             VerticalDivider (width: constraints.maxWidth*0.016 , endIndent: double.infinity,indent: double.infinity,),

           Padding(
             padding: const EdgeInsets.all(5.0),
             child: Column(
               crossAxisAlignment:CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [

               Text(
                 storyList[index].headTitle ,

                 style: TextStyle(fontSize : 17.5 * MediaQuery.of(context).textScaleFactor ,
                     fontWeight: FontWeight.bold ,
                     color: Colors.white ,
                     decoration: TextDecoration.none
                 ),
               ) ,

               Text(
                 'Raheem App',
                   style: TextStyle( fontSize : 12.4 *  MediaQuery.of(context).textScaleFactor
                       , fontWeight: FontWeight.w400 ,decoration: TextDecoration.none ,
                       color: Colors.white),
               )



             ],),
           ),
           ],
         );

      },
    )
    ;
  }
}

//Content
class StoryContentWidget extends StatefulWidget {

  @override
  _StoryContentWidgetState createState() => _StoryContentWidgetState();
}

class _StoryContentWidgetState extends State<StoryContentWidget> {
  bool f = true ;

  @override
  Widget build(BuildContext context) {
    return  (storyList[index] .imgUrl.isEmpty )  ?
    Scrollbar(
      // isAlwaysShown: true,
      // controller: ScrollController(),
      child : SingleChildScrollView(scrollDirection: Axis.vertical,


          child:Text (storyList[index] .content        ,
           textAlign: TextAlign.right,


          style: GoogleFonts.cairo(

              fontWeight: FontWeight.w400 ,
              color: Colors.white,
               wordSpacing: 2,
              fontSize : 22 *  MediaQuery.of(context).textScaleFactor ,
              decoration: TextDecoration.none //noSugestion
          ), ) ,),
    )
    :
    Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
      child:
        CachedNetworkImage(
        imageUrl: storyList[index] .imgUrl,
        placeholder: (context, url) => Center(child: Container (width: 40,height: 40, child: CircularProgressIndicator(backgroundColor: Colors.white,) )),
        errorWidget: (context, url, error) => Center(child: Container (width: 40,height: 40, child: Icon(Icons.error))),
      ),




      ),
    );
  }
}
 List<StoryModel> storyList ;
int index ;
