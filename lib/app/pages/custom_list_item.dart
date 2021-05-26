//import 'dart:html';

import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem(this.dados);

  final Map dados;

  @override
  Widget build(BuildContext context) {
    var cor = int.parse('0xFF' + dados['cor']);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detalhe',arguments: dados);


      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(cor),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5))),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Container(
                      width: 80,
                      margin: EdgeInsets.all(10),
                      child: Text(
                        dados['tipo'],
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 7,
              child: Container(
                // padding: const EdgeInsets.all(8.0),
                //color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            dados['nome'],
                          ),
                        ),
                        (dados['melhorPreco'])
                            ? Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 95,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            topLeft: Radius.circular(5)),
                                        color: Color.fromRGBO(255, 171, 64, 1)),
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.label,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Melhor Preço',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Nota',
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  dados['nota'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Tempo Médio'),
                            ),
                            Row(
                              children: [
                                Text(
                                  dados['tempoMedio'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text('min'),
                              ],
                            )
                          ],
                        ),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Preço'),
                          ),
                          Text(
                            'R\$ ${dados['preco'].toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ]),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
