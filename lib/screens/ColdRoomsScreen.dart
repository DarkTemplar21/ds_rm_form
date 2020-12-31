import 'package:ds_richmeat_form/model/ColdRoom.dart';
import 'package:ds_richmeat_form/model/TempForm.dart';
import 'package:ds_richmeat_form/providers/AuthProvider.dart';
import 'package:ds_richmeat_form/widgets/ListCamarasWidget.dart';
import 'package:ds_richmeat_form/widgets/PostFormFloatingActionButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ColdRoomsScreen extends StatefulWidget {
  @override
  _ColdRoomsScreenState createState() => _ColdRoomsScreenState();
}

class _ColdRoomsScreenState extends State<ColdRoomsScreen> {
  final double _fixedWidth = 130.0;
  List<ColdRoom> coldRooms = [];
  TempForm res;
  bool estaCargando = false;
  bool huboError = false;
  bool yaIntenteObtenerFormularioOnline = false;
  String nombreFormulario = '';
  List<ColdRoom> initialColdRooms = [
    ColdRoom(
      id: 0,
      name: 'Andén 1 y 2  (Rango: 8 a 14 °C)',
      temperatureRange: '8 a 14',
    ),
    ColdRoom(
      id: 1,
      name: 'Conservación de MP (Rango: -5 a -20 °C)',
      temperatureRange: '-5 a -20',
    ),
    ColdRoom(
      id: 2,
      name: 'Conservación de PT (Rango: -10 a -23 °C)',
      temperatureRange: '-10 a -23',
    ),
    ColdRoom(
      id: 3,
      name: 'Anden 3 y 4 (Rango: 8 a 14 °C)',
      temperatureRange: '8 a 14',
    ),
    ColdRoom(
      id: 4,
      name: 'Pasillo (Rango: 8 a 14 °C)',
      temperatureRange: '8 a 14',
    ),
    ColdRoom(
      id: 5,
      name: 'Empaque (Rango: 8 a 13 °C)',
      temperatureRange: '8 a 13',
    ),
    ColdRoom(
      id: 6,
      name: 'Preenfriamiento o PT (Rango: 0 a -5 °C)',
      temperatureRange: '0 a -5',
    ),
    ColdRoom(
      id: 7,
      name: 'Proceso (Rango: 8 a 12 °C)',
      temperatureRange: '8 a 12',
    ),
    ColdRoom(
      id: 8,
      name: 'Temperado MP (Rango: 0 a 12 °C)',
      temperatureRange: '0 a 12',
    ),
  ];

  void mostrarSnack(BuildContext context, String texto, MaterialColor color) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(texto),
      backgroundColor: color,
    ));
  }

  void obtenerFormularioDadoId(int id) {
    setState(() {
      estaCargando = true;
    });
    String urlForm =
        'https://rm-form-backend.herokuapp.com/richmeat/form_by_id';
    var _authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );
    http
        .post(
      urlForm,
      headers: {'Authorization': _authProvider.authToken},
      body: "$id",
    )
        .then((response) {
      if (response.statusCode == 200) {
        try {
          print('recibo\n\n\n');
          print(response.body);
          print('\n\n\n');
          res = TempForm.fromJson(response.body);
          coldRooms = res.coldRooms;
        } catch (e) {
          print('un error');
          print(e);
        }
        if (this.mounted) {
          setState(() {
            estaCargando = false;
            huboError = false;
            nombreFormulario = res.createdDate;
          });
        }
      } else {
        mostrarSnack(
            context,
            'Error, los datos no se pudieron obtener\n'
            'intente mas tarde.',
            Colors.red);
      }
    }).catchError((err) {
      print('errrrrror');
      print(err);
      if (this.mounted) {
        setState(() {
          estaCargando = false;
          huboError = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int formId = ModalRoute.of(context).settings.arguments;
    if (formId == null) {
      coldRooms = initialColdRooms;
    } else {
      if (!yaIntenteObtenerFormularioOnline) {
        obtenerFormularioDadoId(formId);
        yaIntenteObtenerFormularioOnline = true;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: nombreFormulario == ''
            ? Text("Camaras de Enfriamiento")
            : ListTile(
                title: Text(
                  "Formulario",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                subtitle: Text(
                  nombreFormulario,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
      ),
      body: SafeArea(
        child: estaCargando
            ? Center(child: CircularProgressIndicator())
            : ListCamarasWidget(fixedWidth: _fixedWidth, coldRooms: coldRooms),
      ),
      floatingActionButton: formId == null
          ? PostFormFloatingActionButton(
              coldRooms: coldRooms,
              estaCargando: estaCargando,
            )
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.print,
                color: Colors.white,
              ),
            ),
    );
  }
}

class ColdRoomRoute extends MaterialPageRoute {
  ColdRoomRoute()
      : super(builder: (context) {
          return ColdRoomsScreen();
        });
}
