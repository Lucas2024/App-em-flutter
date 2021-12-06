import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comprovante.dart';

void main() {
  runApp(MaterialApp(
    home: Transferencia(),
  ));
}

class Transferencia extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Transferencia> {
  TextEditingController txtnome = TextEditingController();
  TextEditingController txtbanco = TextEditingController();
  TextEditingController txtconta = TextEditingController();
  TextEditingController txtvalor = TextEditingController();
  TextEditingController txtdescricao = TextEditingController();

  void Salvar() {
    String nome;
    String banco;
    String conta;
    String valor;
    String descricao;

    setState(() {
      nome = txtnome.text;
      banco = txtbanco.text;
      conta = txtconta.text;
      valor = txtvalor.text;
      descricao = txtdescricao.text;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Comprovante(nome, banco, conta, valor, descricao)));
    });
  }

  String valueChoose;
  List listItem = ["Conta Corrente", "Conta Popança"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 185, 207, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(140, 4, 40, 1),
          title: Text("Transferência"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Para quem deseja transferir ? ",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    hint: Text("Selecione a conta: "),
                    dropdownColor: Colors.grey,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 22),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
              ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Nome',
                ),
                keyboardType: TextInputType.text,
                controller: txtnome,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
              ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Banco',
                ),
                keyboardType: TextInputType.text,
                controller: txtbanco,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
              ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Conta',
                ),
                keyboardType: TextInputType.text,
                controller: txtconta,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
              ),

              Text("Quanto deseja transfêrir ?",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Valor',
                ),
                keyboardType: TextInputType.text,
                controller: txtvalor,
              ),
              Text("Saldo disponivel em conta:RS 1.500,00"),
              Text("Limite diário disponível:RS 20.000"),
  
              
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text("Deseja identificar essa transferência?",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Descrição',
                ),
                keyboardType: TextInputType.text,
                controller: txtdescricao,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              FlatButton(
                  child: const Text('Transferir'),
                  minWidth: 5000,
                  color: Color.fromRGBO(140, 4, 40, 1),
                  textColor: Colors.white,
                  splashColor: Colors.red,
                  onPressed: Salvar),

              // Text("Corpo dos Proventos ", style: TextStyle(color: Colors.blue)),
            ],
          ),
        ));
  }
}
