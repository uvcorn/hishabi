import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/statistics_provider.dart';

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatisticsProvider>(context);
    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1, // ✅ Fix duplication
                getTitlesWidget: (value, meta) {
                  final months = [
                    "Jan",
                    "Feb",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                  ];
                  if (value.toInt() >= 0 && value.toInt() < months.length) {
                    return Text(months[value.toInt()]);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: provider.expenseSpots,
              isCurved: true,
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.teal.shade200],
              ),
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.teal.withOpacity(0.3),
                    Colors.teal.withOpacity(0.0),
                  ],
                ),
              ),
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
