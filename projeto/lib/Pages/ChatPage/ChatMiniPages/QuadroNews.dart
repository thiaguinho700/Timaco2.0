import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class QuadroNews extends StatefulWidget {
  const QuadroNews({super.key});

  @override
  State<QuadroNews> createState() => _QuadroNewsState();
}

class _QuadroNewsState extends State<QuadroNews> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Quadro news"),
    );
  }
}