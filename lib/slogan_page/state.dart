import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class SloganState implements Cloneable<SloganState> {
  var images = <String>[
    'assets/imgs/day1.jpg',
    'assets/imgs/day2.jpg',
    'assets/imgs/day3.jpg',
    'assets/imgs/day4.jpg',
    'assets/imgs/day5.jpg',
    'assets/imgs/day6.jpg',
    'assets/imgs/day7.jpg',
  ];
  AssetImage  currentImg ;
  @override
  SloganState clone() {
    return SloganState()..currentImg=currentImg..images =images;
  }
}

SloganState initState(Map<String, dynamic> args) {
  var images = <String>[
    'assets/imgs/day1.jpg',
    'assets/imgs/day2.jpg',
    'assets/imgs/day3.jpg',
    'assets/imgs/day4.jpg',
    'assets/imgs/day5.jpg',
    'assets/imgs/day6.jpg',
    'assets/imgs/day7.jpg',
  ];
  return SloganState()..currentImg = AssetImage(images[DateTime.now().weekday-1]);
}
