import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_el_patron/provider/navigation_provider.dart';
import 'package:flutter_application_el_patron/reusableWidgets/reusable_widget.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';
import 'screens/homepage.dart';
import 'screens/signup.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp( MyApp());

}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    
   
    
  };

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: LoginPage(),
        ),
      );
}
