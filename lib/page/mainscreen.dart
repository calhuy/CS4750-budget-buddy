import 'dart:io';

import 'package:flutter/material.dart';
import 'package:budget_buddy/page/incomescreen.dart';
import 'package:budget_buddy/page/expensescreen.dart';
import 'package:budget_buddy/page/spendingscreen.dart';
import 'package:budget_buddy/utils/user_simple_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  //const MainScreen({Key? key}) : super(key: key);

  late double balance;

  late double spent;

  late double saved;

  MainScreen({required this.balance, required this.spent, required this.saved});




  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //late String balanceString = widget.balance.toStringAsFixed(2);

  @override
  void initState(){
    super.initState();

    widget.balance = UserSimplePreferences.getBalance() ?? 0;

    widget.spent = UserSimplePreferences.getSpent() ?? 0;

    widget.saved = UserSimplePreferences.getSaved() ?? 0;

  }

  late String balanceString = widget.balance.toStringAsFixed(2);

  final urlImageOne = 'https://img.wallpapersafari.com/tablet/800/1280/47/82/82OpaQ.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: null, icon: Icon(Icons.menu)),
        title: Text("My Budget Buddy"),
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: ListView(

          children: <Widget>[


            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: Text(
                'Balance',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ), // balance title

            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(3),
              width: 10.0,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black54),
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFFFFF),
              ),
              child: Center(
                child: Text(
                  '\$' + balanceString,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ), // balance box with text

            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              height: 45,
              child: ElevatedButton(

                child: Text(
                  'Add Income',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IncomeScreen(value: widget.balance, savedIncome: widget.saved, spentIncome: widget.spent)));
                },

              ),
            ), // add income

            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  'Add Expense',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpenseScreen(value: widget.balance, savedIncome: widget.saved, spentIncome: widget.spent)));
                },
              ),
            ), // add expense

            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  'Spending History',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpendingScreen(value: widget.balance, savedIncome: widget.saved, spentIncome: widget.spent)));
                },
              ),
            ), //spending history

            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              height: 45,
              child: ElevatedButton(
                child: Text(
                  'Clear ALL Data (Quits App)',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () async{
                  await UserSimplePreferences.clearData();
                  exit(0);
                },
              ),
            ), //spending history



          ],
            ),
              ),

    );
  }
}
