import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text("Andres Rivera"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(240, 208, 255, 232),
        actions: <Widget>[
          InkWell(
            onTap: null,
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {},
            ),
          ),
          InkWell(
            onTap: null,
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(146, 22, 70, 55),
              ),
              accountName: Text('Andres Rivera'),
              accountEmail: Text('a.22308051281295@cbtis128.edu.mx'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 255, 247, 247),
                  backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/AndresRivera111/imagenes-para-APP-flutter-6J/refs/heads/main/employee.png',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
              },
              child: ListTile(
                onTap: (){Navigator.popAndPushNamed(context, "/home");},
                leading: Icon(Icons.home, color:const Color.fromARGB(146, 22, 70, 55)),
                title: Text("Inicio"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
