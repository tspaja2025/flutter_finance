import 'package:flutter/material.dart';
import 'package:flutter_finance/shared/styling.dart';
import 'package:flutter_finance/widgets/app_card.dart';
import 'package:flutter_finance/widgets/section_header.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _netWorthCard(context),
        const SizedBox(height: AppSpacing.xl),
        SectionHeader(
          title: 'Linked Accounts',
          trailing: Text(
            '4 active connections',
            style: AppTextStyles.body2.copyWith(color: Colors.grey),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _linkedAccountCard(
          icon: Icons.account_balance,
          title: 'Main Checking',
          bank: 'Chase Bank',
          balance: '\$14,240.50',
          status: 'Synced',
          statusColor: Colors.green,
          isPositive: true,
        ),
        _linkedAccountCard(
          icon: Icons.credit_card_outlined,
          title: 'Platinum Card',
          bank: 'American Express',
          balance: '-\$2,140.50',
          status: 'Updating',
          statusColor: Colors.grey,
          isPositive: false,
        ),
        _linkedAccountCard(
          icon: Icons.savings_outlined,
          title: 'Emergency Fund',
          bank: 'Ally Financial',
          balance: '\$82,000.00',
          status: 'Synced',
          statusColor: Colors.green,
          isPositive: true,
        ),
        _linkedAccountCard(
          icon: Icons.wallet_outlined,
          title: 'Crypto Wallet',
          bank: 'Coinbase',
          balance: '\$30,491.50',
          status: 'Synced',
          statusColor: Colors.green,
          isPositive: true,
        ),
        const SizedBox(height: AppSpacing.md),
        _weeklyInsightCard(context),
        const SizedBox(height: AppSpacing.md),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_circle_outline),
          label: const Text('Link New Account'),
        ),
      ],
    );
  }

  Widget _netWorthCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_balance_wallet_outlined,
                size: 20,
                color: Colors.white54,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'TOTAL NET WORTH',
                style: AppTextStyles.label.copyWith(color: Colors.white54),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '\$124,592.00',
            style: AppTextStyles.headline1.copyWith(
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.green.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.trending_up,
                      size: 18,
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      '+2.4%',
                      style: AppTextStyles.body1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      'this month',
                      style: AppTextStyles.body2.copyWith(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.shield,
                      size: 18,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      'Encrypted',
                      style: AppTextStyles.body1.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _linkedAccountCard({
    required IconData icon,
    required String title,
    required String bank,
    required String balance,
    required String status,
    required Color statusColor,
    required bool isPositive,
  }) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: statusColor, size: 24),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.title2),
                    Text(
                      bank,
                      style: AppTextStyles.body2.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: statusColor,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      status,
                      style: AppTextStyles.caption.copyWith(
                        fontWeight: FontWeight.w500,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    balance,
                    style: AppTextStyles.headline3.copyWith(
                      color: isPositive ? Colors.green[700] : Colors.red[700],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weeklyInsightCard(BuildContext context) {
    return AppCard(
      child: ListTile(
        leading: CircleAvatar(
          child: const Icon(Icons.insights, color: Colors.white),
        ),
        title: const Text(
          'Weekly Spending Insight',
          style: AppTextStyles.title2,
        ),
        subtitle: Text(
          "You've saved 12% more than last week.",
          style: AppTextStyles.body1.copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
