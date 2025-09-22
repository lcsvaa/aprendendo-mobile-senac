import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_teste_dia_01_agosto/Models/endereco_model.dart';
import 'package:projeto_teste_dia_01_agosto/services/via_cep_service.dart';
import 'package:projeto_teste_dia_01_agosto/widgets/custom_dialog.dart';

class CepApiPage extends StatefulWidget {
  const CepApiPage({super.key});

  @override
  State<CepApiPage> createState() => _CepApiPage();
}

class _CepApiPage extends State<CepApiPage> {
  final TextEditingController controllerCEP = TextEditingController();

  Endereco? endereco;
  bool isLoading = false;

  ViaCepService viaCepService = ViaCepService();

  @override
  void dispose() {
    controllerCEP.dispose();
    super.dispose();
  }

  Future<void> buscarCep() async {
    setState(() {
      isLoading = true;
      endereco = null;
    });

    if (controllerCEP.text.length != 8) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CustomDialog(
            icon: Icons.warning_amber_rounded,
            title: 'Atenção',
            message: 'O CEP deve conter exatamente 8 dígitos.',
            textButton: 'Tentar Novamente',
            controller: controllerCEP,
          );
        },
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    try {
      final enderecoResposta =
          await viaCepService.buscarEndereco(controllerCEP.text);

      if (enderecoResposta.logradouro != null) {
        setState(() {
          endereco = enderecoResposta;
        });
        return;
      }

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            icon: const Icon(Icons.warning_amber_rounded, size: 80),
            title: const Text('Aviso: Você foi avisado'),
            content: const Text('O CEP informado não foi encontrado.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  controllerCEP.clear();
                },
                child: const Text('Tente novamente'),
              ),
            ],
          );
        },
      );
    } catch (erro) {
      throw Exception('Erro ao buscar CEP: $erro');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.6,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 0, 76),
        title: const Text('Consumo CEP API'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 8,
              keyboardType: TextInputType.number,
              controller: controllerCEP,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: buscarCep,
                  child: isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : const Icon(Icons.search),
                ),
                labelText: "Informe seu CEP",
                hintText: "Ex: 00000000",
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
              ),
            ),
            if (endereco?.logradouro != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Logradouro:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.logradouro!),
                  const SizedBox(height: 8),
                  const Text(
                    "Bairro:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.bairro!),
                  const SizedBox(height: 8),
                  const Text(
                    "Localidade:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.localidade!),
                  const SizedBox(height: 8),
                  const Text(
                    "Estado:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(endereco!.estado!),
                  const SizedBox(height: 8),
                  const Text(
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
