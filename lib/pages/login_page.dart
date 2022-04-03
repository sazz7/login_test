import 'package:flutter/material.dart';
import 'package:test_project/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton= false;
  bool changeIcon= false;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/login_image.png",
            height: 150,
            fit: BoxFit.cover,),
          SizedBox(height: 15,),
          Text("Welcome $name",style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "Enter username"
                ),
              onChanged: (valu){
                  name =valu;
                  setState(() {

                  });
              },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Enter password",
                ),),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  setState(() {
                    changeButton = true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  setState(() {
                    changeIcon = true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, MyRouts.homeRoute);
                  setState(() {
                    changeButton = false;
                    changeIcon = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height:45,width: changeButton?45:120,
                  child: changeIcon? Icon(Icons.done,color: Colors.white,): Text("Login",style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton?45:7),
                  ),
                ),
              )
              // ElevatedButton(
              //   child: Text("Login"),
              //   style: TextButton.styleFrom(minimumSize: Size(120,40)),
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRouts.homeRoute);
              //   },
              // )
            ],),
          )
        ],),
      ),
    );
  }
}
