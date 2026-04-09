import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/premium_shell.dart';

class ImpactDashboardScreen extends StatelessWidget {
  const ImpactDashboardScreen({super.key});
  static const route = '/impact';

  @override
  Widget build(BuildContext context) {
    return PremiumShell(
      title: 'Impact Dashboard',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _ImpactMetric(title: 'Meals Saved', value: '1,248'),
              _ImpactMetric(title: 'Revenue Recovered', value: '\$9,240'),
              _ImpactMetric(title: 'CO₂ Reduced', value: '2.6T'),
              _ImpactMetric(title: 'Donations Made', value: '412'),
            ],
          ),
          const SizedBox(height: 16),
          Text('Meals Saved Over Time', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const GlassCard(child: SizedBox(height: 220, child: _LineChart())),
          const SizedBox(height: 16),
          Text('Waste Reduction Progress', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          const GlassCard(child: SizedBox(height: 220, child: _ProgressChart())),
        ],
      ),
    );
  }
}

class _ImpactMetric extends StatelessWidget {
  const _ImpactMetric({required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(drawVerticalLine: false),
        titlesData: const FlTitlesData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: const [FlSpot(0, 1), FlSpot(1, 2), FlSpot(2, 2.8), FlSpot(3, 2.4), FlSpot(4, 4), FlSpot(5, 5.4), FlSpot(6, 6.1)],
            isCurved: true,
            color: AppColors.primary,
            barWidth: 4,
            belowBarData: BarAreaData(show: true, color: AppColors.primary.withValues(alpha: .16)),
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
    );
  }
}

class _ProgressChart extends StatelessWidget {
  const _ProgressChart();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            centerSpaceRadius: 54,
            sectionsSpace: 0,
            sections: const [
              PieChartSectionData(value: 74, color: AppColors.primary, radius: 24, title: ''),
              PieChartSectionData(value: 26, color: AppColors.surfaceSoft, radius: 24, title: ''),
            ],
          ),
          duration: const Duration(milliseconds: 900),
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('74%', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800)),
            Text('Waste Reduced'),
          ],
        ),
      ],
    );
  }
}
