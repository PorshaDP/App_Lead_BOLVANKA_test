import 'package:app/pages/models/Order.dart';
import 'package:app/pages/sql_database/main_database.dart';
import 'package:flutter/material.dart';

class ButtonActive extends StatefulWidget {
  final String buttonTitle;
  final onPressed;
  const ButtonActive({required this.buttonTitle, required this.onPressed});

  @override
  State<ButtonActive> createState() => _ButtonActiveState();
}

class _ButtonActiveState extends State<ButtonActive> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: InkWell(
        onTap: () async {
          Order res = await DBProvider.db.getLastOrder();
          res.active = 0;
          await DBProvider.db.updateOrder(res);
          await Navigator.push(context, MaterialPageRoute(builder: widget.onPressed));
        },
        splashColor: Theme
            .of(context)
            .primaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(248, 193, 204, 240),
                Color.fromARGB(216, 45, 28, 98),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            widget.buttonTitle,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                color: Color.fromARGB(255, 223, 227, 243),
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}