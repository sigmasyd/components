//import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Componentes")),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    //menuProvider.opciones;
    // si demora mucho.. podria verse como si la app se congela
    /*menuProvider.cargarData().then((opciones) {
      print('_lista');
      print(opciones);
    });*/

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], // data por default, es opcional
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print(snapshot.data);

        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    /*
    // usamos initialData....
    if (data == null) {
      return [];
    }*/

    data.forEach((opt) {
      final widgetTmp = ListTile(
        title: Text(opt["texto"]),
        //Icon(Icons.account_circle, color: Colors.blue),
        leading: getIcon(opt["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          /*
          // navegacion basica, en este caso no se usara
          final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);
          */

          Navigator.pushNamed(
              context, opt["ruta"]); // debe estar definido en el myapp
        },
      );
      opciones..add(widgetTmp)..add(Divider());
    });
    return opciones;
  }
}
