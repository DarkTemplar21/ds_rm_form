import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AuthProvider.dart';

class DrawerProvider with ChangeNotifier {
  Drawer dameDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset("assets/img/app_icon.png"),
            accountName: Text(Provider.of<AuthProvider>(
              context,
              listen: false,
            ).nombre),
            accountEmail: Text("email@richmeat.com"),
            otherAccountsPictures: [
              Image.asset("assets/img/temperature_form.png"),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    "Formularios",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/form");
                    },
                    title: Text("Revisados"),
                    leading: Image.asset("assets/img/temperature_form.png"),
                  ),
                ),
                ListTile(
                  title: Text("Pendientes a Revisar"),
                  leading: Image.asset("assets/img/temperature_form.png"),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Text(
                    "Acerca De",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
