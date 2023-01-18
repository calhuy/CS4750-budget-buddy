import 'package:flutter/material.dart';


class SpendingScreen extends StatelessWidget {
  //const SpendingScreen({Key? key}) : super(key: key);

  double value;
  double savedIncome;
  double spentIncome;


  SpendingScreen({required this.value, required this.savedIncome, required this.spentIncome});

  late double difference = savedIncome - spentIncome;

  late String differenceString = difference.toStringAsFixed(2);

  late String spentString = spentIncome.toStringAsFixed(2);

  late String savedString = savedIncome.toStringAsFixed(2);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Expense History'),
      ),

      body: Center(

        child: ListView(
          children: <Widget>[

            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(3),
              width: 10.0,
              height: 100,
              child: Text(
                'Total Saved: +\$' + savedString,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(3),
              width: 10.0,
              height: 100,
              child: Text(
                'Total Spent: -\$' + spentString,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(3),
              width: 10.0,
              height: 100,
              child: Text(
                'Total Difference of Income: \$' + differenceString,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

          ],

        ),

      ),

    );
  }
}
