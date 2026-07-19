import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_res/ghant_res.dart';
import 'package:mkaweel/features/screens/dashboard/ui/suppliers_info/suppliers_info_screen.dart';

class CustomBarChartWidget extends StatefulWidget {
  const CustomBarChartWidget({super.key, required this.phases});

  final List<PhaseItem> phases;

  @override
  State<CustomBarChartWidget> createState() => _CustomBarChartWidgetState();
}

class _CustomBarChartWidgetState extends State<CustomBarChartWidget> {
  final ValueNotifier<bool> _isExpandedNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isExpandedNotifier.dispose();
    super.dispose();
  }

  Color _getColorForPhase(int index) {
    const colors = [
      Color(0xFF003F5A),
      Color(0xFF5A75E6),
      Color(0xFF4AC29A),
      Color(0xFFF3C268),
      Color(0xFFF09A59),
      Color(0xFFB48EAD),
      Color(0xFFE57373),
      Color(0xFF81C784),
      Color(0xFF64B5F6),
      Color(0xFFFFD54F),
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.phases.isEmpty) {
      return const SizedBox.shrink();
    }

    // Assign IDs: 1, 2, 3... corresponding to the original index
    final List<Map<String, dynamic>> mappedPhases = widget.phases.asMap().entries.map((e) {
      return {
        'id': e.key + 1, // 1-based ID
        'phase': e.value,
        'index': e.key,
      };
    }).toList();

    // Active phases: progress > 0, ordered by id DESC
    final activePhases = mappedPhases
        .where((p) => (p['phase'] as PhaseItem).progress_percentage > 0)
        .toList()
      ..sort((a, b) => (b['id'] as int).compareTo(a['id'] as int));

    // Inactive phases: progress == 0
    final inactivePhases = mappedPhases
        .where((p) => (p['phase'] as PhaseItem).progress_percentage == 0)
        .toList();

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
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    plotAreaBorderColor: Colors.transparent,
                    plotAreaBorderWidth: 0,
                    enableAxisAnimation: true,
                    enableSideBySideSeriesPlacement: false,
                    primaryXAxis: CategoryAxis(
                      isInversed: true,
                      majorGridLines: const MajorGridLines(width: 0),
                      labelRotation: 0,
                      interval: 1, // Force showing all items
                      labelIntersectAction: AxisLabelIntersectAction.none,
                      axisLabelFormatter: (args) {
                        int id = int.tryParse(args.text) ?? 1;
                        int index = id - 1;
                        return ChartAxisLabel(
                          args.text,
                          TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: _getColorForPhase(index),
                          ),
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
                        dataSource: widget.phases,
                        width: 0.3,
                        spacing: 0.2,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          showZeroValue: false,
                          textStyle: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        dataLabelMapper: (PhaseItem data, _) => '${data.progress_percentage}%',
                        xValueMapper: (PhaseItem data, _) => '${widget.phases.indexOf(data) + 1}',
                        yValueMapper: (PhaseItem data, _) => data.progress_percentage,
                        pointColorMapper: (PhaseItem data, _) => _getColorForPhase(widget.phases.indexOf(data)),
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
            children: [
              // Active phases (progress > 0)
              ...activePhases.map((map) => _buildDetailRow(map, false)),
              
              if (inactivePhases.isNotEmpty) ...[
                const SizedBox(height: 8),
                ShowMoreLess(isExpandedNotifier: _isExpandedNotifier),
                const SizedBox(height: 8),
                ValueListenableBuilder<bool>(
                  valueListenable: _isExpandedNotifier,
                  builder: (context, isExpanded, child) {
                    if (!isExpanded) return const SizedBox.shrink();
                    return Column(
                      children: inactivePhases.map((map) => _buildDetailRow(map, true)).toList(),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(Map<String, dynamic> map, bool isInactive) {
    final int id = map['id'] as int;
    final PhaseItem phase = map['phase'] as PhaseItem;
    final int index = map['index'] as int;
    final Color color = _getColorForPhase(index);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
         children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$id',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              phase.phase_name,
              style: TextStyle(
                fontSize: 14,
                color: isInactive ? Colors.grey : Colors.black87,
                fontWeight: FontWeight.w500,
                decoration: isInactive ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
