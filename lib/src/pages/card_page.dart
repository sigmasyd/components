import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cards"),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(
              height: 30,
            ),
            _cardTipo2(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Soy el titulo de esta tarjeta"),
            subtitle: Text(
                "Aqui estamos con la descripcion de la tarjeta que quiero que ustedes vean para tener una idea de lo que deseo mostrarles y listo."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/ec/01/3c/ec013c54a665bb6b38fb0390e2987b80.jpg"),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover),
          /*Image(
            image: NetworkImage(
                "https://i.pinimg.com/originals/ec/01/3c/ec013c54a665bb6b38fb0390e2987b80.jpg"),
          ),*/
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text("naasds dassasadsa dsad d adas das sd d asdada a")),
        ],
      ),
    );

    return Container(
        child: ClipRRect(
          child: card,
          borderRadius: BorderRadius.circular(30.0),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]));
  }
}
