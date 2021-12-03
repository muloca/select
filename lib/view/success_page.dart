import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sucesso'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
              child: Text('Que bom que chegou até aqui'),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  }, 
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Voltar para a página inicial',
                  style: TextStyle(
                    fontSize: 25
                  ),),
                ),),
            ),
          ],
        ),
      ),
    );
  }
}