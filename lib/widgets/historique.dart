import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/profile_user/profile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique des livraisons'),
        backgroundColor: const Color(0xFF1C9521),
        leading: IconButton(
          icon: Image.asset(
            'assets/fonts/back.png',
            width: 20,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profil()),
            );
          },
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/Images/aisa_rond.png"),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              FluentIcons.vehicle_truck_24_regular,
              size: 30,
              color: GlobalColors.mainColor,
            ),
            title: Text('Livraison ${index + 1}'),
            subtitle: Text('Date: ${DateTime.now().toString()}'),
            trailing: Icon(FluentIcons.arrow_forward_24_regular),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryDetailsPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DeliveryDetailsPage extends StatelessWidget {
  const DeliveryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Détails de la livraison'),
          backgroundColor: const Color(0xFF1C9521),
          leading: IconButton(
            icon: Image.asset(
              'assets/fonts/back.png',
              width: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
            },
            color: Colors.white,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/Images/aisa_rond.png"),
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 250, left: 50),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date de livraison : 12/06/2023',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Heure de livraison : 14:30',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Montant : 1000 Fcfa',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
