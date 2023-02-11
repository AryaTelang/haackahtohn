import 'package:flutter/material.dart';
import 'ProvidersPage.dart';
import 'UsersPage.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({Key? key}) : super(key: key);
  @override
  State<AdminDash> createState() => _AdminDashState();
}
List<String> adminList=["Arya Telang"];
List<String> adminEmail=["aryatel26@gmail.com"];
List<String> adminPass=["adminpass"];
int _currentIndex = 0;
class _AdminDashState extends State<AdminDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 10,),
          Text("Logged In As:",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 10,),
          Text("Administrator Name :",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 10,),
          Text("Pending Provider Requests:",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 10,),
        ],
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
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Providers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_sharp),
            label: 'Users',
          ),
        ],
      ),
    );
  }
}
