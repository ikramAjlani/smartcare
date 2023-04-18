import 'package:flutter/material.dart';

class AcceuilScreen extends StatefulWidget {
  @override
  const AcceuilScreen({Key? key}) : super(key: key);

  @override
  State<AcceuilScreen> createState() => _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Acceuil',
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
          actions: [
            IconButton(
              padding: EdgeInsets.all(12),
              onPressed: () {},
              icon: Icon(Icons.account_circle,
                  size: 30, color: Color(0xFF686868)),
            )
          ],
        ),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(
                          "Bienvenu,",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "ikram ajlani",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                  Icon(
                    Icons.drag_indicator,
                    size: 50,
                    color: Color(0xFF686868),
                  ),
                ],
              ),

            ),
            SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
             child : Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 300,
                  height: 100,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    
                  ),
                  child: Center(child: Text("Assistance diagnostique"),)
                ),
              ],

             )
        )]),
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: Colors.white)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => this.currentIndex = index),
              selectedItemColor: Color(0xFFFf0787a),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: ("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: ("person")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.description), label: ("Descreption")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: ("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.content_paste), label: ("Home")),
              ],
            )));
  }
}
