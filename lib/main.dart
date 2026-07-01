import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotted_border/flutter_dotted_border.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Finance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/accounts',
          name: 'accounts',
          builder: (context, state) => const AccountsScreen(),
        ),
        GoRoute(
          path: '/activity',
          name: 'activity',
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: '/insights',
          name: 'insights',
          builder: (context, state) => const InsightsScreen(),
        ),
      ],
    ),
  ],
);

class AppScaffold extends StatefulWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('FlutterFinance'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
          switch (index) {
            case 0:
              context.goNamed('home');
            case 1:
              context.goNamed('accounts');
            case 2:
              context.goNamed('activity');
            case 3:
              context.goNamed('insights');
          }
        },
        selectedIndex: _currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_balance),
            icon: Icon(Icons.account_balance_outlined),
            label: 'Accounts',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.receipt_long),
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Activity',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.insights),
            icon: Icon(Icons.insights_outlined),
            label: 'Insights',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: widget.child,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _balanceSummary(),
        SizedBox(height: 16),
        _quickActions(),
        SizedBox(height: 16),
        _accountsSection(),
        SizedBox(height: 16),
        _transactionsSection(),
        SizedBox(height: 16),
        _savingsGoalCard(),
        SizedBox(height: 16),
        _monthlyInsightsCard(),
      ],
    );
  }

  Widget _balanceSummary() {
    return Center(
      child: Column(
        children: [
          const Text(
            'TOTAL BALANCE',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Text(
            '\$48,290.45',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.trending_up, color: Colors.green),
              const SizedBox(width: 4),
              const Text(
                '+2.4% from last month',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickActions() {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined),
            label: const Text('Send'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.request_quote_outlined),
            label: const Text('Request'),
          ),
        ),
      ],
    );
  }

  Widget _accountsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Your Accounts',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildAccountCard(
                'Savings Account',
                'Platinum Savings',
                32040.00,
              ),
              _buildAccountCard('Daily Savings', 'Platinum Savings', 16250.00),
            ],
          ),
        ),
      ],
    );
  }

  Widget _transactionsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
          ],
        ),

        const SizedBox(height: 16),

        _buildTransactionCard(
          Icons.shopping_cart_outlined,
          'Whole Foods Market',
          'Today • 12:45 PM',
          142.30,
          Colors.red,
          isNegative: true,
        ),

        _buildTransactionCard(
          Icons.shopping_bag_outlined,
          'Salary Deposit',
          'Yesterday • 09:00 AM',
          4200.00,
          Colors.green,
        ),

        _buildTransactionCard(
          Icons.local_dining,
          'Blue Bottle Coffee',
          'Yesterday • 08:30 AM',
          7.50,
          Colors.red,
          isNegative: true,
        ),

        _buildTransactionCard(
          Icons.movie_outlined,
          'Netflix Subscription',
          'Oct 20 • 11:20 PM',
          19.99,
          Colors.red,
          isNegative: true,
        ),

        const SizedBox(height: 16),

        DottedBorder(
          borderType: RoundedRectDottedBorder(
            color: Colors.grey,
            dashGap: 4,
            dashWidth: 4,
            strokeWidth: 2,
            radius: Radius.circular(12),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: const Text('Load More Transactions')),
            ),
          ),
        ),
      ],
    );
  }

  Widget _savingsGoalCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.savings_outlined, color: Colors.green),
            const SizedBox(height: 8),
            const Text(
              'Savings Goal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('New Car Goal: 75% achieved'),
            const SizedBox(height: 4),
            LinearProgressIndicator(value: 0.75, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _monthlyInsightsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.insights),
            const SizedBox(height: 16),
            const Text(
              'Monthly Insight',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'You spent 12% less on dining out compared to last month!',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(
    IconData icon,
    String title,
    String subtitle,
    double total,
    Color color, {
    isNegative = false,
  }) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          '${isNegative ? '-' : '+'}\$$total',
          style: TextStyle(color: color),
        ),
      ),
    );
  }

  Widget _buildAccountCard(String title, String subtitle, double total) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const Icon(Icons.paid_outlined),
                ],
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 22),

              const Text(
                '**** 8829',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),

              const SizedBox(height: 22),

              Text(
                '\$${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _netWorthCard(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Linked Accounts',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('4 active connections'),
          ],
        ),
        const SizedBox(height: 16),
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
        const SizedBox(height: 16),
        _weeklyInsightCard(),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_circle_outline),
          label: const Text('Link New Account'),
        ),
      ],
    );
  }

  Widget _netWorthCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Net Worth'),
            const Text('\$124,592.00'),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_upward),
                      const Text('2.4% this month'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.shield_outlined),
                      const Text('Encrypted'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(child: Icon(icon)),
                Text(
                  status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(title),
            const SizedBox(height: 4),
            Text(bank, style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(
              balance,
              style: TextStyle(color: isPositive ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weeklyInsightCard() {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: const Icon(Icons.insights)),
        title: const Text('Weekly Spending Insight'),
        subtitle: const Text("You've saved 12% more than last week."),
      ),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _searchAndFilterRow(),
        const SizedBox(height: 8),
        _filterChips(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Today', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 16),
        _activityCard(
          icon: Icons.shopping_bag_outlined,
          title: 'Apple Store',
          subtitle: 'Electronics • 2:45 PM',
          amount: '-\$1,299.00',
          status: 'Completed',
          isPositive: false,
        ),
        _activityCard(
          icon: Icons.payments_outlined,
          title: 'Salary Deposit',
          subtitle: 'Income • 8:00 AM',
          amount: '+\$4,500.00',
          status: 'Settled',
          isPositive: true,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Yesterday',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _activityCard(
          icon: Icons.local_dining,
          title: 'Blue Bottle Coffee',
          subtitle: 'Food & Drink • 10:15 AM',
          amount: '-\$8.50',
          status: 'Completed',
          isPositive: false,
        ),
        _activityCard(
          icon: Icons.commute,
          title: 'Uber Technologies',
          subtitle: 'Transport • 7:30 PM',
          amount: '-\$24.12',
          status: 'Pending',
          isPositive: false,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'October 24',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _activityCard(
          icon: Icons.business_center_outlined,
          title: 'Amazon.com',
          subtitle: 'Shopping • 11:20 AM',
          amount: '-\$45.99',
          status: 'Completed',
          isPositive: false,
        ),
        _activityCard(
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

  Widget _searchAndFilterRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search transactions...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.tune)),
      ],
    );
  }

  Widget _filterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilledButton(onPressed: () {}, child: const Text('All')),
          const SizedBox(width: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Expenses')),
          const SizedBox(width: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Income')),
          const SizedBox(width: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Bills')),
          const SizedBox(width: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Transport')),
        ],
      ),
    );
  }

  Widget _activityCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required String status,
    required bool isPositive,
  }) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: TextStyle(color: isPositive ? Colors.green : Colors.red),
            ),
            Text(status, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Financial Insights',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text('Detailed analysis of your June 2026 spending.'),
        const SizedBox(height: 16),
        _timePeriodButtons(),
        const SizedBox(height: 16),
        _spendingByCategoryCard(),
        _cashFlowAnalysisCard(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Budget Goals',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _budgetGoalCard(
          icon: Icons.shopping_cart_outlined,
          title: 'Groceries',
          subtitle: '82% of \$600',
          remaining: '\$492 left',
        ),
        _budgetGoalCard(
          icon: Icons.movie_outlined,
          title: 'Entertainment',
          subtitle: '45% of \$300',
          remaining: '\$135 left',
        ),
        _budgetGoalCard(
          icon: Icons.shopping_cart_outlined,
          title: 'Utilities',
          subtitle: '98% of \$450',
          remaining: '\$9 left',
        ),
        const SizedBox(height: 16),
        _savingsMomentumCard(),
      ],
    );
  }

  Widget _timePeriodButtons() {
    return Row(
      children: [
        FilledButton(onPressed: () {}, child: const Text('Monthly')),
        OutlinedButton(onPressed: () {}, child: const Text('Quarterly')),
        OutlinedButton(onPressed: () {}, child: const Text('Yearly')),
      ],
    );
  }

  Widget _spendingByCategoryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Spending by Category'),
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
                  children: const [
                    Text(
                      '\$4,280',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'TOTAL SPENT',
                      style: TextStyle(color: Colors.grey, letterSpacing: 1),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const Text('Housing'),
                const Spacer(),
                const Text('40%'),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const Text('Lifestyle'),
                const Spacer(),
                const Text('25%'),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const Text('Travel'),
                const Spacer(),
                const Text('15%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cashFlowAnalysisCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Cash Flow Analysis',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Text('Income', style: TextStyle(color: Colors.green)),
                const SizedBox(width: 4),
                const Text('Expense', style: TextStyle(color: Colors.red)),
              ],
            ),

            const SizedBox(height: 16),

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
                              style: const TextStyle(
                                fontSize: 14,
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
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    // Income Line
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
                    // Expense Line
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
                            TextStyle(
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
      ),
    );
  }

  Widget _budgetGoalCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String remaining,
  }) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(remaining),
      ),
    );
  }

  Widget _savingsMomentumCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Savings Momentum',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "You've saved 12% more than last month. Keep this pace to reach your 'Vacation Fund' goal 2 months earlier.",
            ),
            const SizedBox(height: 8),
            FilledButton(onPressed: () {}, child: const Text('Boost Savings')),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      '\$12,450',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const Text('Saved this year'),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    const Text(
                      '+8.4%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('avg. Monthly ROI'),
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
