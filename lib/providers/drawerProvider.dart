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
            currentAccountPicture: Image.asset("assets/img/usuario.png"),
            accountName: Text(Provider.of<AuthProvider>(
              context,
              listen: false,
            ).nombre),
            accountEmail: Text("email@richmeat.com"),
            otherAccountsPictures: [
              Image.asset("assets/img/usuario.png"),
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8),
                //   child: ListTile(
                //     onTap: () {
                //       // Navigator.popAndPushNamed(context, "/formMenu");
                //       Navigator.pop(context);
                //     },
                //     title: Text("Inicio"),
                //     leading: Image.asset("assets/img/docs/doc_richmeat.png"),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/form");
                    },
                    title: Text("Por Revisar"),
                    leading: Image.asset("assets/img/docs/doc_creado.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/form");
                    },
                    title: Text("Revisados"),
                    leading: Image.asset("assets/img/docs/doc_revisado.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/form");
                    },
                    title: Text("Impresos"),
                    leading: Image.asset("assets/img/docs/doc_impreso.png"),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    "Acerca De",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                  child: ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "/form");
                    },
                    title: Text(
                      "DUSSEWI",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'Aplicaciones por encargo.',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    leading: Image.asset(
                      "assets/img/logo_dussewi.png",
                      width: 40,
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
