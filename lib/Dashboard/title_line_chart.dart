import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineTitles {
  static FlTitlesData getTitleData() {
    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        rotateAngle: 8,
        showTitles: true,
        // interval: 1s,
        getTitles: ((value) {
          switch (value.toInt()) {
            case 0:
              return 'Jan';
            case 1:
              return 'Feb';
            case 2:
              return 'Mar';
            case 3:
              return 'Apr';
            case 4:
              return 'May';
            case 5:
              return 'Jun';
            case 6:
              return 'Jul';
            case 7:
              return 'Aug';
            case 8:
              return 'Sep';
            case 9:
              return 'Oct';
            case 10:
              return 'Nov';
            case 11:
              return 'Dec';
            default:
              return ''; // atau return null;
          }
        }
        ),
        margin: 4
      ),
    );
  }
}
