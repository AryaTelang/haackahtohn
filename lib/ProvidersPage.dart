import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unscript_rookies_app/ProvDetails.dart';
import 'package:unscript_rookies_app/Verification.dart';

class ProvidersPage extends StatefulWidget {
  const ProvidersPage({Key? key}) : super(key: key);

  @override
  State<ProvidersPage> createState() => _ProvidersPageState();
}

class _ProvidersPageState extends State<ProvidersPage> {
  final provider = FirebaseAuth.instance.currentUser!;
  List<AppUser> arr = [];
  @override
  Widget build(BuildContext context) {
    final provider = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Providers",
          ),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.black,
      ),
      body: StreamBuilder<List<AppUser>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          log(snapshot.data.toString());
          if (snapshot.hasData) {
            int i, c = 0;
            for (i = 0; i < snapshot.data!.length; i++) {
              if (snapshot.data![i].PhoneNo != "0") {
                arr.add(snapshot.data![i]);
                c++;
              }
            }
            print(c);
            return ListView.builder(
                itemBuilder: (context, index) {
                  return buildUser(arr[index]);
                },
                itemCount: c);
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<AppUser?> readUser() async {
    var doc = await FirebaseFirestore.instance
        .collection("App Users")
        .doc(provider.uid)
        .get();
    if (doc.exists) {
      print(doc);
      return AppUser.fromJson(doc.data()!);
    }
    return null;
  }

  Widget buildUser(AppUser? user) => ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Icon(Icons.account_circle, color: Colors.black),
        ),
        title: Column(
          children: [
            Text('${user?.Email}'),
            Text('${user?.PhoneNo}'),
            (user?.Verified == true) ? Text("Verified") : Text("Not Verified")
          ],
        ),
        subtitle: Text('${user?.PhoneNo}'),
        trailing: ElevatedButton(
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProvDetails())),
                },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: Text("View")),
      );

  Stream<List<AppUser>> readUsers() => FirebaseFirestore.instance
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
  final String uid;

  AppUser(
      {required this.Email,
      required this.Password,
      required this.Verified,
      required this.PhoneNo,
      required this.uid});

  Map<String, dynamic> toJson() => {
        'Email': Email,
        'Verified': Verified,
        'Password': Password,
        'PhoneNo': PhoneNo,
    'uid':uid,
      };

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
      Email: json["Email"],
      Verified: json["Verified"],
      PhoneNo: json["PhoneNo"],
      Password: json["Password"],
      uid: json["uid"]);
}
