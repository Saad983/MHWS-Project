import 'package:mhws/model/analytic_bar_data_model.dart';
import 'package:mhws/view/utils/export_all.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticBarChart extends StatelessWidget {
  AnalyticBarChart({
    super.key,
  });

  final List<AnalyticBarDataModel> data = [
    AnalyticBarDataModel(
      label: "Sun",
      shotsAttempted: 5,
      shotsMade: 2,
    ),
    AnalyticBarDataModel(
      label: "Mon",
      shotsAttempted: 5,
      shotsMade: 2,
    ),
    AnalyticBarDataModel(
      label: "Tue",
      shotsAttempted: 5,
      shotsMade: 2,
    ),
    AnalyticBarDataModel(
      label: "Wed",
      shotsAttempted: 5,
      shotsMade: 2,
    ),
    AnalyticBarDataModel(
      label: "Thur",
      shotsAttempted: 5,
      shotsMade: 2,
    ),
    AnalyticBarDataModel(
      label: "Fri",
      shotsAttempted: 5,
      shotsMade: 2,
    ),
    AnalyticBarDataModel(
      label: "Sat",
      shotsAttempted: 5,
      shotsMade: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.white,
      primaryXAxis: CategoryAxis(
        labelRotation: -30,
        interval: 2,
        labelStyle: TextStyle(
          color: G.primaryColor,
          fontSize: 10.sp,
        ),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      primaryYAxis: NumericAxis(
        interval: 2,
        minimum: 0,
      ),
      series: <ColumnSeries<AnalyticBarDataModel, String>>[
        ColumnSeries(
          dataSource: data,
          enableTooltip: true,
          xValueMapper: (AnalyticBarDataModel sales, _) => sales.label,
          yValueMapper: (AnalyticBarDataModel sales, _) => sales.shotsAttempted,
          name: 'Attempts',
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: G.primaryColor,
        )
      ],
    );
  }
}
