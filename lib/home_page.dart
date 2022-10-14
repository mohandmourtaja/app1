import 'package:assignment_3/dummy.dart';
import 'package:assignment_3/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 85, 34),
        title: const Text('All Categories'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              buildTitle('Shop', const Icon(Icons.shop)),
              buildTitle('Orders', const Icon(Icons.shop)),
              buildTitle('Manage Product', const Icon(Icons.shop)),
              buildTitle('Category', const Icon(Icons.shop)),
              TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LogIn()));
                  },
                  child: const Text('Log out'))
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: GridView(
            children: data
                .map(
                  (e) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('SliderScreen', arguments: {
                        'title': e.title,
                        'img': e.images,
                      });
                    },
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 115, 115, 103),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          e.title,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 222, 75, 75)),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2.3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            )),
      ),
    );
  }

  ListTile buildTitle(String title, Icon i) {
    return ListTile(
      title: Text('$title'),
      leading: i,
    );
  }
}
