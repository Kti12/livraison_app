// ignore_for_file: non_constant_identifier_names, unnecessary_const, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/profile_user/components/body_screen.dart';


import '../modifier.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ProfilePic(),
      const SizedBox(height: 20),
      ProfilMenu(
        text: 'Mon compte',
        icon: 'assets/fonts/profile.svg',
        press: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Modifier()),
            );
        },
        hasImage: true,
      ),
      ProfilMenu(
        text: 'Mes livraisons',
        icon: 'assets/fonts/give.svg',
        press: () {},
        hasImage: true,
      ),
      ProfilMenu(
        text: 'Mes fonds',
        icon: 'assets/fonts/money.svg',
        press: () {},
        hasImage: true,
      ),
      ProfilMenu(
        text: 'Aide',
        icon: 'assets/fonts/help.svg',
        press: () {},
        hasImage: true,
      ),
      ProfilMenu(
        text: 'Paramètres',
        icon: 'assets/fonts/setting.svg',
        press: () {}, 
        hasImage: true,
      ),
      ProfilMenu(
        text: 'Deconnexion',
        icon: 'assets/fonts/log_out.svg',
        press: () {
          
        },
        hasImage: true,
      ),
    ]);
  }
}

class ProfilMenu extends StatelessWidget {
  const ProfilMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.press, required this.hasImage,
  });
  final String text, icon;
  final VoidCallback press;
  final bool hasImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: const BoxDecoration(
              // Specify the shape as BoxShape.circle
              color: Color.fromARGB(
                  255, 225, 239, 226), // Background color of the button
            ),
            child: TextButton(
              onPressed: press,
              // Action to perform when the button is pressed

              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(
                    0), // Remove any padding within the button
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 22,
                    color: GlobalColors.mainColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    
                    
                  ),
                  if(hasImage) // Vérifier si l'image doit être affichée
                      Image.asset(
                        'assets/fonts/next.png',
                        width: 20,
                      ),
                  
                ],
              ),
            ),
          ),
        ));
  }
}
