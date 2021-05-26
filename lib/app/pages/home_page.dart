import 'package:flutter/material.dart';
import 'package:flutter_desafio/app/pages/lista_dados.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 672),
        orientation: Orientation.portrait);
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha uma Revenda'),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.swap_vert),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Melhor Avaliação'),
                  ),
                  PopupMenuItem(
                    child: Text('Mais Rápido'),
                  ),
                  PopupMenuItem(
                    child: Text('Mais Barato'),
                  ),
                ];
              }),
          PopupMenuButton(
            icon: Icon(Icons.help_outline),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Suporte'),
                ),
                PopupMenuItem(
                  child: Text('Termos de Serviço'),
                ),
                
              ];
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.13,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Botijões de 13 kg em:',
                            style: TextStyle(fontSize: 10),
                            textScaleFactor: ScreenUtil().scaleText,
                          ),
                          Text(
                            'Av Paulista, 1001',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textScaleFactor: ScreenUtil().scaleText,
                          ),
                          Text(
                            'Paulista, São Paulo, SP',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textScaleFactor: ScreenUtil().scaleText,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                        Text(
                          'Mudar',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.87,
                child: ListaDados(),
              ),
            ],
          );
        },
      ),
    );
  }
}
