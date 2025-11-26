import 'package:flutter/material.dart';
import 'package:pithy_dart/pithy_dart.dart';
import 'pages/home_page.dart';
import 'test_responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Pithy Dart 示例',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePageWithTest(),
        );
      },
    );
  }
}

class HomePageWithTest extends StatelessWidget {
  const HomePageWithTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePage(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TestResponsivePage()),
          );
        },
        icon: const Icon(Icons.science),
        label: const Text('测试响应式'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
