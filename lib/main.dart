import 'package:flutter/material.dart';
import 'package:yemek_tarifleri/yemek_detay.dart';
import 'package:yemek_tarifleri/yemek_listesi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemek Tarifleri',
      debugShowCheckedModeBanner: false,
      initialRoute: "/yemekListesi",
      routes: {
        "/": (context)=>YemekListesi(),
        "/yemekListesi":(context)=>YemekListesi(),
      },
      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari=settings.name.split("/");
        if(pathElemanlari[1]=='yemekDetay'){
          return MaterialPageRoute(builder: (context)=> YemekDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

