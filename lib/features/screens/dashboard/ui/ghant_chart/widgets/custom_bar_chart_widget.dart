import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_res/ghant_res.dart';

class CustomBarChartWidget extends StatelessWidget {
  const CustomBarChartWidget({super.key, required this.phases});

  final List<PhaseItem> phases;

  @override
  Widget build(BuildContext context) {
    if (phases.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                /// chart
                Expanded(
                  child: SfCartesianChart(
                    plotAreaBorderColor: Colors.transparent,
                    plotAreaBorderWidth: 0,
                    enableAxisAnimation: true,
                    enableSideBySideSeriesPlacement: false,
                    primaryXAxis: CategoryAxis(
                      isInversed: true,
                      majorGridLines: const MajorGridLines(width: 0),
                      interval: 1, // Force showing all items
                      labelIntersectAction: AxisLabelIntersectAction.none,
                      axisLabelFormatter: (args) {
                        return ChartAxisLabel(
                          args.text,
                          const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    primaryYAxis: NumericAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      minorGridLines: const MinorGridLines(width: 0),
                      minimum: 0,
                      maximum: 100,
                      interval: 20,
                      axisLabelFormatter: (args) {
                        return ChartAxisLabel(
                          args.value.toInt().toString(),
                          const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                    /// Series
                    series: [
                      ColumnSeries<PhaseItem, String>(
                        enableTooltip: true,
                        dataSource: phases,
                        width: 0.3,
                        spacing: 0.2,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          showZeroValue: false,
                          textStyle: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        dataLabelMapper: (PhaseItem data, _) => "${data.progress_percentage}%",
                        xValueMapper: (PhaseItem data, _) => "${phases.indexOf(data) + 1}",
                        yValueMapper: (PhaseItem data, _) => data.progress_percentage,
                        color: HexColor("#003F5A"),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Details Column
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: phases.map((phase) {
              final id = phases.indexOf(phase) + 1;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HexColor("#003F5A").withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$id',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: HexColor("#003F5A"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        phase.phase_name,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
