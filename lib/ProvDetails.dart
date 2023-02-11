
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unscript_rookies_app/ProvidersPage.dart';
import 'package:unscript_rookies_app/UsersPage.dart';


class ProvDetails extends StatefulWidget {
  const ProvDetails({
    Key? key,
    String? Email;
    String? PhoneNo;
    String? Password;
    bool? Verified;
    String? uid;
})
: super(key: key);
  @override
  State<ProvDetails> createState() => _ProvDetailsState();
}

class _ProvDetailsState extends State<ProvDetails> {
 int _currentIndex = 0;
 final user = FirebaseFirestore.instance
 .collection('App Users')
 .doc(user.);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Provider Details",
          ),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.black,
      ),
      body:(
          ElevatedButton(
              onPressed: () => {
                user.update({'Verified':true})
                 },
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: const Text("Verify this user"))
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            if (_currentIndex == 0) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProvidersPage()));
            }
            if (_currentIndex == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UsersPage())
              );
            }
          });
        },
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.redAccent,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_sharp),
            label: 'Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: 'Users Page',
          ),
        ],
      ),
    );
  }

 Stream<List<AppUser>> readProvider() => FirebaseFirestore.instance
     .collection('App Users')
     .snapshots()
     .map((snapshot) =>
     snapshot.docs.map((doc) => AppUser.fromJson(doc.data())).toList());
}
class AppUser {
  final String Email;
  final String Password;
  final bool Verified;
  final String PhoneNo;

  AppUser(
      {required this.Email,
        required this.Password,
        required this.Verified,
        required this.PhoneNo});

  Map<String, dynamic> toJson() => {
    'Email': Email,
    'Verified': Verified,
    'Password': Password,
    'PhoneNo': PhoneNo
  };

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
      Email: json["Email"],
      Verified: json["Verified"],
      PhoneNo: json["PhoneNo"],
      Password: json["Password"]);
}

