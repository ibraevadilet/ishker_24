import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('SignUp Page')),
          SliverFillRemaining(child: Center(child: Text('SignUp Page')))
        ],
      ),
    );
  }
}
