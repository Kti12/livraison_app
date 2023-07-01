import 'package:flutter/material.dart';
import 'package:livreur_app/widgets/pagefournisseur.dart';

import 'components/body.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réglages'),
        backgroundColor: const Color(0xFF1C9521),
        leading: IconButton(
          icon: Image.asset(
            'assets/fonts/back.png',
            width: 20,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageFournisseur()),
            );
          },
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/Images/aisa_rond.png"),
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
