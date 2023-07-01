// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/map.dart';

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
            icon: const Icon(FluentIcons.settings_32_regular),
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
            Padding(padding: const EdgeInsets.only(bottom: 25)),
            Align(
              alignment: Alignment.bottomRight,

              // Positionne le bouton en bas à droite
              child: AnimatedButton(
                width: 100,
                
                height: 50,
                text: 'Fin',
                onPress: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      )),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              const Text(
                                'Nouvelle Livraison',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text('Fournisseur: Treichville arras2',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 20),
                              const Text('Client: Yopougon Maroc Kimi',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 20),
                              const Text('Montant: 5000f',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 50),
                              const Padding(padding: EdgeInsets.all(5)),
                              Row(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          topLeft: Radius.circular(25),
                                        )),
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 5),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Text(
                                                    "Livraison 1/2",
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      color: GlobalColors
                                                          .mainColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .location_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Treichville arras2',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .badge_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Produits commandés',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 15),
                                                  ]),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .phone_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Adama',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .apps_list_detail_24_regular), //
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Contourner l\'immeuble, portail noir',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .chat_help_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Assistance',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.all(50)),
                                                    Align(
                                                      child:
                                                          FloatingActionButton(
                                                        onPressed: () {},
                                                        
                                                        child: const Icon(
                                                            FluentIcons
                                                                .directions_24_regular,
                                                            color: Colors.white,
                                                            size: 40),
                                                        backgroundColor:
                                                            GlobalColors
                                                                .mainColor,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 30),
                                                    Align(
                                                      child:
                                                          FloatingActionButton(
                                                        onPressed: () {},
                                                        child: const Icon(
                                                            FluentIcons
                                                                .book_20_regular,
                                                            color: Colors.white,
                                                            size: 40),
                                                        backgroundColor:
                                                            GlobalColors
                                                                .mainColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 10,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                                width: 1.0,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              top: BorderSide(
                                                                width: 1.0,
                                                                color:
                                                                    Colors.grey,
                                                              ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .calendar_cancel_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Annuler',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                Row(
                                                  
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                            context: context,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                              topRight: Radius
                                                                  .circular(25),
                                                              topLeft: Radius
                                                                  .circular(25),
                                                            )),
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return SingleChildScrollView(
                                                                child: Column(
                                              children: [
                                                const SizedBox(height: 5),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Text(
                                                    "Livraison 2/2",
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      color: GlobalColors
                                                          .mainColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .location_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Yopougon maroc',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .apps_list_detail_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),const SizedBox(
                                                        width:
                                                            15),
                                                     // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Residence DEDE, 3eme étage',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    
                                                  ]),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .re_order_16_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),const SizedBox(
                                                        width:
                                                            15),
                                                     // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Porte à porte',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    
                                                  ]),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .badge_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Liste des articles',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 100),
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .next_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                  ]),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .phone_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Rachelle',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 10,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                                width: 1.0,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              )),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .money_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Paiement en espèces    5000f',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                
                                                
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                    width: 1.0,
                                                    color: Colors.grey,
                                                  ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .chat_help_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Assistance',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              top: 15, bottom: 15, left: 150
                                                            )),
                                                    Align(
                                                      child:
                                                          FloatingActionButton(
                                                        onPressed: () {},
                                                        child: const Icon(
                                                            FluentIcons
                                                                .directions_24_regular,
                                                            color: Colors.white,
                                                            size: 40),
                                                        backgroundColor:
                                                            GlobalColors
                                                                .mainColor,
                                                      ),
                                                    ),
                                                    
                                                    
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    bottom: 10,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide(
                                                                width: 1.0,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              top: BorderSide(
                                                                width: 1.0,
                                                                color:
                                                                    Colors.grey,
                                                              ))),
                                                  child: Row(children: [
                                                    IconButton(
                                                      icon: const Icon(FluentIcons
                                                          .calendar_cancel_24_regular), // Remplacez "my_icon" par l'icône souhaitée
                                                      color: GlobalColors
                                                          .mainColor,
                                                      onPressed:
                                                          () {}, // Couleur de l'icône
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            15), // Espacement entre l'icône et le texte
                                                    const Text(
                                                      'Annuler',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                Row(
                                                  
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Problem> problems = [
          Problem(id: '1', name: 'Le fournisseur a mis du retard'),
          Problem(id: '2', name: 'Le client n\'était pas au lieu de rendez-vous à temps'),
          Problem(id: '3', name: 'Animal de compagnie agressif'),
          Problem(id: '4', name: 'Aucune'),
          // Ajoutez ici d'autres problèmes...
        ];

        List<Problem> selectedProblems = [];

        return AlertDialog(
          icon: Icon(FluentIcons.checkmark_24_regular, color: GlobalColors.mainColor, size: 50,),
          title: const Text('Livraison terminée. Quelles difficultés avez vous rencontrées?'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (Problem problem in problems)
                    ListTile(
                      title: Text(problem.name),
                      leading: Checkbox(
                        value: selectedProblems.contains(problem),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null && value) {
                              selectedProblems.add(problem);
                            } else {
                              selectedProblems.remove(problem);
                            }
                          });
                        },
                      ),
                    ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Enregistrer les problèmes dans la base de données
                for (Problem problem in selectedProblems) {
                  // Effectuer les opérations d'enregistrement dans la base de données ici
                  // ...
                }
                Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RoundButton()),
    ); // Fermer la boîte de dialogue
              },
              child: const Text('Enregistrer'),
            ),
            
          ],
        );
      },
    );
                                                      },
                                                      child: const Text(
                                                          'Colis livré'),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                                              );
                                                            });
                                                      },
                                                      
                                                      child: const Text(
                                                          'Colis recupéré'),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1C9521),
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        'Accepter',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                                  const SizedBox(width: 25),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Attention'),
                                            icon: const Icon(
                                              FluentIcons.warning_12_filled,
                                              color: Colors.red,
                                            ),
                                            content: const Text(
                                                'Êtes-vous sûr de vouloir refuser ? Votre nombre de refus autorisé diminuera d\'un point'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Annuler'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Action à effectuer lorsque le bouton "Refuser" est cliqué
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RoundButton()),
                                                  );
                                                },
                                                child: const Text('Confirmer'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(3),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1C9521),
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        'Refuser',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                gradient: const LinearGradient(
                    colors: [Color(0xFF1C9521), Colors.blue]),
                selectedGradientColor: const LinearGradient(
                    colors: [Color.fromARGB(255, 78, 178, 254), Colors.purple]),
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
      ]),
    );
  }
}

class Problem {
  final String id;
  final String name;

  Problem({required this.id, required this.name});
}
