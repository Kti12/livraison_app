// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/social.login.dart';
import 'package:livreur_app/widgets/text.form.global.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  InscriptionState createState() => InscriptionState();
}

class InscriptionState extends State<Inscription> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController matriculEnginController = TextEditingController();
  final TextEditingController cniController = TextEditingController();
  final TextEditingController casierController = TextEditingController();
  final TextEditingController permisController = TextEditingController();

  DateTime? selectedDate;
  String? selectedPhoto;
  String selectedOption = '';
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void uploadPhoto() {}

  void uploadFile() {
    // Logique pour télécharger un fichier
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    'assets/Images/logo_aisa.png',
                    fit: BoxFit.contain,
                    width: 100,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Créez un nouveau compte',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 25),
                TextFormGlobal(
                  controller: nomController,
                  text: 'Nom',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 25),
                TextFormGlobal(
                  controller: prenomController,
                  text: 'Prénoms',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 25),
                TextFormGlobal(
                  controller: numeroController,
                  text: 'Numero',
                  obscure: false,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: adresseController,
                  text: 'Adresse',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Mot de passe',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: confirmPasswordController,
                  text: 'Confirmer le mot de passe',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: matriculEnginController,
                  text: 'Immatriculation_vehicule',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    uploadPhoto();
                   
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,   // Couleur de fond du bouton
                    foregroundColor: Colors.white,  // Couleur du texte du bouton
  ),
                  child: const Text('télécharger votre permis'),
                ),const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    uploadPhoto();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,   // Couleur de fond du bouton
                    foregroundColor: Colors.white,  // Couleur du texte du bouton
  ),
                  child: const Text('télécharger votre CNI'),
                ),const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    uploadPhoto();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,   // Couleur de fond du bouton
                    foregroundColor: Colors.white,  // Couleur du texte du bouton
  ),
                  child: const Text('télécharger votre casier_judiciaire'),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () => selectDate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,   // Couleur de fond du bouton
                    foregroundColor: Colors.white,  // Couleur du texte du bouton
  ),
                  child: const Text(
                      'Sélectionner une date pour la finalisation de votre inscription'),
                ),
                const SizedBox(height: 16),
                Text(
                  selectedDate != null
                      ? 'Date sélectionnée : ${selectedDate!.toString()}'
                      : 'Aucune date sélectionnée',
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    print('Bienvenue');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
