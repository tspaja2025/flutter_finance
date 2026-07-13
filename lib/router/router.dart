import 'package:flutter_finance/screens/accounts_screen.dart';
import 'package:flutter_finance/screens/activity_screen.dart';
import 'package:flutter_finance/screens/home_screen.dart';
import 'package:flutter_finance/screens/insights_screen.dart';
import 'package:flutter_finance/shared/app_scaffold.dart';
import 'package:go_router/go_router.dart';

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
