import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../screen/login.dart';

class LivreurInscriptionPage2 extends StatefulWidget {
  final String NomLivreur;
  final String PrenomLivreur;
  final String NumeroLivreur;
  final String DateNaissanceLivreur;
  final String MDPLivreur;
  final String ConfirmerMDP;
  final String MTNMoneyLivreur;

  LivreurInscriptionPage2({
    required this.NomLivreur,
    required this.PrenomLivreur,
    required this.NumeroLivreur,
    required this.DateNaissanceLivreur,
    required this.MDPLivreur,
    required this.MTNMoneyLivreur,
    required this.ConfirmerMDP,
  });

  @override
  _LivreurInscriptionPage2State createState() =>
      _LivreurInscriptionPage2State();
}

class _LivreurInscriptionPage2State extends State<LivreurInscriptionPage2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _enginController = TextEditingController();
  final TextEditingController _immatriculationController =
      TextEditingController();

  File? PhotoLivreur;
  File? CNILivreur;
  File? CasierJudiciaireLivreur;
  File? PermisLivreur;

  Future<void> _selectImage(ImageSource source, String field) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    setState(() {
      if (pickedImage != null) {
        switch (field) {
          case 'photo':
            PhotoLivreur = File(pickedImage.path);
            break;
          case 'cni':
            CNILivreur = File(pickedImage.path);
            break;
          case 'casierJudiciaire':
            CasierJudiciaireLivreur = File(pickedImage.path);
            break;
          case 'permis':
            PermisLivreur = File(pickedImage.path);
            break;
        }
      }
    });
  }

  

  /* Future<void> _registerLivreur() async {
    if (_formKey.currentState!.validate()) {
      // Enregistrer les informations du livreur
      Map<String, String> livreurData = {
        'NomLivreur': widget.NomLivreur,
        'PrenomLivreur': widget.PrenomLivreur,
        'NumeroLivreur': widget.NumeroLivreur,
        'DateNaissanceLivreur': widget.DateNaissanceLivreur,
        'MDPLivreur': widget.MDPLivreur,
        'ConfirmerMDP': widget.ConfirmerMDP,
        'MTNMoneyLivreur': widget.MTNMoneyLivreur,
        'TypeEnginLivreur': _enginController.text,
        'PlaqueImmatriculation': _immatriculationController.text,
        'PhotoLivreur': '',
        'CNILivreur': '',
        'CasierJudiciaireLivreur': '',
        'PermisLivreur': '',
      };

      if (PhotoLivreur != null) {
        // Envoi de l'image de la photo à l'API
        final photoResponse = await http.post(
          Uri.parse('http://192.168.1.138:8000/api/livreurs'),
          body: {'image': base64Encode(PhotoLivreur!.readAsBytesSync())},
        );
        if (photoResponse.statusCode == 200) {
          // Succès de l'envoi de l'image de la photo
          livreurData['photo'] = photoResponse.body;
        } else {
          // Erreur lors de l'envoi de l'image de la photo
          showDialog(

            // Afficher une alerte indiquant le succès de l'inscription
            context: context, // Add the 'context' parameter here
            builder: (context) {
              return AlertDialog(
                title: Text('Erreur lors de l\'envoi de l\'image'),
                
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
          return;
        }
      }

      if (CNILivreur != null) {
        // Envoi de l'image de la CNI à l'API
        final cniResponse = await http.post(
          Uri.parse('http://192.168.10.11:8000/api/livreurs'),
          body: {'image': base64Encode(CNILivreur!.readAsBytesSync())},
        );
        if (cniResponse.statusCode == 200) {
          // Succès de l'envoi de l'image de la CNI
          livreurData['CNILivreur'] = cniResponse.body;
        } else {
          // Erreur lors de l'envoi de l'image de la CNI
          showDialog(

            // Afficher une alerte indiquant le succès de l'inscription
            context: context, // Add the 'context' parameter here
            builder: (context) {
              return AlertDialog(
                title: Text('Erreur lors de l\'envoi de l\'image'),
                
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
          return;
        }
      }

      if (CasierJudiciaireLivreur != null) {
        // Envoi de l'image du casier judiciaire à l'API
        final casierResponse = await http.post(
          Uri.parse('http://192.168.10.11:8000/api/livreurs'),
          body: {
            'image': base64Encode(CasierJudiciaireLivreur!.readAsBytesSync())
          },
        );
        if (casierResponse.statusCode == 200) {
          // Succès de l'envoi de l'image du casier judiciaire
          livreurData['CasierJudiciaireLivreur'] = casierResponse.body;
        } else {
          // Erreur lors de l'envoi de l'image du casier judiciaire
          showDialog(

            // Afficher une alerte indiquant le succès de l'inscription
            context: context, // Add the 'context' parameter here
            builder: (context) {
              return AlertDialog(
                title: Text('Erreur lors de l\'envoi de l\'image'),
                
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
          return;
        }
      }

      if (PermisLivreur != null) {
        // Envoi de l'image du permis à l'API
        final permisResponse = await http.post(
          Uri.parse('http://192.168.10.11:8000/api/livreurs'),
          body: {'image': base64Encode(PermisLivreur!.readAsBytesSync())},
        );
        if (permisResponse.statusCode == 200) {
          // Succès de l'envoi de l'image du permis
          livreurData['PermisLivreur'] = permisResponse.body;
        } else {
          // Erreur lors de l'envoi de l'image du permis
          showDialog(

            // Afficher une alerte indiquant le succès de l'inscription
            context: context, // Add the 'context' parameter here
            builder: (context) {
              return AlertDialog(
                title: Text('Erreur lors de l\'envoi de l\'image'),
                
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
          return;
        }
      }
      Future<void> fetchCommande() async {
    var baseUrl2 = 'http://192.168.1.17:8000/api/livreurs';

    final response = await http.post(Uri.parse(baseUrl2),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'client_id': 1,
          'produits': produits,
          'AdresseClient': address,
          'HeureLivraison': deliveryTime,
          'ModePaiement': paymentOption,
          'reference': reference
        }));

    // print(response.body);

    print(paymentOption);

    if (paymentOption == 'en_ligne') {
      function_paiement();
    } else {
      Fluttertoast.showToast(
        msg:
            'Votre commande a été enregistrer avec succès merci pour votre confiance, un cormercial...',
        toastLength: Toast
            .LENGTH_SHORT, // Duration for which the toast should be displayed
        gravity:
            ToastGravity.BOTTOM, // Position of the toast message on the screen
        timeInSecForIosWeb:
            1, // Specific to iOS/Web, the time for which the toast should be displayed
        backgroundColor: Colors.black54, // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0, // Font size of the toast message
      );
    }

      // Envoi des informations d'inscription à l'API Laravel
      final inscriptionResponse = await http.post(
        Uri.parse('http://192.168.10.11:8000/api/livreurs'),
        body: livreurData,
      );

      if (inscriptionResponse.statusCode == 200) {
        // Succès de l'inscription
        showDialog(

            // Afficher une alerte indiquant le succès de l'inscription
            context: context, // Add the 'context' parameter here
            builder: (context) {
              return AlertDialog(
                title: Text('Félicitation'),
                content: Text(
                    'Votre demande d\'inscription a bien été envoyée. Vous serez contacter plutard pour la validation.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
      } 
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminer votre inscription'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _enginController,
                decoration: InputDecoration(labelText: 'Type d\'engin'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner le type d\'engin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _immatriculationController,
                decoration:
                    InputDecoration(labelText: 'Immatriculation du véhicule'),
                validator: (value) {
                  if ((_enginController.text == 'Vélo' ||
                          _enginController.text == 'Moto') &&
                      (value == null || value.isEmpty)) {
                    return 'Veuillez saisir l\'immatriculation du véhicule';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text('Sélectionnez les images :'),
              ElevatedButton(
                onPressed: () => _selectImage(ImageSource.gallery, 'photo'),
                child: Text('Photo'),
              ),
              ElevatedButton(
                onPressed: () => _selectImage(ImageSource.gallery, 'cni'),
                child: Text('CNI'),
              ),
              ElevatedButton(
                onPressed: () =>
                    _selectImage(ImageSource.gallery, 'casierJudiciaire'),
                child: Text('Casier Judiciaire'),
              ),
              ElevatedButton(
                  onPressed: () => _selectImage(ImageSource.gallery, 'permis'),
                  child: Text('Permis de conduire')),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  /* if (_formKey.currentState!.validate()) {
                    _registerLivreur();
                  } */
                },
                child: Text('S\'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
