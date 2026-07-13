import 'package:flutter/material.dart';
import 'package:flutter_finance/shared/styling.dart';
import 'package:flutter_finance/widgets/app_card.dart';
import 'package:flutter_finance/widgets/section_header.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _searchAndFilterRow(context),
        const SizedBox(height: AppSpacing.sm),
        _filterChips(context),
        const SizedBox(height: AppSpacing.md),
        const SectionHeader(title: 'Today'),
        const SizedBox(height: AppSpacing.md),
        _activityCard(
          context,
          icon: Icons.shopping_bag_outlined,
          title: 'Apple Store',
          subtitle: 'Electronics • 2:45 PM',
          amount: '-\$1,299.00',
          status: 'Completed',
          isPositive: false,
        ),
        _activityCard(
          context,
          icon: Icons.payments_outlined,
          title: 'Salary Deposit',
          subtitle: 'Income • 8:00 AM',
          amount: '+\$4,500.00',
          status: 'Settled',
          isPositive: true,
        ),
        const SizedBox(height: AppSpacing.md),
        const SectionHeader(title: 'Yesterday'),
        const SizedBox(height: AppSpacing.md),
        _activityCard(
          context,
          icon: Icons.local_dining,
          title: 'Blue Bottle Coffee',
          subtitle: 'Food & Drink • 10:15 AM',
          amount: '-\$8.50',
          status: 'Completed',
          isPositive: false,
        ),
        _activityCard(
          context,
          icon: Icons.commute,
          title: 'Uber Technologies',
          subtitle: 'Transport • 7:30 PM',
          amount: '-\$24.12',
          status: 'Pending',
          isPositive: false,
        ),
        const SizedBox(height: AppSpacing.md),
        const SectionHeader(title: 'October 24'),
        const SizedBox(height: AppSpacing.md),
        _activityCard(
          context,
          icon: Icons.business_center_outlined,
          title: 'Amazon.com',
          subtitle: 'Shopping • 11:20 AM',
          amount: '-\$45.99',
          status: 'Completed',
          isPositive: false,
        ),
        _activityCard(
          context,
          icon: Icons.bolt,
          title: 'Pacific Gas & Electric',
          subtitle: 'Bills • 3:00 AM',
          amount: '-\$112.00',
          status: 'Completed',
          isPositive: false,
        ),
      ],
    );
  }

  Widget _searchAndFilterRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search transactions...',
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(48, 48),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Icon(Icons.tune),
        ),
      ],
    );
  }

  Widget _filterChips(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(minimumSize: const Size(60, 36)),
            child: const Text('All'),
          ),
          const SizedBox(width: AppSpacing.sm),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(minimumSize: const Size(60, 36)),
            child: const Text('Expenses'),
          ),
          const SizedBox(width: AppSpacing.sm),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(minimumSize: const Size(60, 36)),
            child: const Text('Income'),
          ),
          const SizedBox(width: AppSpacing.sm),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(minimumSize: const Size(60, 36)),
            child: const Text('Bills'),
          ),
          const SizedBox(width: AppSpacing.sm),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(minimumSize: const Size(60, 36)),
            child: const Text('Transport'),
          ),
        ],
      ),
    );
  }

  Widget _activityCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required String status,
    required bool isPositive,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
        ),
        title: Text(title, style: AppTextStyles.title2),
        subtitle: Text(subtitle, style: AppTextStyles.body2),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: AppTextStyles.title1.copyWith(
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
            Text(
              status,
              style: AppTextStyles.caption.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
