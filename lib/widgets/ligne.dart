// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livreur_app/widgets/map.dart';
import 'package:livreur_app/widgets/new.dart';
import 'package:livreur_app/widgets/pagefournisseur.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:livreur_app/widgets/profile_user/profile.dart';

class RoundButton extends StatelessWidget {
   const RoundButton({
    super.key,
  });
  

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AISA livreur'),
          backgroundColor: const Color(0xFF1C9521),
          leading: const Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/Images/aisa_rond.png"),
            ),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/fonts/profile.svg',
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profil()),
                );
                // Action to perform when the profile icon is pressed
              },
            ),
          ],
        ),
        body: Column(children: [
          Expanded(
            child: Stack(children: [
              const Map(),
             
              Align(
                alignment: Alignment.bottomRight,
              
                // Positionne le bouton en bas à droite
                child: AnimatedButton(
                  width: 100,
                  height: 50,
                  text: 'Fin',
                  onPress: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const New()));
                  },
                  gradient: const LinearGradient(colors: [Color(0xFF1C9521),Colors.blue]),
                  selectedGradientColor: const LinearGradient(colors: [Color.fromARGB(255, 78, 178, 254),Colors.purple]),
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.RIGHT_BOTTOM_ROUNDER,
                  isReverse: true,
                  borderColor: Colors.black,
                  borderRadius: 20.0,
                  
                  
                  /* onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageFournisseur()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                  child: const Text(
                    'fin',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ), */
                ),
              ),
            ]),
          ),
        ]));
  }
}
