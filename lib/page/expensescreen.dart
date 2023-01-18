import 'package:budget_buddy/page/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:budget_buddy/utils/user_simple_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExpenseScreen extends StatelessWidget {
  //const ExpenseScreen({Key? key}) : super(key: key);

  double value;
  double savedIncome;
  double spentIncome;
  double toSubtract = 0;

  //ExpenseScreen({required this.value});
  ExpenseScreen({required this.value, required this.savedIncome, required this.spentIncome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Add Expense Amount'),
        backgroundColor: Colors.red,
      ),

      body: Center(
          child: ListView(
            children: <Widget>[

              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(3),
                width: 10.0,
                height: 100,
                child: TextField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    hintText: 'Enter amount here...',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    icon: Icon(Icons.attach_money_outlined),
                  ),
                  onChanged: (text){
                    toSubtract = double.parse(text.toString());
                  },
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(','),
                    FilteringTextInputFormatter.deny(' '),
                    FilteringTextInputFormatter.deny('-'),
                  ],
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                ),
              ), // Text Field Container

              Container(
                margin: EdgeInsets.all(10),
                width: 300,
                height: 45,
                child: ElevatedButton(

                  child: Text(
                    'Submit Changes',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),

                  onPressed: () async {
                    value -= toSubtract;
                    spentIncome += toSubtract;
                    await UserSimplePreferences.setBalance(value);
                    await UserSimplePreferences.setSpent(spentIncome);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen(balance: value, saved: savedIncome, spent: spentIncome)));
                  },

                ),
              ),  // submit button TO DO

            ],

          )

      ),



    );
  }
}
