
import 'package:flutter/material.dart';
import 'package:youtubeclone/Models/colors.dart';
import 'package:youtubeclone/Models/textstyles.dart';
import 'package:youtubeclone/Views/channel_avatar.dart';
import 'package:youtubeclone/Views/suggestions_tab.dart';
import 'package:youtubeclone/Views/video_card.dart';

import 'Models/channel.dart';
import 'Models/video.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
     // This trailing comma makes auto-formatting nicer for build methods.
     return DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Container(
              child: Row(children: <Widget>[
              Container(
                width: 40,
                child: Image(image: AssetImage("assets/youtube_logo.png"),),
              ),
              Text("YouTube", style: youtube,),
              ],),),
              Container(
                padding: EdgeInsets.only(left: 100, bottom: 15),
                width: 260,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.cast),
                      Icon(Icons.video_call),
                      Icon(Icons.search),
                      Container(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(backgroundImage: channel.profilePicture),
                      )
                    ],
                  ),
                )
                ),
            ],
            backgroundColor: tabBarColor,
          ),
          body: TabBarView(
            children: [
              new Container(
                color: backgroundColor,
                child: ListView(children: getVideos(false),),
              ),
              new Container(color: Colors.orange,),
              new Container(
                color: backgroundColor,
                child: ListView(
                  children: getVideos(true),
                ),
              ),
              new Container(
                color: Colors.red,
              ),
              new Container(
                color: Colors.blue,
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            labelStyle: tabTextStyle,
            tabs: tabList,
            labelColor: tabBarSelectedIconsColor,
            unselectedLabelColor: tabBarUnselectedIconsColor,
            indicatorColor: Colors.transparent,
          ),
          backgroundColor: tabBarColor,
        ),
      );
  }

  List<Widget> getVideos(bool isSubscriptionPage) {
    List<Video> videos = makeVideos();
    List<Widget> cards = [];
    if (isSubscriptionPage) {
      cards.add(Container(
      color: backgroundColor, height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              ChannelAvatar(channel: channel),
            ]
          ),
          Divider(color: tabBarUnselectedIconsColor,),
          SuggestionsTab()
        ],
      ),
      )
    );
    } else {
      cards.add(Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
      color: backgroundColor, height: 50,
      child: SuggestionsTab(),
      )
    );
    }
    for (Video video in videos) {
      cards.add(VideoCard(video: video,));
    }
    return cards;   
  }

  List<String> videoTitles = [
    "One Day Builds: YouTube Clone With FLutter!",
    "How To Get Started In Game Development",
    "I Practiced Touch Typing Every Day For 30 Days",
    "How To Overcome Coders Block",
    "Super Quick Python Porject Ideas For Beginners!"
  ];

  Channel channel = new Channel("Kalle Hallden", AssetImage("assets/profilepics/5.jpg"));

  List<Video> makeVideos() {
    List<Video> vids = [];
    for (int i = 0; i < 5; i++) {
      vids.add(new Video(
        AssetImage("assets/thumbnails/" + i.toString() + ".jpg"),
        120000,
        DateTime.now().subtract(new Duration(days: 400)),
        videoTitles[i],
        channel
      ));
    }
    return vids;
  }

  List<Widget> tabList = [
              Tab(
                icon: new Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: new Icon(Icons.explore),
                text: "Explore",
              ),
              Tab(
                icon: new Icon(Icons.subscriptions),
                text: "Subscriptions",
              ),
              Tab(
                icon: new Icon(Icons.email),
                text: "Inbox",
              ),
              Tab(
                icon: new Icon(Icons.video_library),
                text: "Library",
              )
            ];
}
