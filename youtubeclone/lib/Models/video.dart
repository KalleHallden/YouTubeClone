import 'package:flutter/material.dart';
import 'channel.dart';

class Video {
  AssetImage thumbnail;
  int viewCount;
  DateTime uploadDate;
  String videoTitle;
  Channel channel;

  Video(AssetImage thumbnail, int viewCount, DateTime uploadDate, String videoTitle, Channel channel) {
    this.thumbnail = thumbnail;
    this.viewCount = viewCount;
    this.uploadDate = uploadDate;
    this.videoTitle = videoTitle;
    this.channel = channel;
  }

  String getViewCount() {
    String viewString = this.viewCount.toString();
    String value = "";
    if (viewString.length >= 10) {
      value = "B";
      viewString = compressViews([11, 12], viewString);
    } else if (viewString.length >= 7) {
      value = "M";
      viewString = compressViews([8, 9], viewString);
    } else if (viewString.length >= 4) {
      value = "K";
      viewString = compressViews([5, 6], viewString);
    }
    return viewString + value;
  }

  String compressViews(List<int> numbers, String viewString) {
    if (viewString.length == numbers[0]) {
        viewString = viewString.substring(0, 3);
      } else if (viewString.length == numbers[1]) {
        viewString = viewString.substring(0, 2);
      } else {
        String newString = viewString.substring(0, 1);
        viewString = newString +"." + viewString.substring(1, 2);
      }
      return viewString;
  }
  int index;

  String getVideoTitle() {
    index = 0;
    if (this.videoTitle.length > 29) {
      // fix title
      List wordList = this.videoTitle.split(" ");
      String newTitle = "";
      while (index != wordList.length) {
        newTitle += makeTitleRow(wordList);
        if (wordList.length != index) {
          newTitle += "\n";
        }
      }
      return newTitle;
    } else {
      return this.videoTitle;
    }
  }

  String makeTitleRow(List<String> wordList) {
    String newTitleRow = wordList[index];
    index += 1;
    while (newTitleRow.length < 29 && index != wordList.length) {
        newTitleRow += " " + wordList[index];
        index += 1;
    }
    if (newTitleRow.length > 29) {
      List<String> res = newTitleRow.split(" ");
      res.removeLast();
      for (int i = 0; i < res.length; i++) {
        if (i == 0) {
          newTitleRow = res[i];
        } else {
          newTitleRow += " " + res[i];
        }
      }
      index -= 1;
    }
    return newTitleRow;
  }

  String getTimeSinceUpload() {
    DateTime now = DateTime.now();
    int minutes = now.difference(this.uploadDate).inMinutes;
    int hours = now.difference(this.uploadDate).inHours;
    int days = now.difference(this.uploadDate).inDays;
    double weeks = days / 7;
    double months = weeks / 4;
    double years = days /365;

    if (years >= 1) {
      String year = " year";
      if (years >= 2) {
        year = " years";
      }
      return years.toInt().toString() + year;
    } else if (months >= 1){
      String month = " month";
      if (months >= 2) {
        month = " months";
      }
      return months.toInt().toString() + month;
    } else if (weeks >= 1){
      String week = " week";
      if (weeks >= 2) {
        week = " weeks";
      }
      return weeks.toInt().toString() + week;
    } else if (days >= 1){
      String day = " day";
      if (days >= 2) {
        day = " days";
      }
      return days.toInt().toString() + day;
    } else if (hours >= 1){
      String hour = " hour";
      if (hours >= 2) {
        hour = " hours";
      }
      return hours.toInt().toString() + hour;
    } else if (minutes >= 1){
      String minute = " minute";
      if (minutes >= 2) {
        minute = " minutes";
      }
      return minutes.toInt().toString() + minute;
    } else {
      return "not long";
    }
  }
}