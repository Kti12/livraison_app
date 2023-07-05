import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:livreur_app/screen/login.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/inscription/page2.dart';
import 'package:crypto/crypto.dart';

class LivreurInscriptionPage1 extends StatefulWidget {
  @override
  _LivreurInscriptionPage1State createState() =>
      _LivreurInscriptionPage1State();
}

class _LivreurInscriptionPage1State extends State<LivreurInscriptionPage1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController _MDPController = TextEditingController();
  final TextEditingController _ConfirmerController = TextEditingController();
  final TextEditingController _MTNMoneyController = TextEditingController();
  

  File? PhotoLivreur;
  File? CNILivreur;
  File? CasierJudiciaireLivreur;
  File? PermisLivreur;

  Future<void> _selectImage(ImageSource source, String field) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
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

  void _selectDate() async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime(2025),
  );

  if (pickedDate != null) {
    setState(() {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = formattedDate;
    });
  }
}




  Future<void> fetchLivreurs() async {
    try{
      var baseUrl2 = 'http://192.168.10.2:8000/api/users/register';
      print(PhotoLivreur);
    // Créer une nouvelle demande de type Multipart
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl2));

    // Ajouter les champs de formulaire à la demande
    request.fields['NomLivreur'] = _nomController.text;
    request.fields['PrenomLivreur'] = _prenomController.text;
    request.fields['NumeroLivreur'] = _telephoneController.text;
    request.fields['DateNaissanceLivreur'] = dateController.text;
    /* var hashedPassword = sha256.convert(utf8.encode(_MDPController.text)).toString(); */
    request.fields['MDPLivreur'] = _MDPController.text;
    request.fields['ConfirmerMDP'] = _ConfirmerController.text;
    request.fields['MTNMoneyLivreur'] = _MTNMoneyController.text;
    
    request.fields['PhotoLivreur'] = PhotoLivreur.toString();
    request.fields['CNILivreur'] = CNILivreur.toString();
    request.fields['CasierJudiciaireLivreur'] = CasierJudiciaireLivreur.toString();
    request.fields['PermisLivreur'] = PermisLivreur.toString();

 if (PhotoLivreur == null || CNILivreur == null || CasierJudiciaireLivreur == null || PermisLivreur == null) {
    print('Veuillez sélectionner toutes les images obligatoires.');
    return; // Arrêter l'exécution de la fonction s'il manque des images
  }
    // Ajouter l'image à la demande (si l'utilisateur a choisi une image)
    if (PhotoLivreur != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'PhotoLivreur',
        PhotoLivreur!.path,
        
        
      ));
    }
    if (CNILivreur != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'CNILivreur',
        CNILivreur!.path,
        
      ));
    }
    if (CasierJudiciaireLivreur != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'CasierJudiciaireLivreur',
        CasierJudiciaireLivreur!.path,
       
      ));
    }
    if (PermisLivreur != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'PermisLivreur',
        PermisLivreur!.path,
        
      ));
    } 
    
    // Envoyer la demande et attendre la réponse
    var response = await request.send();
    

    // Traiter la réponse
    if (response.statusCode == 200) {
      print('Le livreur a été créé avec succès.');
      print(await response.stream.bytesToString());
    } else {
      print(
          'Échec de la création du livreur. Statut de la réponse : ${response.statusCode}');
    }
    }catch (e) {
    print('Erreur lors de l\'envoi de la demande : $e');
  }
    
  }
  /* Future<void> fetchLivreurs() async {
    var baseUrl2 = 'http://192.168.10.25:8000/api/livreurs';

    var request = http.MultipartRequest('POST', Uri.parse(baseUrl2));
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        };
        body: jsonEncode({
          'NomLivreur': _nomController.text,
          'PrénomLivreur': _prenomController.text,
          'NuméroLivreur': _telephoneController.text,
          'DateNaissanceLivreur': dateController.text,
          'MDPLivreur': _MDPController.text,
          'ConfirmerMDP': _ConfirmerController.text,
          'MTNMoneyLivreur': _MTNMoneyController.text,
          'TypeEnginLivreur': _enginController.text,
          'PlaqueImmatriculation': _immatriculationController.text,
          
        }));

    
      if (response.statusCode == 200) {
        print('Le livreur a été créé avec succès.');
        print(response.body);
      } else {
        print(
        'Échec de la création du livreur. Statut de la réponse : ${response.statusCode}');
      }
   
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Enregistrer vos informations'),
          backgroundColor: GlobalColors.mainColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomController,
                  decoration: InputDecoration(labelText: 'Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre nom';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _prenomController,
                  decoration: InputDecoration(labelText: 'Prénom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre prénom';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _telephoneController,
                  decoration: InputDecoration(labelText: 'Numéro de téléphone'),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre numéro de téléphone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(labelText: 'Date de naissance'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre date de naissance';
                    }
                    return null;
                  },
                  onTap: _selectDate,
                ),
                TextFormField(
                  controller: _MDPController,
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un mot de passe à 6 chiffres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ConfirmerController,
                  decoration:
                      InputDecoration(labelText: 'Confirmer le mot de passe'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez confirmer le mot de passe';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _MTNMoneyController,
                  decoration: InputDecoration(labelText: 'Numéro money'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre numéro MTN money';
                    }
                    return null;
                  },
                ),
               
                SizedBox(height: 16.0),
                Text('Sélectionnez les images :'),
                ElevatedButton(
                  onPressed: () => _selectImage(ImageSource.gallery, 'photo'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor),
                  child: Text('Photo'),
                ),
                ElevatedButton(
                  onPressed: () => _selectImage(ImageSource.gallery, 'cni'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor),
                  child: Text('CNI'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      _selectImage(ImageSource.gallery, 'casierJudiciaire'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor),
                  child: Text('Casier Judiciaire'),
                ),
                ElevatedButton(
                    onPressed: () =>
                        _selectImage(ImageSource.gallery, 'permis'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor),
                    child: Text('Permis de conduire')),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      padding: EdgeInsets.all(10)),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    ); 
                    fetchLivreurs();
                  },
                  child: Text('S\'inscrire'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
