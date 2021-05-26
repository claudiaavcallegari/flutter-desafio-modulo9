import 'package:flutter/material.dart';

class Detalhe extends StatefulWidget {
  const Detalhe({Key key}) : super(key: key);

  static String routerName = '/detalhe';

  @override
  _DetalheState createState() => _DetalheState();
}

class _DetalheState extends State<Detalhe> {
  Map dados;

  num qtd = 1;
  double total;

  @override
  Widget build(BuildContext context) {
    this.dados = ModalRoute.of(context).settings.arguments;

    setState(() {
      this.total = this.qtd * this.dados['preco'];
    });

    var cor = int.parse('0xFF' + this.dados['cor']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Produtos'),
        centerTitle: true,
        actions: [
          Icon(Icons.help_outline),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    //Icon(Icons.radio_button_checked,color: Colors.blue ,),

                                    Container(
                                      margin: EdgeInsets.only(bottom: 2),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [BoxShadow(blurRadius: 15)],
                                      ),
                                    ),

/* 
                                    Icon(
                                      Icons.fiber_manual_record,
                                      color: Colors.blue,
                                    ), */
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Comprar'),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                //color: Colors.blue,
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.radio_button_unchecked,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Pagamento'),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                //   color: Colors.yellow,
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.radio_button_unchecked,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Confirmação'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                        //thickness: 2,
                        ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                child: Center(
                                    child: Text(
                                  this.qtd.toString(),
                                  style: TextStyle(color: Colors.white),
                                )),
                                margin: EdgeInsets.all(8),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(cor),
                                  borderRadius: BorderRadius.circular(20),
                                  // boxShadow: [BoxShadow(blurRadius: 15)],
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                '${this.dados['nome']} - Botijão de 13 kg',
                              )),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            child: Text('R\$')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            this.total.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.home,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('${this.dados['nome']}'),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                            '${this.dados['nota'].toString()}'),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 10,
                                      ),
                                      SizedBox(width: 15),
                                      Text('${this.dados['tempoMedio']} min')
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  color: Color(cor),
                                  child: Text(this.dados['tipo'],
                                      style: TextStyle(color: Colors.white)))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center  ,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text('Botijão de 13kg'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text('${this.dados['nome']}'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('R\$'),
                                  Text(
                                      '${this.dados['preco'].toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ), 
                        ),
                        // bolinha subtrai
                        InkWell(
                          onTap: (){
                              setState(() {
                                if(this.qtd>0){
                                  this.qtd--; 
                                }
                              });

                          },
                                                  child: Icon(
                            Icons.remove_circle,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/botijao_gas.png',
                                  ),
                                  fit: BoxFit.scaleDown)),
                          child: Center(
                              child: Container(
                            child: Text( this.qtd.toString()   ,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w900),
                            ),
                            color: Colors.orange,
                          )),
                        ),
                        //Image(image: AssetImage('assets/botijao_gas.png'),),

                        // bola somar
                        InkWell(
                          onTap: (){
                            setState(() {
                              this.qtd++;

                            });

                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(97, 179, 245, 0.8),
                        Color.fromRGBO(27, 120, 211, 1),
                      ])),
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    'IR PARA PAGAMENTO',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
