import 'package:cadastros/main.dart';
import 'package:cadastros/tela_transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'clientes.dart';

void main() => runApp(Menu());

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking',
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  Widget _rowsButton(
    String imagemEsquerda,
    String textoEsquerda,
    void Function() onTapEsquerda,
    String imagemDireita,
    String textoDireita,
    void Function() onTapDireita,
  ) {
    return Row(
      children: [
        Expanded(
          child: _containerButton(imagemEsquerda, textoEsquerda, onTapEsquerda),
        ),
        if(imagemDireita != null)...[SizedBox(width: 20),
        Expanded(
          child: _containerButton(imagemDireita, textoDireita, onTapDireita),
        ),]
        
      ],
    );
  }

  Widget _containerButton(String imagem, String texto, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagem,
              height: 50,
              width: 50,
            ),
            SizedBox(height: 10),
            Text(texto),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 185, 207, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(140, 4, 40, 1),
        title: Text('Menu Easier'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print('Clicou');
            },
            icon: Image.asset(
              'assets/logo.png',
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowsButton(
                    'assets/conta_corrente.png',
                    'Conta Corrente',
                    () {
                      print('Ae');
                    },
                    'assets/transferencia.png',
                    'Transferência',
                    () {
                      onPressed:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transferencia()));
                    }),
                SizedBox(height: 30),
                _rowsButton(
                  'assets/cartao_credito.png',
                  'Cartão de Credito',
                  null,
                  'assets/emprestimo.png',
                  'Emprestimo',
                  null,
                ),
                SizedBox(height: 30),
                _rowsButton(
                  'assets/investimentos.png',
                  'Investimentos',
                  null,
                  'assets/seguros.png',
                  'Seguros',
                  null,
                ),
                 SizedBox(height: 30),
                _rowsButton(
                  'assets/desfazer.png',
                  'Saír',   
                  () {
                      onPressed:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()));
                    },         
                  null,
                  null,null,
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
