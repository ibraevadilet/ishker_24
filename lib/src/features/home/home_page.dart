import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('Home Page')),
          SliverFillRemaining(child: Center(child: Text('Home Page')))
        ],
      ),
    );
  }
}
