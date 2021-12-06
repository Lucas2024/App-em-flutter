
import 'package:cadastros/comprovante.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home:Valor(),
  ));
}

class Valor extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Valor> {
  TextEditingController nome = TextEditingController();
  TextEditingController banco = TextEditingController();
  TextEditingController conta = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController descricao = TextEditingController();
  String campoNomeEmail = "";
  String resumoTexto = "";
  String valueChoose;
  List listItem = [
    "Conta Corrente", "Conta Popança"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dados"),
            bottom: TabBar(
              onTap: (int selecionado){
                if (selecionado==2){
                  double resultado;
                  resultado = double.parse(nome.text)-double.parse(conta.text)-double.parse(conta.text);

                  setState(() {
                    resumoTexto = "Resultado da soma:" + resultado.toString();
                    campoNomeEmail = "Resultado da soma:" + resultado.toString();
                  });
                }
              },

              tabs: [

                Tab(
                  //icon: Icon(Icons.monetization_on),
                  text: "2",
                ),

                Tab(
                  // icon: Icon(Icons.table_chart),
                  text: "3",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [

              valorr(),
              resumo(),
            ],
          ),
        )
    );
  }

  Widget valorr(){
    return  SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quanto deseja transfêrir ?"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Valor',
            ),
            keyboardType: TextInputType.text,
            controller: valor,
          ),
          Text("Saldo disponivel em conta: ..."),
          Text("Limite diário disponível:RS 20.000"),

          Text("Qual é a origem do recurso ?"),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color:Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: DropdownButton(
                hint: Text("Selecione a conta: "),
                dropdownColor: Colors.grey,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22
                ),
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
          Text("Deseja identificar essa transferência?"),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Descrição',
            ),
            keyboardType: TextInputType.text,
            controller: descricao,
          ),
          FlatButton(
            child: const Text('Avançar'),
            minWidth: 5000,
            color: Colors.pink,
            splashColor: Colors.red,
            onPressed: () {
            }
             

          ),

          // Text("Corpo dos Proventos ", style: TextStyle(color: Colors.blue)),

        ],
      ),
    );
  }


  Widget resumo(){
    return  SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(resumoTexto),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Nome',
            ),
            keyboardType: TextInputType.text,
            controller: nome,
          ),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Banco',
            ),
            keyboardType: TextInputType.text,
            controller: banco,
          ),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Conta',
            ),
            keyboardType: TextInputType.text,
            controller: conta,
          ),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Valor',
            ),
            keyboardType: TextInputType.text,
            controller: valor,
          ),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Descrição',
            ),
            keyboardType: TextInputType.text,
            controller: descricao,
          ),
          //Text("Corpo do resumo ", style: TextStyle(color: Colors.blue)),

        ],
      ),
    );
  }


}





