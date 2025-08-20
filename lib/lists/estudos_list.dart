class EstudosList{
  List<String> nameList = ["Lucas", "Paulo", "Penelope", "Naomi"];
  List<int> numberList = [1, 2, 3, 4];

  List<dynamic> mixList = [
    1,
    "Lucas",
    true,
    () {
      print("Imprimiu!");
    },
  ];

  //A lista tem = [a,b,c], contem itens
  //Map tem = {"chave": valor} podendo ter string e valor, se tornando dinamico
  Map<String, dynamic> dadosLucas = {
    "Nome": "Lucas",
    "Idade": 25,
    "Nacionalidade": "Brasileira",
    "Sozinho": true,
  };

  void imprimirLista() {
    print(nameList[0]);

    int cont = 10;
    for (var i = 0; i < nameList.length; i++) {
      print(nameList[i]);
    }

    for (String name in nameList) {
      print(name);
    }
    for (int number in numberList) {
      print(number * 3);
    }
    
    void imprimirLista(){
      print(dadosLucas["nome"]);
      print(dadosLucas["idade"]);
    }
  }
}
