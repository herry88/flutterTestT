import 'package:flutter/material.dart';
import 'package:fluttertest/data/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:persist_theme/persist_theme.dart';

//ui import
import 'package:fluttertest/views/loginData.dart';
import 'package:fluttertest/views/home.dart';
import 'package:fluttertest/views/about.dart';
import 'package:fluttertest/views/getData.dart';


void main() =>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeModel _model = ThemeModel();
  final AuthModel _auth = AuthModel();

    @override
    void initState() {
      try{
        _auth.loadSettings();
      } catch(e){
        print("error loading Theme: $e");
      }
      super.initState();
    }

    @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>.value(value: _model),
        ChangeNotifierProvider<AuthModel>.value(value: _auth),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, model, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: model.theme,
          home: Consumer<AuthModel>(builder: (context, model, child){
            if(model?.user !=null) return Home();
            return LoginPage();
          }),
          routes: <String, WidgetBuilder>{
            "/login" : (BuildContext context) => LoginPage(),
            "/menu"  : (BuildContext context) => Home(),
            "/home"  : (BuildContext context) => Home(),
            "/get"   : (BuildContext context) => MyTest(),
            "/about" : (BuildContext context) => About(),
          },
        ),
      ),
    );
  }
}
