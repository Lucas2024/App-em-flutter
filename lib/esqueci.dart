import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Esqueci extends StatefulWidget {


  @override
  _EsqueciState createState() => _EsqueciState();
}

class _EsqueciState extends State<Esqueci> {

  TextEditingController usuarioEmail = TextEditingController();
  TextEditingController usuarioSenha = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 185, 207, 1),
      appBar: AppBar(
         backgroundColor: Color.fromRGBO(140, 4, 40, 1),
        title: Text("Recuperar senha"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: usuarioEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    icon: Icon(Icons.email, color: Color.fromRGBO(140, 4, 40, 1),),
                    labelText: "E-Mail"
                ),
                validator: (valor){
                  if (valor.isEmpty) {
                    return "Informe o E-Mail";
                  } else if (!usuarioEmail.text.contains("@")) {
                    return "Informe um E-Mail válido !";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(140, 4, 40, 1), // background
                ),
                  child: Text("Recupera Senha"),
                onPressed: (){
                    if(formkey.currentState.validate()){
                      resgatar();
                    }
                },

              )

            ],
          ),
        ),
      ),
    );
  }
  Future<void> resgatar() async {



    try {
     await FirebaseAuth.instance.sendPasswordResetEmail(email:usuarioEmail.text);

      Navigator.pop(context); // fecha a janela do Loading


    } catch (erro) {
      SnackBar snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao resgatar senha"),
      );
      //scaffolfKey.currentState.showSnackBar(snackbar);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

    }

  }
}
