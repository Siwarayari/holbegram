import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:holbegram/widgets/bottom_nav.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BottomNav();
  }
}
