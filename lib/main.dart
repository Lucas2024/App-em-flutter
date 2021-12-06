import 'package:cadastros/esqueci.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //FirebaseFirestore.instance.collection("clientes").doc().set({"nomeCliente":"Veja Fernanda, bufou  !","emailCliente":"fer@teste.com.br"});

  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController usuarioEmail = TextEditingController();
  TextEditingController usuarioSenha = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 185, 207, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(140, 4, 40, 1),
        centerTitle: true,
        title: Text("Easier Bank"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [            
            TextFormField(
              controller: usuarioEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.email, color: Color.fromRGBO(140, 4, 40, 1)),
                  labelText: "E-Mail"),
              validator: (valor) {
                if (valor.isEmpty) {
                  return "Informe o E-Mail";
                } else if (!usuarioEmail.text.contains("@")) {
                  return "Informe um E-Mail válido !";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: usuarioSenha,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline,
                      color: Color.fromRGBO(140, 4, 40, 1)),
                  labelText: "Senha"),
              validator: (valor) {
                if (valor.isEmpty) {
                  return "Informe a Senha";
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(140, 4, 40, 1), // background
                ),
                onPressed: () {
                  logar();
                },
                child: Text("Logar")),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                   style: TextButton.styleFrom(
                  primary: Color.fromRGBO(140, 4, 40, 1), // background
                
                ),
                  child: Text("Esqueci minha senha"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Esqueci()),
                    );
                  },
                ),
               
              ],
            )
            // ElevatedButton(
            //onPressed: (){
            // Navigator.push(context,
            // MaterialPageRoute(builder: (context) => Menu()));

            // },
            //  child: Text("Menu")
            // )
          ],
        ),
      ),
    );
  }

  Future<void> logar() async {
    loading();

    try {
      UserCredential usuario = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usuarioEmail.text, password: usuarioSenha.text);
      Navigator.pop(context); // fecha a janela do Loading
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Menu()),
      );
    } catch (erro) {
      Navigator.pop(context); // fecha a janela do Loading
      SnackBar snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao Fazer Login"),
      );
      //scaffolfKey.currentState.showSnackBar(snackbar);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  void loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0),
          child: new Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: EdgeInsets.all(10),
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                SizedBox(
                  width: 30,
                ),
                new Text(" Verificando ..."),
              ],
            ),
          ),
        );
      },
    );
  }
}
