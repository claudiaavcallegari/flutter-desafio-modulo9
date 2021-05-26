import 'package:flutter/material.dart';
import 'package:flutter_desafio/app/pages/detalhe.dart';
import 'package:flutter_desafio/app/pages/home_page.dart';

class MainPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        Detalhe.routerName : (_) => Detalhe(),
      }

    ) ;
  }
}