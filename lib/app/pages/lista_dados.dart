import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desafio/app/pages/custom_list_item.dart';

class ListaDados extends StatefulWidget {
  @override
  _ListaDadosState createState() => _ListaDadosState();
}

class _ListaDadosState extends State<ListaDados> {
  List<dynamic> dados;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/dados.json').then((jsonData) {
      this.setState(() {
        dados = json.decode(jsonData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dados?.length ?? 0,
        //itemExtent: 100,

        itemBuilder: (_, index) {
          return CustomListItem(dados[index]);
        });
  }
}
