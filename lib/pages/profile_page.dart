import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isObscure = true;
  Color corBorda = Colors.b;

  final TextEditingController controllerLogin = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.6,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 0, 76),
        title: const Text('Olá Mundo mobile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 0, 255, 0),
                          shape: BoxShape.circle,
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
                    const Positioned(
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
              
              Row(children: [
                Expanded(child: GestureDetector(child: Container(color: Colors.red, child: Text("Vermelho")))),
                Expanded(child: GestureDetector(child: Container(color: Colors.green, child: Text("Verde")))),
                Expanded(child: GestureDetector(child: Container(color: Colors.blue, child: Text("Azul"))))
              ],),

                const SizedBox(height: 30),

                const Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 8),
                    Text(
                      "Meu nome:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Text("Lucas Vitorino"),
                const SizedBox(height: 20),

                const Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 8),
                    Text(
                      "Meu e-mail:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Text("lucas@lucas.com"),
                const SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: controllerLogin,
                          decoration: const InputDecoration(
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
                      const SizedBox(height: 20),
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
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: "Senha",
                            focusedBorder: OutlineInputBorder(
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

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print(controllerLogin.text);
                    print(controllerSenha.text);
                  },
                  child: const Text("Realizar Login"),
                ),
                const SizedBox(height: 30),

                const Row(
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
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 0, 76),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Oi",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    print("Cliquei");
                    Navigator.pushNamed(context, "/");
                  },
                  child: const Text("Voltar para Home"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
