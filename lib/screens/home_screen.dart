import 'package:flutter/material.dart';
import 'package:flutter_dotted_border/flutter_dotted_border.dart';
import 'package:flutter_finance/shared/styling.dart';
import 'package:flutter_finance/widgets/app_card.dart';
import 'package:flutter_finance/widgets/section_header.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _balanceSummary(context),
        SizedBox(height: AppSpacing.md),
        _accountsSection(context),
        SizedBox(height: AppSpacing.md),
        _transactionsSection(context),
        SizedBox(height: AppSpacing.md),
        _savingsGoalCard(context),
        SizedBox(height: AppSpacing.md),
        _monthlyInsightsCard(context),
      ],
    );
  }

  Widget _balanceSummary(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      gradient: LinearGradient(
        colors: [
          colorScheme.surface,
          colorScheme.surface.withValues(alpha: 0.8),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL BALANCE',
                style: AppTextStyles.label.copyWith(color: Colors.grey),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const Text('\$48,290.45', style: AppTextStyles.headline1),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.trending_up, color: Colors.green.shade700, size: 16),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '+2.4%',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'from last month',
                  style: AppTextStyles.body2.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send_outlined, size: 20),
                  label: const Text('Send'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.request_quote_outlined, size: 20),
                  label: const Text('Request'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _accountsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Your Accounts',
          actionLabel: 'View All',
          onActionTap: () => context.goNamed('accounts'),
        ),
        const SizedBox(height: AppSpacing.sm),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildAccountCard(
                'Savings Account',
                'Platinum Savings',
                32040.00,
              ),
              const SizedBox(width: AppSpacing.md),
              _buildAccountCard('Daily Savings', 'Platinum Savings', 16250.00),
            ],
          ),
        ),
      ],
    );
  }

  Widget _transactionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Recent Transactions',
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _buildTransactionCard(
          context,
          Icons.shopping_cart_outlined,
          'Whole Foods Market',
          'Today • 12:45 PM',
          142.30,
          Colors.red,
          isNegative: true,
        ),
        _buildTransactionCard(
          context,
          Icons.shopping_bag_outlined,
          'Salary Deposit',
          'Yesterday • 09:00 AM',
          4200.00,
          Colors.green,
        ),
        _buildTransactionCard(
          context,
          Icons.local_dining,
          'Blue Bottle Coffee',
          'Yesterday • 08:30 AM',
          7.50,
          Colors.red,
          isNegative: true,
        ),
        _buildTransactionCard(
          context,
          Icons.movie_outlined,
          'Netflix Subscription',
          'Oct 20 • 11:20 PM',
          19.99,
          Colors.red,
          isNegative: true,
        ),
        const SizedBox(height: AppSpacing.md),
        DottedBorder(
          borderType: RoundedRectDottedBorder(
            color: Theme.of(context).colorScheme.outline,
            dashGap: 4,
            dashWidth: 4,
            strokeWidth: 2,
            radius: Radius.circular(12),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: Center(
              child: Text(
                'Load More Transactions',
                style: AppTextStyles.body1.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _savingsGoalCard(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.savings_outlined,
                color: Colors.green.shade700,
                size: 24,
              ),
              const SizedBox(width: AppSpacing.sm),
              const Text('Savings Goal', style: AppTextStyles.title2),
              const Spacer(),
              Text(
                '75%',
                style: AppTextStyles.headline3.copyWith(
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'New Car Goal',
            style: AppTextStyles.body1.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: AppSpacing.sm),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 0.75),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) => LinearProgressIndicator(
              value: value,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
                value < 0.75 ? Colors.green.shade400 : Colors.green.shade700,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$0',
                style: AppTextStyles.caption.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                '\$10.000',
                style: AppTextStyles.caption.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _monthlyInsightsCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.insights, color: colorScheme.primary, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Monthly Insight', style: AppTextStyles.title2),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'You spent 12% less on dining out compared to last month!',
                  style: AppTextStyles.body1.copyWith(
                    color: Colors.grey,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.grey.shade400, size: 16),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    double total,
    Color color, {
    isNegative = false,
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
          '${isNegative ? '-' : '+'}\$${total.toStringAsFixed(2)}',
          style: AppTextStyles.title1.copyWith(
            color: isNegative ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCard(String title, String subtitle, double total) {
    return SizedBox(
      width: 300,
      height: 230,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body1.copyWith(color: Colors.white70),
                ),
                const Icon(Icons.contactless, color: Colors.white),
              ],
            ),
            Text(
              subtitle,
              style: AppTextStyles.title1.copyWith(color: Colors.white),
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: 48,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const Spacer(),
            const Text(
              '**** **** **** 8829',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 3,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: AppTextStyles.body2.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: AppTextStyles.headline2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      subtitle,
                      style: AppTextStyles.body1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const Text(
                      'VISA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
