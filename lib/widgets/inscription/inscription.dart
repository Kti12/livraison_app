import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livreur_app/screen/login.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/inscription/page2.dart';

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
  final TextEditingController _enginController = TextEditingController();
  final TextEditingController _immatriculationController =
      TextEditingController();

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

  Future<void> fetchLivreurs() async {
    var baseUrl2 = 'http://192.168.10.25:8000/api/livreurs';

    final response = await http.post(Uri.parse(baseUrl2),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
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
          'PhotoLivreur': '',
          'CNILivreur': '',
          'CasierJudiciaireLivreur': '',
          'PermisLivreur': '',
        }));

    
      if (response.statusCode == 200) {
        print('Le livreur a été créé avec succès.');
        print(response.body);
      } else {
        print(
        'Échec de la création du livreur. Statut de la réponse : ${response.statusCode}');
      }
   
  }

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
                  onTap: () async {
                  var pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2015),
                    
                  );

                  setState(() {
                    if (pickedDate != null) {
                      var date = pickedDate.toString().replaceAll("(", "");
                      date = date.toString().replaceAll(")", "");
                      date = date.toString().replaceAll("DateTime", "");
                      dateController.text = date;
                    }
                  });
                },
                  
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
                      backgroundColor: GlobalColors.mainColor),
                  onPressed: () {
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    ); */
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
