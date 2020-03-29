import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/questions/shared_const.dart';
import 'package:shelter_in_place/pages/util/my_graph.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shelter_in_place/pages/util/my_legend.dart';

import 'localization/localizations.dart';

class SingleOverviewChart extends StatelessWidget {
  SingleOverviewChart({@required this.titleKeyname, @required this.colors});

  final String titleKeyname;
  final HashMap<String, Color> colors;

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<String> shuffledFeelings = Constants().feelings;
    shuffledFeelings.shuffle(Random.secure());
    return Center(
        child: Column(
      children: <Widget>[
        Text(AppLocalizations.of(context)
            .translate(titleKeyname),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 50.0), // adjust the height here
          child: StackedHorizontalBarChart(
            _createSampleData(),
            // Disable animations for image tests.
            animate: true,
          ), // place your chart here
        ),
        SimpleLegenda(items: shuffledFeelings.take(7).toList(), height: 130.0,)
      ],
    ));
  }
}
