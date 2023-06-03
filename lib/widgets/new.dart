import 'package:flutter/material.dart';
import 'package:livreur_app/widgets/fournisseurInfo.dart';

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
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text('Nouvelle Livraison',
                                semanticsLabel: 'Koumassi',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                          const SizedBox(height: 20),
                          Row(
                        
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
                      )
                        ],
                      ),
                      
                      
                      );
                });
                }, 
     child: null,));
  }
}