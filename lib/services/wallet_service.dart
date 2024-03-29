import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_tracker/model/currency.dart';
import 'package:money_tracker/model/day_entry.dart';
import 'package:money_tracker/model/entry.dart';
import 'package:money_tracker/model/trip.dart';
import 'package:money_tracker/model/wallet.dart';

// Global Trip of the application
Trip trip;

class WalletService {
  static String documentsPath;

  static DateTime lastEntryDate = DateTime.now();

  static initTrip() {
    trip = Trip(
      name: 'Votre voyage',
      start: DateTime.now().add(Duration(days: -5)),
      currency: Currency("€", "€", 1),
    );

    for (int ind = 0; ind < 7; ind++) {
      trip.addWallet(Wallet(
        name: "",
        iconData: Icons.account_balance_wallet,
        isSecondaryCurrency: false,
      ));
    }
  }

  static saveWallets() {
    File file = File('$documentsPath/wallets.json');
    file.writeAsString(json.encode(trip.toMap()));
  }

  static readWallets() async {
    File file = File('$documentsPath/wallets.json');

    if (await file.exists()) {
      Map map = json.decode(await file.readAsString());
      trip = Trip.fromMap(map);
    } else {
      await file.create(recursive: true);
      initTrip();
      saveWallets();
    }
  }

  static initRealTrip() {
    DateTime tripStart = DateTime.utc(2019, 06, 16);

    trip = Trip(
      name: 'Canada 2019',
      start: tripStart,
      currency: Currency("\$", "€", 0.667),
    )
      ..addWallet(Wallet(
        name: 'N26',
        iconData: Icons.account_balance_wallet,
        isSecondaryCurrency: true,
        dayEntries: [
          DayEntry(dateTime: tripStart, entries: [
            Entry(name: 'Courses', amount: 25.04),
          ]),
          DayEntry(dateTime: tripStart.add(Duration(days: 1)), entries: [
            Entry(name: 'Mug Canada', amount: 9.19),
            Entry(name: 'Chargeur téléphone', amount: 17.25),
            Entry(name: 'Courses', amount: 22.77),
          ]),
          DayEntry(dateTime: tripStart.add(Duration(days: 2)), entries: [
            Entry(name: 'Wrap - MuffinPlus', amount: 7.02),
            Entry(name: 'Ustensiles', amount: 8.33),
            Entry(name: 'Paypal Mathieu', amount: 7.56, isIncome: true),
          ]),
          DayEntry(dateTime: tripStart.add(Duration(days: 3)), entries: [
            Entry(name: 'Courses', amount: 33.76),
          ]),
          DayEntry(dateTime: tripStart.add(Duration(days: 4)), entries: [
            Entry(name: 'Paypal Mathieu', amount: 14.77, isIncome: true),
            Entry(name: 'Courses', amount: 25.56),
            Entry(name: 'Ustensiles', amount: 29.99),
            Entry(name: 'Coop UQAM', amount: 25),
            Entry(name: 'Opinel', amount: 21.85),
            Entry(name: 'Glaces', amount: 6),
          ]),
        ],
      ))
      ..addWallet(Wallet(
        name: 'Cash',
        iconData: Icons.account_balance_wallet,
        hasBalance: true,
        dayEntries: [
          DayEntry(dateTime: tripStart, entries: [
            Entry(name: 'Retrait', amount: 300, isIncome: true),
            Entry(name: 'Ticket Bus', amount: 20),
          ]),
          DayEntry(dateTime: tripStart.add(Duration(days: 1)), entries: [
            Entry(name: 'Bijoux', amount: 12.5),
            Entry(name: 'Repas Midi', amount: 15),
            Entry(name: 'Cookie', amount: 1.5),
            Entry(name: 'Glaces', amount: 8.5),
            Entry(name: 'Mathieu', amount: 1),
          ]),
          DayEntry(dateTime: tripStart.add(Duration(days: 3)), entries: [
            Entry(name: 'Clef UQAM', amount: 20),
          ]),
          DayEntry(dateTime: tripStart.add(Duration(days: 4)), entries: [
            Entry(name: 'Ustensiles', amount: 4.6),
          ]),
        ],
      ));
  }
}
