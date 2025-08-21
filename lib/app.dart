import 'package:flutter/material.dart';
import 'package:projeto_teste_dia_01_agosto/pages/dados_user_page.dart';
import 'package:projeto_teste_dia_01_agosto/pages/home_page.dart';
import 'package:projeto_teste_dia_01_agosto/pages/profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/perfil",
      routes: {
        "/": (context) => HomePage(),
        "/perfil": (context) => ProfilePage(),
        "/dadosUsuario": (context) => DadosUserPage(),
      },

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // home: const ProfilePage(),
    );
  }
}
