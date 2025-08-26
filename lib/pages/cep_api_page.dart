import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_teste_dia_01_agosto/Models/endereco_model.dart';
import 'package:projeto_teste_dia_01_agosto/services/via_cep_service.dart';

class CepApiPage extends StatefulWidget {
  const CepApiPage({super.key});

  @override
  State<CepApiPage> createState() => _CepApiPage();
}

class _CepApiPage extends State<CepApiPage> {
  final TextEditingController controllerCEP = TextEditingController();

  Endereco? endereco;

  ViaCepService viaCepService = ViaCepService();

  @override
  void dispose() {
    controllerCEP.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.6,
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 255, 0, 76),
        title: Text('Consumo CEP API'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 8,
              keyboardType:
                  TextInputType.number, // Tipo de infomação que ira no campo
              controller: controllerCEP,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    dynamic enderecoResposta = await viaCepService
                        .buscarEndereco(controllerCEP.text);
                    if (enderecoResposta is Endereco) {
                      setState(() {
                        endereco = enderecoResposta;
                      });
                    }
                  },
                  child: Icon(Icons.search),
                ),
                labelText: "Informe seu CEP",
                hintText: "Ex: 00000-00",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            if (endereco != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Logradouro:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.logradouro!),
                  Text(
                    "Bairro:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.bairro!),
                  Text(
                    "Localidade:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.localidade!),
                  Text(
                    "Estado:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.estado!),
                  Text(
                    "Região:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.regiao!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
