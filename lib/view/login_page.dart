import 'package:flutter/material.dart';
import 'package:select/view/success_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var senha = TextEditingController();
  var email = TextEditingController();

  void _onLoading() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Validando DADOS"),
            ),
          ],
        ),
      );
    },
  );
  new Future.delayed(new Duration(seconds: 2), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage()));
  });
}

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecti Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/login.png'),
                      width: 300,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Seu email'
                      ),
                      validator: (email) {
                        if (email == null || email.isEmpty || !email.contains('@')) {
                          return 'Por favor digite o seu email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                    child: TextFormField(
                      controller: senha,
                      decoration: InputDecoration(
                        hintText: 'Sua senha'
                      ),
                      validator: (senha) {
                        if (senha == null || senha.isEmpty || senha.length < 6) {
                          return 'Por favor digite a sua senha com no mínimo 6 dígitos';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                         _onLoading(); 
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('LOGIN',
                        style: TextStyle(
                          fontSize: 25
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
