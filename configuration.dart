import 'package:flutter/material.dart';
import 'package:proyecto_videoteca/singup.dart';
import 'package:proyecto_videoteca/tabla.dart';

class ConfiguracionPage extends StatelessWidget {
  static const id = 'configuracion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TablaInfoPage()),
            );
          },
        ),
        title: Text('Configuración'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFB71C1C),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Tema de la app'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Idioma'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Acerca de'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
