import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/pagefournisseur.dart';
import 'package:livreur_app/widgets/profile_user/profile.dart';

class Modifier extends StatefulWidget {
  const Modifier({super.key});

  @override
  State<Modifier> createState() => ModifierState();
}

class ModifierState extends State<Modifier> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: GlobalColors.mainColor,
        leading: IconButton(
          icon: Image.asset(
            'assets/fonts/back.png',
            width: 20,
            // Modifier la taille de l'image selon vos besoins
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profil()),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 25, bottom: 5),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                'Valider votre profil',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Stack(children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(0, 10),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/fonts/soro.jpg",
                        ),
                      )),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: GlobalColors.mainColor,
                      ),
                      child: const Image(
                        image: AssetImage("assets/fonts/camera.png"),
                        color: Colors.white,
                      ),
                    ))
              ])),
              const SizedBox(
                height: 35,
              ),
              builTextField("Nom", "Soro", false),
              builTextField("Prénom(s)", "Djeny", false),
              builTextField("Numéro", "0707735698", false),
              builTextField("Email", "Soro@gmail.com", false),
              builTextField("Adresse", "Treichville, palais des sports", false),
              builTextField("Mot de passe", "020305", true),
              builTextField("Confirmation", "020305", true),
              builTextField("Immatriculation_vehicule", "070560FG", false),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PageFournisseur()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1C9521),
                        ),
                        child: const Text(
                          'Annuler',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,

                      /* decoration: BoxDecoration(
                                
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10,
                                  ),
                                ],
                              ), */
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profil()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1C9521),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Modifier',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget builTextField(
      String labelText, String placholder, bool isPasswordTextFiel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextFiel ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextFiel
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      FluentIcons.eye_off_20_regular,
                    ))
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
