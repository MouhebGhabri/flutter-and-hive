import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:desktopi/kids_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'kids_page.dart';

late Box box;

Future<void> main() async {
  await Hive.initFlutter();
  //hive class creation
  Hive.registerAdapter(KidsModelAdapter());
  // box = await Hive.openBox(name)
  box = await Hive.openBox<KidsModel>("kidsmodel");
  // box.add(KidsModel(flname: "Wassim",
  //     parentflname: "Mouheb",
  //     phone: "22558877",
  //     age: "10",
  //     yearofjoin: "2020",
  //     pay: "true"
  // ));


  runApp(const MyApp());
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/icond.png',height: 100,width: 100,),
          Text("Plus securisé , plus confort et aussi plus organisé",style: GoogleFonts.aleo(fontSize: 30.0,color: Colors.white),),
        ],
      ),
      backgroundColor: Colors.purpleAccent,
      nextScreen: KidsPage(),
      duration: 3000,
      splashIconSize: 150,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      animationDuration: const Duration(seconds: 1),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids Garten',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }
}
