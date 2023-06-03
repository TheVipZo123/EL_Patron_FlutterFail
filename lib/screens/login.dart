import 'package:flutter/material.dart';
import 'package:flutter_application_el_patron/main.dart';
import 'package:flutter_application_el_patron/screens/homepage.dart';
import 'package:flutter_application_el_patron/screens/signup.dart';
import 'package:flutter_application_el_patron/reusableWidgets/reusable_widget.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  
   
    return Scaffold(
      body: Container(
       
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors:[
          Color(0xFF408EC6),Color(0xFF1E2761), ], begin: Alignment.bottomCenter, end: Alignment.topCenter )
          
          ),
        child: SingleChildScrollView( child: Padding (
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 
          20, 0),
          child: Column(
            children: <Widget> [
              //logoWidget("./assets/images/Logo_Robo5.png"),
               CircleAvatar(
          radius: 85.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('./assets/images/Logo_Robo5.png'),
        ),
              SizedBox(
                height: 30,
              ),
              reusable_textfield("Digite o Login", Icons.person_outline, false,
               _emailTextController),
               SizedBox(
                height: 20,
              ),
              reusable_textfield("Digite a Senha", Icons.lock_outline, true,
               _passwordTextController),
              SizedBox(
                height: 20,
              ),
              SigninSignUpbutton(context, true, () {

                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));


              } ),

              signUpOption()
                

            ],
          ),
        ),
          
          
          
        ),
      ),
    );
  }
Row signUpOption() {

return Row(

  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    const Text("Não tem uma conta?",
    style: TextStyle(color:Colors.white70)),

    GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      child: const Text(
        " Cadastre-se",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),

    ),

  ],


);
}

}

