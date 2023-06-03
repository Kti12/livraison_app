import 'package:flutter/material.dart';
import 'package:livreur_app/widgets/button.global.dart';
import 'package:livreur_app/widgets/inscription.dart';
import 'package:livreur_app/widgets/social.login.dart';
import 'package:livreur_app/widgets/text.form.global.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController identifiantcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/Images/logo_aisa.png',
                  fit: BoxFit.contain,
                  width: 100,
                  height: 150,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Connecter vous à votre espace',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 25),
              TextFormGlobal(
                  controller: identifiantcontroller,
                  text: 'identifiant',
                  obscure: false,
                  textInputType: TextInputType.text),
              const SizedBox(height: 15),
              TextFormGlobal(
                  controller: passwordcontroller,
                  text: 'Mot de passe',
                  obscure: true,
                  textInputType: TextInputType.text),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Mot de passe oublié',
                        style: TextStyle(color: Color(0xFF1C9521))),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const ButtonGlobal(),
              const SizedBox(height: 25),
              const SocialLogin(),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pas de compte?',
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Inscription()),
                );
              },
              child: const Text('créer-un'),
            ),
          ],
        ),
      ),
    );
  }

  void newMethod() {
    // code à exécuter lorsque le bouton est appuyé
  }
}
