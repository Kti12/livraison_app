import 'package:flutter/material.dart';

class TransactionModel {
  final String logo;
  final String name;
  final String date;
  final String somme;

  const TransactionModel(
    @required this.logo, 
    @required this.name, 
    @required this.date, 
    @required this.somme
    );
}
