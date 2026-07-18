import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/core/theming/app_colors.dart';
import 'package:mkaweel/core/theming/app_text_styles.dart';
import 'package:mkaweel/features/screens/dashboard/data/model/ghant_res/ghant_res.dart';

class CustomBarChartWidget extends StatelessWidget {
  const CustomBarChartWidget({super.key, required this.phases});

  final List<PhaseItem> phases;

  @override
  Widget build(BuildContext context) {
    if (phases.isEmpty) {
      return const SizedBox.shrink();
    }

    const double chartHeight = 250.0;
    const double yAxisWidth = 30.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: chartHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Y-Axis Labels
              SizedBox(
                width: yAxisWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(11, (index) {
                    final value = 100 - (index * 10);
                    return Text(
                      value.toString(),
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.contractorGreyText.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 8),
              // Bars Area
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double availableWidth = constraints.maxWidth;
                    // Max bar width or dynamic based on count
                    final double barWidth = min(40.0, max(15.0, (availableWidth / phases.length) - 8));

                    return Stack(
                      children: [
                        // Background horizontal grid lines
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(11, (index) {
                            return Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 1,
                                  color: AppColors.lightBorder.withOpacity(0.5),
                                ),
                              ),
                            );
                          }),
                        ),
                        // Bars
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: phases.map((phase) {
                            final progress = phase.progress_percentage.clamp(0, 100).toDouble();
                            final heightFactor = progress / 100.0;

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // The bar itself
                                Container(
                                  width: barWidth,
                                  height: chartHeight * heightFactor,
                                  decoration: BoxDecoration(
                                    color: _getColorForPhase(phases.indexOf(phase)),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: progress > 5
                                      ? Text(
                                          '${progress.toInt()}%',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // X-Axis Line
        Container(
          height: 1,
          color: AppColors.lightBorder,
          margin: const EdgeInsets.only(left: yAxisWidth + 8),
        ),
        const SizedBox(height: 8),
        // X-Axis Labels (Phase Names)
        Padding(
          padding: const EdgeInsets.only(left: yAxisWidth + 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: phases.map((phase) {
              return Expanded(
                child: Transform.rotate(
                  angle: -pi / 4,
                  alignment: Alignment.topLeft,
                  child: Text(
                    phase.phase_name,
                    style: AppTextStyles.font12Regular.copyWith(
                      color: AppColors.contractorGreyText,
                      fontSize: 10,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 40), // Spacing for rotated text
      ],
    );
  }

  Color _getColorForPhase(int index) {
    // Colors matching the design image roughly
    const colors = [
      Color(0xFF5A75E6), // Blue
      Color(0xFF4AC29A), // Green
      Color(0xFFF3C268), // Yellow/Orange
      Color(0xFF4C566A), // Dark Grey
      Color(0xFFF09A59), // Orange
      Color(0xFFB48EAD), // Purple
    ];
    return colors[index % colors.length];
  }
}
