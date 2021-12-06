import 'package:cadastros/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Comprovante extends StatefulWidget {
  String nome;
  String banco;
  String conta;
  String valor;
  String descricao;

  Comprovante(this.nome, this.banco, this.conta, this.valor, this.descricao);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Comprovante> {
  List listItem = ["Conta Corrente", "Conta Popança"];
  DateTime data = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(140, 4, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(140, 4, 40, 1),
        title: Text("Comprovante de Transferência"),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        padding: new EdgeInsets.only(bottom: 20.0),
        child: new Center(
          child: new Form(
            child: new Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Card(
                    color: Color.fromRGBO(244, 185, 207, 1),
                    margin: new EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 1.0, bottom: 5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 4.0,
                    child: new Padding(
                      padding: new EdgeInsets.all(50.0),
                      child: new Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("Para:"),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("${widget.nome}"),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("Banco:"),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("${widget.banco}"),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("Conta:"),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("${widget.conta}"),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("Valor:"),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("${widget.valor}"),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("Data de Transferência:"),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text((DateFormat("dd/MM/yyyy").format(data)),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("Descrição:"),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(("${widget.descricao}"),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ),
                          FlatButton(
                            color: Color.fromRGBO(140, 4, 40, 1),
                            textColor: Colors.white,
                            child: Text('Menu'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Menu()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
