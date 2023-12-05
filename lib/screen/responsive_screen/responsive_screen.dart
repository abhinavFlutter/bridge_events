import 'package:flutter/material.dart';

class ResponsiveScreen11 extends StatelessWidget {
  const ResponsiveScreen11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive App'),
      ),
      body: ResponsiveLayout(
        largeScreen: const Center(child: Text('Large Screen')),
        mediumScreen: const Center(child: Text('Medium Screen')),
        smallScreen: const Center(child: Text('Small Screen')),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  ResponsiveLayout({
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        if (screenWidth > 1200) {
          // Large screen
          return largeScreen;
        } else if (screenWidth > 600) {
          // Medium screen
          return mediumScreen;
        } else {
          // Small screen
          return smallScreen;
        }
      },
    );
  }
}