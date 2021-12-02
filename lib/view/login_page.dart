import 'package:flutter/material.dart';
import 'package:select/view/success_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
  new Future.delayed(new Duration(seconds: 3), () {
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
                      decoration: InputDecoration(
                        hintText: 'Seu email'
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor digite o seu email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Sua senha'
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor digite a sua senha';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _onLoading,
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
