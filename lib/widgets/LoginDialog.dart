import 'package:ds_richmeat_form/screens/FormMenuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginDialog extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool login(BuildContext context) {
    if (userController.text == "" && passwordController.text == "") {
      print("pepe");
      Navigator.pop(context);
      Navigator.push(context,FormMenuRoute());

    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xddx"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Usuario"),
                controller: userController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Contraseña"),
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                      ),
                      Text("Mantenerme Logeado"),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      login(context);
                    },
                    child: Text("Entrar"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginRoute extends MaterialPageRoute<bool> {
  LoginRoute(): super (builder : (context) {
    return LoginDialog();
  });
}
