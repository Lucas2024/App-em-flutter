import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registrar extends StatefulWidget {


  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {

  TextEditingController usuarioEmail = TextEditingController();
  TextEditingController usuarioSenha = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
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
                    icon: Icon(Icons.email, color: Colors.blue,),
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
              TextFormField(
                controller: usuarioSenha,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock_outline, color: Colors.blue,),
                    labelText: "Senha"
                ),
                validator: (valor){
                  if (valor.isEmpty) {
                    return "Informe a Senha";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                child: Text("Registrar"),
                onPressed: (){
                  if (formkey.currentState.validate()){
                    registrar();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> registrar() async {



    try {
      UserCredential usuario = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: usuarioEmail.text,
        password: usuarioSenha.text
      );
      usuario.credential;

      Navigator.pop(context); // fecha a janela do Loading


    } catch (erro) {
      SnackBar snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao resgatar senha"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);

    }

  }
}
