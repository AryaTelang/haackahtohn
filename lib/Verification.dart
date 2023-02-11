import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Verification Page",
          ),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 10,),
          Text("Provider Name",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 10,),
          Text("Restaurant Id:",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 10,),
          Text("Details",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 10,),
        ],

      ),
    );
  }
}
