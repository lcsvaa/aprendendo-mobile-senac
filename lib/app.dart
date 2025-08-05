import 'package:flutter/material.dart';
import 'package:projeto_teste_dia_01_agosto/pages/home_page.dart';
import 'package:projeto_teste_dia_01_agosto/pages/profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 77, 0, 25)),
      ),
      home: const ProfilePage(),
    );
  }
}
