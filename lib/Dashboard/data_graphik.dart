import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Dashboard/title_line_chart.dart';

class lineChart extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

final List<Color>gradientColor = [
const Color(0xff23b6e6),
const Color(0xff02d39a),
];


    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: 200,
        width: 400,
        child: LineChart(
          LineChartData(
            minX:0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: LineTitles.getTitleData(
           
            ),
            
            
            gridData: FlGridData(
              show: true,
              
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true
              // getDrawingVerticalLine: (value) {
              //   return FlLine(
              //       color: const Color(0xff37434d),
              //     strokeWidth: 1,
              //   );
              // },
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(2.6, 2),
                  FlSpot(4.9, 5),
                  FlSpot(6.8, 2.5),
                  FlSpot(6.8, 2.5),
                  FlSpot(8, 4),
                  FlSpot(9.5, 3),
        
                ],
                isCurved: true,
                barWidth: 4,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                )
                
              ),
            ]
        
            
          )
        ),
      ),
    );
  }


}