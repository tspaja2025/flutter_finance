import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance/shared/styling.dart';
import 'package:flutter_finance/widgets/app_card.dart';
import 'package:flutter_finance/widgets/section_header.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Financial Insights', style: AppTextStyles.headline3),
        Text(
          'Detailed analysis of your June 2026 spending.',
          style: AppTextStyles.body1.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: AppSpacing.md),
        _timePeriodButtons(context),
        const SizedBox(height: AppSpacing.md),
        _spendingByCategoryCard(context),
        _cashFlowAnalysisCard(context),
        const SizedBox(height: AppSpacing.md),
        const SectionHeader(title: 'Budget Goals'),
        const SizedBox(height: AppSpacing.md),
        _budgetGoalCard(
          context,
          icon: Icons.shopping_cart_outlined,
          title: 'Groceries',
          subtitle: '82% of \$600',
          remaining: '\$492 left',
        ),
        _budgetGoalCard(
          context,
          icon: Icons.movie_outlined,
          title: 'Entertainment',
          subtitle: '45% of \$300',
          remaining: '\$135 left',
        ),
        _budgetGoalCard(
          context,
          icon: Icons.shopping_cart_outlined,
          title: 'Utilities',
          subtitle: '98% of \$450',
          remaining: '\$9 left',
        ),
        const SizedBox(height: AppSpacing.md),
        _savingsMomentumCard(context),
      ],
    );
  }

  Widget _timePeriodButtons(BuildContext context) {
    return Row(
      children: [
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(minimumSize: const Size(80, 36)),
          child: const Text('Monthly'),
        ),
        const SizedBox(width: AppSpacing.sm),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(minimumSize: const Size(80, 36)),
          child: const Text('Quarterly'),
        ),
        const SizedBox(width: AppSpacing.sm),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(minimumSize: const Size(80, 36)),
          child: const Text('Yearly'),
        ),
      ],
    );
  }

  Widget _spendingByCategoryCard(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Spending by Category', style: AppTextStyles.title2),
              const Icon(Icons.error_outline),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 220,
                height: 220,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 70,
                    sectionsSpace: 6,
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                        value: 40,
                        color: Colors.black,
                        radius: 18,
                        title: '',
                      ),
                      PieChartSectionData(
                        value: 25,
                        color: Colors.green,
                        radius: 18,
                        title: '',
                      ),
                      PieChartSectionData(
                        value: 15,
                        color: Colors.blueGrey,
                        radius: 18,
                        title: '',
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Colors.grey.shade200,
                        radius: 18,
                        title: '',
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('\$4,280', style: AppTextStyles.headline1),
                  Text(
                    'TOTAL SPENT',
                    style: AppTextStyles.label.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          ...['Housing', 'Lifestyle', 'Travel'].asMap().entries.map((entry) {
            final colors = [Colors.black, Colors.green, Colors.blueGrey];
            final percentages = ['40%', '25%', '15%'];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colors[entry.key],
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(entry.value, style: AppTextStyles.body1),
                  const Spacer(),
                  Text(
                    percentages[entry.key],
                    style: AppTextStyles.body1.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _cashFlowAnalysisCard(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Cash Flow Analysis', style: AppTextStyles.title2),
              const Spacer(),
              const Text('Income', style: TextStyle(color: Colors.green)),
              const SizedBox(width: AppSpacing.xs),
              const Text('Expense', style: TextStyle(color: Colors.red)),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                        ];
                        if (value.toInt() >= 0 &&
                            value.toInt() < months.length) {
                          return Text(
                            months[value.toInt()],
                            style: AppTextStyles.caption.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    width: 1,
                  ),
                ),
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 45),
                      FlSpot(1, 55),
                      FlSpot(2, 50),
                      FlSpot(3, 70),
                      FlSpot(4, 65),
                      FlSpot(5, 85),
                    ],
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: [Colors.green.shade400, Colors.green.shade700],
                    ),
                    barWidth: 4,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withValues(alpha: 0.3),
                          Colors.green.withValues(alpha: 0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 30),
                      FlSpot(1, 35),
                      FlSpot(2, 40),
                      FlSpot(3, 45),
                      FlSpot(4, 50),
                      FlSpot(5, 55),
                    ],
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: [Colors.red.shade400, Colors.red.shade700],
                    ),
                    barWidth: 4,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.withValues(alpha: 0.3),
                          Colors.red.withValues(alpha: 0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${spot.barIndex == 0 ? 'Income' : 'Expense'}: \$${spot.y.toInt()}K',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _budgetGoalCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String remaining,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
        ),
        title: Text(title, style: AppTextStyles.title2),
        subtitle: Text(subtitle, style: AppTextStyles.body2),
        trailing: Text(
          remaining,
          style: AppTextStyles.title2.copyWith(color: Colors.green.shade700),
        ),
      ),
    );
  }

  Widget _savingsMomentumCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Colors.green,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Text('Savings Momentum', style: AppTextStyles.title1),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '+12%',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.primary),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    "You've saved 12% more than last month. Keep this pace to reach your 'Vacation Fund' goal 2 months earlier.",
                    style: AppTextStyles.body1.copyWith(height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  label: 'Saved this year',
                  value: '\$12,450',
                  valueColor: Colors.green,
                ),
              ),
              Container(height: 40, width: 1, color: Colors.grey.shade300),
              Expanded(
                child: _buildStatItem(
                  label: 'Avg. Monthly ROI',
                  value: '+8.4%',
                  valueColor: Colors.blue.shade700,
                ),
              ),
              Container(height: 40, width: 1, color: Colors.grey.shade300),
              Expanded(
                child: _buildStatItem(
                  label: 'Goal Progress',
                  value: '74%',
                  valueColor: Colors.orange.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.rocket_launch, size: 18),
            label: const Text('Boost Savings'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.headline3.copyWith(color: valueColor)),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          style: AppTextStyles.body2.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
