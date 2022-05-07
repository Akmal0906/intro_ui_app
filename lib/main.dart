
import 'package:flutter/material.dart';
import 'package:intro_ui_app/pages/fade_page.dart';
import 'package:intro_ui_app/pages/home_page.dart';
import 'package:intro_ui_app/pages/intro_page.dart';
import 'package:intro_ui_app/pages/intro_ui1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const   IntroUI1(),
      routes: {
        FadePage.id:(context)=> const FadePage(),
        IntroUI1.id:(context)=>const  IntroUI1(),
        IntroPage.id:(context)=>const IntroPage(),
        HomePage.id:(context)=>const  HomePage(),
      },
    );
  }
}

