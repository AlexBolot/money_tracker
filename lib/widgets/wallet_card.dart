import 'package:flutter/material.dart';
import 'package:money_tracker/model/wallet.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:money_tracker/widgets/money_text.dart';

class WalletCard extends StatefulWidget {
  final Wallet wallet;

  const WalletCard({this.wallet});

  @override
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  String name;
  DateTime start;
  bool hasBalance;
  bool isSecondaryCurrency;
  IconData iconData;
  double balance;

  @override
  Widget build(BuildContext context) {
    name = widget.wallet.name;
    hasBalance = widget.wallet.hasBalance;
    isSecondaryCurrency = widget.wallet.isSecondaryCurrency;
    iconData = widget.wallet.iconData;
    balance = widget.wallet.balance;

    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: detail(),
        ),
      ),
    );
  }

  List<Widget> detail() {
    List<Widget> items = [];

    items.add(
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(iconData),
          Container(width: 10),
          Text(name, style: TextStyle(fontSize: 20.0)),
          Container(width: 10),
          Text(
            (isSecondaryCurrency
                ? trip.currency.secondary
                : trip.currency.primary),
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
    items.add(Divider());
    if (hasBalance) {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Solde : ",
            style: TextStyle(fontSize: 16.0),
          ),
          MoneyText(
              amount: balance,
              isSecondary: isSecondaryCurrency,
              style: TextStyle(
                fontSize: 16,
                color: balance.isNegative ? Colors.red : Colors.green,
              ),
              textAlign: TextAlign.left),
        ],
      ));
    }
    return items;
  }
}
