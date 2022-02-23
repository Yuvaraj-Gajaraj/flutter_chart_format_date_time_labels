import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChartApp(),
    );
  }
}

class ChartApp extends StatefulWidget {
  const ChartApp({Key? key}) : super(key: key);

  @override
  _ChartAppState createState() => _ChartAppState();
}

class _ChartAppState extends State<ChartApp> {
  late List<SeriesData> chartData;

  @override
  void initState() {
    chartData = <SeriesData>[
      SeriesData(DateTime(2022, 02, 01), 20),
      SeriesData(DateTime(2022, 02, 02), 10),
      SeriesData(DateTime(2022, 02, 03), 20),
      SeriesData(DateTime(2022, 02, 04), 30),
      SeriesData(DateTime(2022, 02, 05), 20),
      SeriesData(DateTime(2022, 02, 06), 30),
      SeriesData(DateTime(2022, 02, 07), 10),
      SeriesData(DateTime(2022, 02, 08), 20),
      SeriesData(DateTime(2022, 02, 09), 10),
      SeriesData(DateTime(2022, 02, 10), 30),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SfCartesianChart(
                title: ChartTitle(text: 'Customized by dateFormat'),
                primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat.yMd(),
                ),
                series: <ChartSeries<SeriesData, DateTime>>[
                  LineSeries(
                    dataSource: chartData,
                    xValueMapper: (SeriesData sales, _) => sales.x,
                    yValueMapper: (SeriesData sales, _) => sales.y,
                  )
                ],
              ),
              SfCartesianChart(
                title: ChartTitle(text: 'Customized by axisLabelFormatter'),
                primaryXAxis: DateTimeAxis(
                  axisLabelFormatter: (axisLabelRenderArgs) {
                    return ChartAxisLabel(
                        DateFormat('EEEE').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                axisLabelRenderArgs.value.toInt())),
                        const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold));
                  },
                ),
                series: <ChartSeries<SeriesData, DateTime>>[
                  LineSeries(
                    dataSource: chartData,
                    xValueMapper: (SeriesData sales, _) => sales.x,
                    yValueMapper: (SeriesData sales, _) => sales.y,
                  )
                ],
              ),
            ]));
  }
}

class SeriesData {
  SeriesData(this.x, this.y);
  final DateTime x;
  final num y;
}