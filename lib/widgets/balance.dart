import 'package:flutter/material.dart';
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/profile_user/profile.dart';
import 'package:livreur_app/widgets/transaction_model.dart';

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  List<TransactionModel> _transactionList = [
    const TransactionModel(
       'assets/fonts/money.png', 
       "Retrait", 
       "10/05/2023", 
       '2000'),
       const TransactionModel(
       'assets/fonts/money.png', 
       "Dépot", 
       "10/05/2023", 
       '1500'),
       const TransactionModel(
       'assets/fonts/money.png', 
       "Dépot", 
       "10/05/2023", 
       '1000'),
       const TransactionModel(
       'assets/fonts/money.png', 
       "Retrait", 
       "10/05/2023", 
       '5000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: <Widget>[
            _appBarBottomSection(),
            _mainBody(),
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: GlobalColors.mainColor,
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: IconButton(
          icon: Image.asset(
            "assets/fonts/back.png",
            fit: BoxFit.fitWidth,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profil()),
            );
          },
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
                child: Image.asset(
              "assets/Images/logo_aisa.png",
              fit: BoxFit.cover,
            )),
          ),
        )
      ],
    );
  }

  _appBarBottomSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: GlobalColors.mainColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'cfa',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    height: 1),
              ),
              Text(
                '30.000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  height: 0.9,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Fond total',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  _mainBody() {
    return  Expanded(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      physics: ClampingScrollPhysics(),
      child: Column(
        children:<Widget> [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Transaction",
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  Text(
                  "somme",
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  )
              ],
            ),
            ),
            Divider(),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(),
              itemCount: _transactionList.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: GlobalColors.mainColor.withOpacity(0.1))
                  ),
                  child: Image.asset(
                    _transactionList[index].logo,
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
                title: Text(_transactionList[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                subtitle: Text(_transactionList[index].date,
                style: TextStyle(
                  color: GlobalColors.mainColor.withOpacity(0.6),
                  fontSize: 14,
                          fontWeight: FontWeight.w500
                  
                ),),
                trailing: Text(_transactionList[index].somme,
                style: TextStyle(
                  color: GlobalColors.mainColor,
                  fontSize: 14,
                          fontWeight: FontWeight.w600
                  
                ),),
                  
                
              ), 
               
              
              )
        ],
      ),
    ));
  }
}
