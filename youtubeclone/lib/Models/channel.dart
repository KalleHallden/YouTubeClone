import 'package:flutter/material.dart';

class Channel {
  String channelName;
  AssetImage profilePicture;

  Channel(String channelName, AssetImage profilePic) {
    this.channelName = channelName;
    this.profilePicture = profilePic;
  }
}