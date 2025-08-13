import 'package:flutter/material.dart';
import 'package:projeto_teste_dia_01_agosto/widgets/custom_title.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isObscure = true;
  Color corBorda = Colors.black;

  

  final TextEditingController controllerLogin = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.6,
        foregroundColor: Colors.black,
        backgroundColor:  Color.fromARGB(255, 255, 0, 76),
        title:  Text('Olá Mundo mobile'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        padding:  EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: corBorda, width: 4),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            "https://mir-s3-cdn-cf.behance.net/user/115/12600c1976196065.67f5b6cf4b752.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                     Positioned(
                      right: 130,
                      bottom: 5,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera, size: 18),
                      ),
                    ),
                  ],
                ),

                 SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            corBorda = Colors.red;
                          });
                        },
                        child: Container(
                          color: Colors.red,
                          padding:  EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child:  Text(
                            "Vermelho",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            corBorda = Colors.green;
                          });
                        },
                        child: Container(
                          color: Colors.green,
                          padding:  EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child:  Text(
                            "Verde",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            corBorda = Colors.blue;
                          });
                        },
                        child: Container(
                          color: Colors.blue,
                          padding:  EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child:  Text(
                            "Azul",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                 SizedBox(height: 30),

                CustomTitle(title: "Meu nome", icon: Icons.person_3, subtitle: "Lucas"),
                 SizedBox(height: 20),

                 CustomTitle(title: "Meu email", icon: Icons.mail, subtitle: "lucas@lucas.com"),
                 SizedBox(height: 20),

                 CustomTitle(title: "Meu cargo", icon: Icons.business, subtitle: "Estudante"),
                 SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: controllerLogin,
                          decoration:  InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: "Login",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 0, 76),
                              ),
                            ),
                          ),
                        ),
                      ),
                       SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          obscureText: isObscure,
                          controller: controllerSenha,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Icon(
                                isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            labelStyle:  TextStyle(color: Colors.black),
                            labelText: "Senha",
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 0, 76),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                 SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print(controllerLogin.text);
                    print(controllerSenha.text);
                  },
                  child:  Text("Realizar Login"),
                ),
                 SizedBox(height: 30),

                 Row(
                  children: [
                    Icon(Icons.fingerprint),
                    SizedBox(width: 8),
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 10),
                Container(
                  padding:  EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 255, 0, 76),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Text(
                    "Oi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                 SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    print("Cliquei");
                    Navigator.pushNamed(context, "/");
                  },
                  child:  Text("Voltar para Home"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
