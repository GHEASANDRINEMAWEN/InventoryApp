import 'package:flutter/material.dart';
import 'package:stock_management/main.dart';
import 'package:stock_management/screens/alarm.dart';
import 'package:stock_management/screens/history.dart';
import 'package:stock_management/screens/notes.dart';
import 'package:stock_management/screens/sales_form.dart';
import 'package:stock_management/screens/splash.dart';
import 'package:stock_management/screens/view_stock.dart';
import 'package:stock_management/screens/sales.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());

      case '/splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/sales.dart':
        return MaterialPageRoute(builder: (_) => const SalesScreen());
      case '/sales_form':
        return MaterialPageRoute(builder: (_) => const SalesForm());
      case '/view_stock':
      return MaterialPageRoute(builder: (_) => const ViewStock());
      case '/notes':
        return MaterialPageRoute(builder: (_) => const Notes());
      case '/calendar':
        return MaterialPageRoute(builder: (_) => const Calendar());
      default:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
    }
  }
}
