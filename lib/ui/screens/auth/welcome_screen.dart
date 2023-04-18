import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:smartcare_project/ui/screens/auth/compte_screen.dart';

class welcomescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset(
            'assets/images/logo-symbol.png',
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/logo-smartcare.png',
                width: 350,
                height: 150,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Comptescreen();
                        },
                      ),
                    );
                  },
                  child: Text('J\'ai déjà un compte ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      side: BorderSide(width: 2, color: Color(0xFFd1d3d2)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: OutlinedButton(
                  onPressed: () {},
                  child: Text('Créer un nouveau compte  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      side: BorderSide(width: 2, color: Color(0xFFd1d3d2)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          color: Color(0xFFFf0787a),
          splashColor: Colors.white,
          icon: Icon(Icons.home),
          alignment: Alignment.center,
          autofocus: false,
          //disabledColor: Colors.white,
          onPressed: (() {}),
        ),
      ),
    );
  }
}
