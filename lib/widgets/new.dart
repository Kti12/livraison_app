// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:livreur_app/widgets/fournisseurInfo.dart';
import 'package:livreur_app/widgets/ligne.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => NewState();
}

class NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
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
                    const Text('Prise en charge: Yopougon Maroc Kimi',
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
                              builder: (BuildContext context) {
                                return Column(children: [
                                  const Text('Information sur le fournisseur',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(height: 30),
                                  const Text('Fournisseur: Treichville arras2',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(height: 20),
                                  const Text(
                                      'Prise en charge: Yopougon Maroc Kimi',
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
                                ]);
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RoundButton()),
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
      child: null,
    ));
  }
}
