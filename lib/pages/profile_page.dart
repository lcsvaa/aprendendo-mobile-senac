import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.6,
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
        backgroundColor: const Color.fromARGB(255, 255, 0, 76) ,
        title: Text('Olá Mundo mobile'),
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
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 0, 76),
                          shape: BoxShape.circle,
                    
                        ),
                        child: ClipOval(
                          child: Image.network(
                            width: 100,
                            fit: BoxFit.cover,
                            
                            "https://mir-s3-cdn-cf.behance.net/user/115/12600c1976196065.67f5b6cf4b752.jpg"
                            ),
                        ),
                      ),
                    ),

                    Positioned(
                      right: 130,
                      bottom: 5,
                      child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle), 
                      child: Icon(Icons.camera),),
                      ),
                  ],
                ),
            
                SizedBox(height: 30),
                
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    Text("Meu nome:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                  ],
                ), Text("Lucas Vitorino"),
                SizedBox(height: 20), 
            
                Row(
                  children: [
                    Icon(Icons.email),
                    Text(
                      "Meu e-mail:", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ) ,),
                  ],
                ), Text("lucas@lucas.com"),
                SizedBox(height: 20),
                
                Row(
                  children: [
                    Icon(Icons.fingerprint),
                    Text("Bio", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold ),),SizedBox(height: 50), 
                  ],
                ), 
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 0, 76), 
                    borderRadius:BorderRadius.circular(10)),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempus justo et felis pretium viverra. Vestibulum ut vestibulum arcu. Curabitur egestas auctor enim vitae tristique. Duis a eros euismod urna efficitur tempus et non purus. Ut elementum, ligula sed molestie tristique, risus velit lacinia mauris, eget sodales tortor mauris nec elit. Quisque eget ullamcorper velit. Maecenas posuere nisi nec est fringilla, id convallis nisl luctus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam mi urna, dictum at risus vitae, aliquet tempor magna. In vitae enim nisi. Donec id felis tristique, sagittis libero quis, laoreet dui. Vestibulum facilisis ligula quis augue facilisis, ac accumsan diam egestas.Curabitur eleifend arcu in nisi mollis, gravida auctor eros auctor. Nullam porta mauris a neque congue, sed feugiat orci facilisis. Nunc vel ullamcorper velit. Maecenas commodo metus vel velit facilisis faucibus. Sed nibh mi, accumsan et enim et, gravida auctor velit. Suspendisse suscipit volutpat ante id euismod. Maecenas aliquam libero tempor porta tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pulvinar lorem ut malesuada vulputate. Sed et erat enim. Nunc non porttitor ex. Phasellus congue lacinia venenatis. Nullam sit amet congue dui, ultrices pulvinar ipsum. Praesent ac lobortis justo. Mauris porttitor laoreet dolor vel gravida.",         style: TextStyle(color: Colors.white))), 
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black), 
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                      onPressed: () {
                        print("Cliquei");
                        Navigator.pushNamed(context, "/");
                      }, 
                      child: Text("Voltar para Home"),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}