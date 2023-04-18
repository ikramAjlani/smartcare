import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:smartcare_project/ui/screens/AcceuiPatient_screen.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau compte patient',
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 8, left: 23, right: 23),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Color.fromARGB(255, 240, 120, 122),
                        ),
                      ),
                      const Text(
                        "Retour",
                        style: TextStyle(
                          color: Color.fromARGB(255, 240, 120, 122),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 307,
                      ),
                    ]),
                SizedBox(width: double.infinity),
                Column(children: [
                  SizedBox(height: 12),
                  Text("Je suis un",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      )),
                  const Text(
                    " Patient",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 20),
                  profilPatient(),
                ]),
              ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: Icon(Icons.home),
          onPressed: (() {}),
        ),
      ),
    );
  }
}

class profilPatient extends StatefulWidget {
  const profilPatient({super.key});

  @override
  State<profilPatient> createState() => _profilPatientState();
}

class _profilPatientState extends State<profilPatient> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _prenomController = TextEditingController();
  final _DateNaissanceController = TextEditingController();
  final _SexeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _Conform_passController = TextEditingController();
  final List<String> errors = [];

  var choice;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuildNomField(),
          SizedBox(
            height: (20),
          ),
          BuildPrenonField(),
          SizedBox(
            height: (20),
          ),
          BuildDatedenaissance(),
          SizedBox(
            height: (20),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ChoiceChip(
                        label: const Text('Femme',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'AvenirLight',
                                color: Colors.black)),
                        labelPadding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        selected: choice == 'Femme',
                        onSelected: (bool selected) {
                          setState(() {
                            choice = selected ? 'Femme' : null;
                          });
                        },
                        selectedColor: Color(0xFFFf0787a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          side: const BorderSide(color: Color(0xFFd1d3d2)),
                        ))),
                Expanded(
                    child: ChoiceChip(
                        label: const Text('Homme',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'AvenirLight',
                                color: Colors.black)),
                        labelPadding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        selected: choice == 'Homme',
                        onSelected: (bool selected) {
                          setState(() {
                            choice = selected ? 'Homme' : null;
                          });
                        },
                        selectedColor: Color(0xFFFf0787a),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28))))
              ]),
          SizedBox(
            height: (20),
          ),
          BuildEmailField(),
          SizedBox(
            height: (20),
          ),
          BuildPasswordField(),
          SizedBox(
            height: (20),
          ),
          BuildConfirmerField(),
          SizedBox(
            height: (25),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()){
                 
                 //toast(context,"thanks");

                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                    return AcceuilScreen();
                  },
                  )
                  );
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AcceuilScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              backgroundColor: Color.fromARGB(255, 120, 158, 158),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            child: Text(
              'Créer mon compte',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField BuildConfirmerField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please re_enter your password ';
        } else if (value.length < 8) {
          return 'lenght of password caracters must be 8 or greater';
        } else if (value != _passwordController.text) {
          return 'password mismatch';
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "  Confirmer mot de passe",
        hintText: "****** ",
        labelStyle: const TextStyle(
            fontSize: 25, fontFamily: 'AvenirLight', color: Colors.black),
        contentPadding: EdgeInsets.only(left: 45, top: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color(0xFFd1d3d2)),
          gapPadding: 5,
        ),
        //hintMaxLines: 2,
        //hintMinLines: 1,
      ),
    );
  }

  TextFormField BuildPasswordField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password ';
        } else if (value.length < 8) {
          return 'lenght of password caracters must be 8 or great';
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelText: " Mot de passe",
          hintText: "****** ",
          labelStyle: TextStyle(
              fontSize: 25, fontFamily: 'AvenirLight', color: Colors.black),
          contentPadding: EdgeInsets.only(left: 45, top: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Color(0xFFd1d3d2)),
            gapPadding: 10,
          )),
    );
  }

  TextFormField BuildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email adresse';
        } else if (!value.contains("@") || !value.contains(".")) {
          return 'Please enter a valid email adress';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "exempe@host.com ",
          labelStyle: TextStyle(
              fontSize: 25, fontFamily: 'AvenirLight', color: Colors.black),
          contentPadding: EdgeInsets.only(left: 45, top: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Color(0xFFd1d3d2)),
            gapPadding: 10,
          )),
    );
  }

  TextFormField BuildDatedenaissance() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: "Date de naissance",
          hintText: "09/04/2023 ",
          labelStyle: TextStyle(
              fontSize: 25, fontFamily: 'AvenirLight', color: Colors.black),
          contentPadding: EdgeInsets.only(left: 45, top: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Color(0xFFd1d3d2)),
            gapPadding: 10,
          )),
    );
  }

  TextFormField BuildPrenonField() {
    return TextFormField(

     validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your FirstName ';
        }

     },

      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: "Prénom",
          hintText: "Falten ",
          labelStyle: TextStyle(
              fontSize: 25, fontFamily: 'AvenirLight', color: Colors.black),
          contentPadding: EdgeInsets.only(left: 45, top: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Color(0xFFd1d3d2)),
            gapPadding: 10,
          )),
    );
  }

  TextFormField BuildNomField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your LastName ';
        }

     },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          labelText: "Nom",
          hintText: "Foulen ",
          labelStyle: TextStyle(
              fontSize: 25, fontFamily: 'AvenirLight', color: Colors.black),
          contentPadding: EdgeInsets.only(left: 45, top: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Color(0xFFd1d3d2)),
            gapPadding: 10,
          )),
    );
  }
}
