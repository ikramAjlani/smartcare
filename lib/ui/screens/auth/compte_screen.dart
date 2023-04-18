import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartcare_project/Constants.dart';
import 'package:smartcare_project/ui/screens/auth/welcome_screen.dart';
import 'package:smartcare_project/ui/screens/Patientpage_screen.dart';

class Comptescreen extends StatefulWidget {
  @override
  const Comptescreen({Key? key}) : super(key: key);

  @override
  State<Comptescreen> createState() => _ComptescreenState();
}

class _ComptescreenState extends State<Comptescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choix de votre role',
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 5, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                  width: 335,
                ),
              ]),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'Je suis ...',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _cardMenu(
                            icon: 'assets/images/Patient.jpg',
                            title: 'Patient',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PatientPage(),
                                ),
                              );
                            }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _cardMenu(
                          icon: 'assets/images/doctor.jpg',
                          title: 'Médecin',
                        ),
                        _cardMenu(
                          icon: 'assets/images/Résident.jpg',
                          title: 'Résident',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _cardMenu(
                          icon: 'assets/images/pharmacien.jpg',
                          title: 'Pharmacien',
                        ),
                        _cardMenu(
                          icon: 'assets/images/technicien.jpg',
                          title: 'Technicien pharmacie',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12.0),
                        backgroundColor: Color.fromARGB(255, 120, 158, 158),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Suivant',
                              style: TextStyle(fontSize: 22)), // <-- Text
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            // <-- Icon
                            Icons.arrow_forward_ios_rounded,
                            size: 22.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

Widget _cardMenu({
  required String title,
  required String icon,
  VoidCallback? onTap,
  Color color = Colors.white,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      width: 145,
      decoration: BoxDecoration(
        //color: color,
        border: Border.all(
          color: Color.fromARGB(255, 209, 211, 210),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              icon,
              height: 60,
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 104, 104, 104)),
            )
          ],
        ),
      ),
    ),
  );
}
