import 'package:firebase_core/firebase_core.dart';
import 'package:fit_box_01/models/activityManager.dart';
import 'package:fit_box_01/models/userManager.dart';
import 'package:fit_box_01/screens/base/base_screen.dart';
import 'package:fit_box_01/screens/login/login_screen.dart';
import 'package:fit_box_01/screens/signup/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //final Color colorPrimary = Color(0xFF143642);

  //final Color colorLight = Color(0xFF26667d);

  //final Color colorDark = Color(0xFF08161b);

  final MaterialColor colorPrimary = MaterialColor(0xFF143642,
      {
        50:Color.fromRGBO(20,54,66, .1),
        100:Color.fromRGBO(20,54,66, .2),
        200:Color.fromRGBO(20,54,66, .3),
        300:Color.fromRGBO(20,54,66, .4),
        400:Color.fromRGBO(20,54,66, .5),
        500:Color.fromRGBO(20,54,66, .6),
        600:Color.fromRGBO(20,54,66, .7),
        700:Color.fromRGBO(20,54,66, .8),
        800:Color.fromRGBO(20,54,66, .9),
        900:Color.fromRGBO(20,54,66, 1),
      });

  final MaterialColor colorLight = MaterialColor(0xFF143642,
      {
        50:Color.fromRGBO(38, 102, 125, .1),
        100:Color.fromRGBO(38, 102, 125, .2),
        200:Color.fromRGBO(38, 102, 125, .3),
        300:Color.fromRGBO(38, 102, 125, .4),
        400:Color.fromRGBO(38, 102, 125, .5),
        500:Color.fromRGBO(38, 102, 125, .6),
        600:Color.fromRGBO(38, 102, 125, .7),
        700:Color.fromRGBO(38, 102, 125, .8),
        800:Color.fromRGBO(38, 102, 125, .9),
        900:Color.fromRGBO(38, 102, 125, 1),
      });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserManager(),
            lazy: false,
        ),
        ChangeNotifierProvider(
            create: (_) => ActivityManager(),
            lazy: false,
        ),

      ],
      child: MaterialApp(
        title: 'FitBox',
        debugShowCheckedModeBanner: false,
        initialRoute: '/base',
        theme: ThemeData(
          primaryColor: colorPrimary,
          scaffoldBackgroundColor: colorPrimary,
          appBarTheme: const AppBarTheme( elevation: 0)
        ),
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                  builder: (_) => LoginScreen()
              );
            case '/signup':
              return MaterialPageRoute(
                  builder: (_) => SignupScreen()
              );
            case '/base':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen()
              );
          }
        },
      ),
    );
  }
}

