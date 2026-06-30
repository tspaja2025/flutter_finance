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
        leading: CircleAvatar(child: const Icon(Icons.person_outline)),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: widget.child,
          ),
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
        Center(
          child: Column(
            children: [
              const Text(
                'TOTAL BALANCE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
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
        ),

        const SizedBox(height: 16),

        Row(
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
        ),

        const SizedBox(height: 16),

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
              SizedBox(
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
                            const Text(
                              'Savings Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const Icon(Icons.paid_outlined),
                          ],
                        ),
                        const Text(
                          'Platinum Savings',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
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

                        const Text(
                          '\$32,040.00',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
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
                            const Text(
                              'Daily Savings',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const Icon(Icons.paid_outlined),
                          ],
                        ),
                        const Text(
                          'Platinum Savings',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
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

                        const Text(
                          '\$16,250.00',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

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

        const SizedBox(height: 16),

        Card(
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
        ),

        const SizedBox(height: 16),

        Card(
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
        ),
      ],
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
}

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
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
        ),

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

        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(child: const Icon(Icons.account_balance)),
                    const Text(
                      'Synced',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Main Checking'),
                const SizedBox(height: 4),
                const Text(
                  'Chase Bank',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text('\$14,240.50'),
              ],
            ),
          ),
        ),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(child: const Icon(Icons.credit_card_outlined)),
                    const Text(
                      'Updating',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Platinum Card'),
                const SizedBox(height: 4),
                const Text(
                  'American Express',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text('-\$2,140.50', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(child: const Icon(Icons.savings_outlined)),
                    const Text(
                      'Synced',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Emergency Fund'),
                const SizedBox(height: 4),
                const Text(
                  'Ally Financial',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  '-\$82,000.00',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
        ),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(child: const Icon(Icons.wallet_outlined)),
                    const Text(
                      'Synced',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Crypto Wallet'),
                const SizedBox(height: 4),
                const Text(
                  'Coinbase',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text('\$30,491.50'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        Card(
          child: ListTile(
            leading: CircleAvatar(child: const Icon(Icons.insights)),
            title: const Text('Weekly Spending Insight'),
            subtitle: const Text("You've saved 12% more than last week."),
          ),
        ),

        const SizedBox(height: 16),

        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_circle_outline),
          label: const Text('Link New Account'),
        ),
      ],
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
        Row(
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
        ),

        const SizedBox(height: 8),

        SingleChildScrollView(
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
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Today', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),

        const SizedBox(height: 16),

        Card(
          child: ListTile(
            leading: CircleAvatar(
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            title: const Text('Apple Store'),
            subtitle: const Text('Electronics • 2:45 PM'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('-\$1,299.00', style: TextStyle(color: Colors.red)),
                const Text('Completed', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: CircleAvatar(child: const Icon(Icons.payments_outlined)),
            title: const Text('Salary Deposit'),
            subtitle: const Text('Income • 8:00 AM'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '+\$4,500.00',
                  style: TextStyle(color: Colors.green),
                ),
                const Text('Settled', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
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

        Card(
          child: ListTile(
            leading: CircleAvatar(child: const Icon(Icons.local_dining)),
            title: const Text('Blue Bottle Coffee'),
            subtitle: const Text('Food & Drink • 10:15 AM'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('-\$8.50', style: TextStyle(color: Colors.red)),
                const Text('Completed', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: CircleAvatar(child: const Icon(Icons.commute)),
            title: const Text('Uber Technologies'),
            subtitle: const Text('Transport • 7:30 PM'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('-\$24.12', style: TextStyle(color: Colors.red)),
                const Text('Pending', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
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

        Card(
          child: ListTile(
            leading: CircleAvatar(
              child: const Icon(Icons.business_center_outlined),
            ),
            title: const Text('Amazon.com'),
            subtitle: const Text('Shopping • 11:20 AM'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('-\$45.99', style: TextStyle(color: Colors.red)),
                const Text('Completed', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),

        Card(
          child: ListTile(
            leading: CircleAvatar(child: const Icon(Icons.bolt)),
            title: const Text('Pacific Gas & Electric'),
            subtitle: const Text('Bills • 3:00 AM'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('-\$112.00', style: TextStyle(color: Colors.red)),
                const Text('Completed', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
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

        Row(
          children: [
            FilledButton(onPressed: () {}, child: const Text('Monthly')),
            OutlinedButton(onPressed: () {}, child: const Text('Quarterly')),
            OutlinedButton(onPressed: () {}, child: const Text('Yearly')),
          ],
        ),

        const SizedBox(height: 16),

        Card(
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
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1,
                          ),
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
        ),

        Card(
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
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
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
                            colors: [
                              Colors.green.shade400,
                              Colors.green.shade700,
                            ],
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
        ),

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

        Card(
          child: ListTile(
            leading: CircleAvatar(
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            title: const Text('Groceries'),
            subtitle: const Text('82% of \$600'),
            trailing: const Text('\$492 left'),
          ),
        ),

        Card(
          child: ListTile(
            leading: CircleAvatar(child: const Icon(Icons.movie_outlined)),
            title: const Text('Entertainment'),
            subtitle: const Text('45% of \$300'),
            trailing: const Text('\$135 left'),
          ),
        ),

        Card(
          child: ListTile(
            leading: CircleAvatar(
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            title: const Text('Utilities'),
            subtitle: const Text('98% of \$450'),
            trailing: const Text('\$9 left'),
          ),
        ),

        const SizedBox(height: 16),

        Card(
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
                FilledButton(
                  onPressed: () {},
                  child: const Text('Boost Savings'),
                ),
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
        ),
      ],
    );
  }
}
