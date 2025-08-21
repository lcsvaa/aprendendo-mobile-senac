import 'package:flutter/material.dart';
import 'package:projeto_teste_dia_01_agosto/lists/app_list.dart';
import 'package:projeto_teste_dia_01_agosto/services/shared_preferences_service..dart';
import 'package:projeto_teste_dia_01_agosto/widgets/custom_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DadosUserPage extends StatefulWidget {
  const DadosUserPage({super.key});

  @override
  State<DadosUserPage> createState() => _DadosUserPageState();
}

class _DadosUserPageState extends State<DadosUserPage> {
  bool isObscure = true;
  Color corBorda = Colors.black;

  String? login; //variavel login
  String? senha; //variavel senha

  @override //criado dentro do statulwidget
  initState() {
    //metodo do proprio flutter
    super.initState(); //herda o metodo do pai

    loadSharedPreference();
  }

  void loadSharedPreference() async {
    String? loginStorage = await SharedPreferencesService.getStringLocalStorage("login",
    );
    String? senhaStorage = await SharedPreferencesService.getStringLocalStorage("senha",
    );
    setState(() async {
      login = loginStorage;
      senha = senhaStorage;
    });
  }

  final TextEditingController controllerLogin = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.6,
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 255, 0, 76),
        title: Text('Dados User'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            //?? = Null safety
            Text(login ?? "Não há de login"),
            Text(senha ?? "Não há dados da senha"),
          ],
        ),
      ),
    );
  }
}
