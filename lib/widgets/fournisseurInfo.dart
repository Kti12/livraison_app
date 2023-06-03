// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FournisseurInfo extends StatefulWidget {
  const FournisseurInfo({super.key});

  @override
  State<FournisseurInfo> createState() => FournisseurInfoState();
}

class FournisseurInfoState extends State<FournisseurInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed:  (){
          showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )),
                builder: (BuildContext context) {
                  return SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
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
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const FournisseurInfo()),
                                  );
                                  
                                },
                                
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1C9521),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text(
                                    'Accepter',
                                    style: TextStyle(color: Colors.white),
                                  ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
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
                          ),
                        ],
                      ));
                });
                }, 
     child: null,));
  }
  }
