import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtubeclone/Models/colors.dart';
import 'package:youtubeclone/Models/textstyles.dart';

class SuggestionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView(
        padding: EdgeInsets.only(left: 5),
        scrollDirection: Axis.horizontal,
        children: getTags(),
        shrinkWrap: false,
      ),
    );
  }

  List<Widget> getTags() {
    List<Widget> tags = [];
    for (int i = 0; i < 7; i++) {
      tags.add(Container(
        margin: EdgeInsets.only(left: 10),
        child: new FlatButton(
          child: Text(tagList[i], style: videoTitleStyle,),
          color: buttonUnselectedIconsColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: tabBarUnselectedIconsColor, width: 0.5)
          ),
          onPressed: () {

          },
        ),
      ));
    }
    return tags;
  }

  List<String> tagList = [
    "All",
    "Today",
    "Continue watiching",
    "Unwathced",
    "Trending",
    "Programming",
    "Python"
  ];
}