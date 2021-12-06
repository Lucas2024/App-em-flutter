import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientesEditar extends StatefulWidget {

  final DocumentSnapshot dadosCliente;
  ClientesEditar(this.dadosCliente);

  //const ClientesEditar({Key key}) : super(key: key);

  @override
  _ClientesEditarState createState() => _ClientesEditarState();
}

class _ClientesEditarState extends State<ClientesEditar> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nomeCliente = TextEditingController();
  TextEditingController emailCliente = TextEditingController();


  @override
  void initState() {
    super.initState();
    if(widget.dadosCliente != null){// se uma alteração
      nomeCliente.text = widget.dadosCliente.data()["nomeCliente"];
      emailCliente.text = widget.dadosCliente.data()["emailCliente"];

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dadosCliente == null ? "Inclusão de Clientes" : "Alteração de Clientes"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Form(
          key:formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: nomeCliente,
                decoration: InputDecoration(
                  labelText: "Nome",
                  hintText: "Informe o Nome"
                ),
                validator: (valor){
                  if (valor.isEmpty){
                    return "Informe o nome";
                  }else {
                    return null;
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: emailCliente,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    hintText: "Informe o E-mail"
                ),
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Informe o e-mail";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("Gravar"),
                    onPressed: (){
                      if (formKey.currentState.validate()){
                        if (widget.dadosCliente == null){ // é uma inclusão
                          FirebaseFirestore.instance.collection("clientes")
                              .add(
                            {
                              "nomeCliente":nomeCliente.text,
                              "emailCliente":emailCliente.text,
                            }
                          );
                        }else{// é uma alteração
                          FirebaseFirestore.instance.collection("clientes")
                          .doc(widget.dadosCliente.id)
                              .update(
                              {
                                "nomeCliente":nomeCliente.text,
                                "emailCliente":emailCliente.text,
                              }
                          );

                        }
                        Navigator.pop(context);
                      }

                    }
                  ),


                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text("Cancelar"),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),

                ],
              )
            ],
          ),

        ]
          ),
      ),
    ),
    );
  }
}
