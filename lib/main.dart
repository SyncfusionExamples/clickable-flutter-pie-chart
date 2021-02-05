import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> chartData = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
            child: Container(
          height: 500,
          width: 320,
          //Initialize the chart widget
          child: SfCircularChart(
            backgroundColor: Colors.white,
            onDataLabelRender: (DataLabelRenderArgs args){
             double value = double.parse(args.text);
             args.text = value.toStringAsFixed(0);
            },
              onPointTapped: (PointTapArgs args){
                if (args.pointIndex == 0) {
            setState(() {
              chartData = <_SalesData>[
                _SalesData('Jan', 45),
                _SalesData('Feb', 18),
                _SalesData('Mar', 24),
                _SalesData('Apr', 22),
                _SalesData('May', 30)
              ];
            });
          }
          if (args.pointIndex == 1) {
            setState(() {
              chartData = <_SalesData>[
                _SalesData('Jan', 40),
                _SalesData('Feb', 13),
                _SalesData('Mar', 19),
                _SalesData('Apr', 17),
                _SalesData('May', 25)
              ];
            });
          }
            if (args.pointIndex == 2) {
            setState(() {
              chartData = <_SalesData>[
                _SalesData('Jan', 50),
                _SalesData('Feb', 23),
                _SalesData('Mar', 29),
                _SalesData('Apr', 27),
                _SalesData('May', 35)
              ];
            });
          }

           if (args.pointIndex == 3) {
            setState(() {
              chartData = <_SalesData>[
                _SalesData('Jan', 60),
                _SalesData('Feb', 33),
                _SalesData('Mar', 39),
                _SalesData('Apr', 37),
                _SalesData('May', 45)
              ];
            });
          }
           if (args.pointIndex == 4) {
            setState(() {
              chartData = <_SalesData>[
                _SalesData('Jan', 70),
                _SalesData('Feb', 48),
                _SalesData('Mar', 49),
                _SalesData('Apr', 47),
                _SalesData('May', 60)
              ];
            });
          }
              },
              series: <CircularSeries<_SalesData, String>>[
                PieSeries<_SalesData, String>(
                  selectionBehavior: SelectionBehavior(enable: true),
                  explode: true,
                  dataSource: chartData,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'Sales',
                  dataLabelSettings: DataLabelSettings(isVisible: true,)
                )
              ]),
        )));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
