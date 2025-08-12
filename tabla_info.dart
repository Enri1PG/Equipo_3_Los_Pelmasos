import 'package:flutter/material.dart';

class Pelicula {
  final int id;
  final String nombre;
  final String autor;
  final String duracion;
  final String genero;

  Pelicula({
    required this.id,
    required this.nombre,
    required this.autor,
    required this.duracion,
    required this.genero,
  });
}

class TablaInfoPage extends StatefulWidget {
  @override
  State<TablaInfoPage> createState() => _TablaInfoPageState();
}

class _TablaInfoPageState extends State<TablaInfoPage> {
  List<Pelicula> peliculas = [
    Pelicula(id: 1, nombre: "Matrix", autor: "Wachowski", duracion: "2:16", genero: "Ciencia Ficción"),
    Pelicula(id: 2, nombre: "Titanic", autor: "James Cameron", duracion: "3:14", genero: "Romance"),
    Pelicula(id: 3, nombre: "El Padrino", autor: "Francis Ford Coppola", duracion: "2:55", genero: "Drama"),
  ];

  int? selectedRow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Videoteca')),
      body: Row(
        children: [
          // Tabla de películas
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Autor')),
                  DataColumn(label: Text('Duración')),
                  DataColumn(label: Text('Género')),
                ],
                rows: peliculas.map((pelicula) {
                  final isSelected = selectedRow == pelicula.id;
                  return DataRow(
                    selected: isSelected,
                    onSelectChanged: (selected) {
                      setState(() {
                        selectedRow = pelicula.id;
                      });
                    },
                    cells: [
                      DataCell(Text(pelicula.id.toString())),
                      DataCell(Text(pelicula.nombre)),
                      DataCell(Text(pelicula.autor)),
                      DataCell(Text(pelicula.duracion)),
                      DataCell(Text(pelicula.genero)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          // Botones a la derecha
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para buscar película
                    showDialog(
                      context: context,
                      builder: (context) {
                        String busqueda = '';
                        return AlertDialog(
                          title: Text('Buscar Película'),
                          content: TextField(
                            decoration: InputDecoration(hintText: 'Nombre de la película'),
                            onChanged: (value) => busqueda = value,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedRow = peliculas.firstWhere(
                                    (p) => p.nombre.toLowerCase() == busqueda.toLowerCase(),
                                    orElse: () => peliculas[0],
                                  ).id;
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Buscar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Buscar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 50),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para agregar película
                    showDialog(
                      context: context,
                      builder: (context) {
                        String nombre = '', autor = '', duracion = '', genero = '';
                        return AlertDialog(
                          title: Text('Agregar Película'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: InputDecoration(labelText: 'Nombre'),
                                onChanged: (v) => nombre = v,
                              ),
                              TextField(
                                decoration: InputDecoration(labelText: 'Autor'),
                                onChanged: (v) => autor = v,
                              ),
                              TextField(
                                decoration: InputDecoration(labelText: 'Duración'),
                                onChanged: (v) => duracion = v,
                              ),
                              TextField(
                                decoration: InputDecoration(labelText: 'Género'),
                                onChanged: (v) => genero = v,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  peliculas.add(Pelicula(
                                    id: peliculas.length + 1,
                                    nombre: nombre,
                                    autor: autor,
                                    duracion: duracion,
                                    genero: genero,
                                  ));
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Agregar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Agregar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 50),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: selectedRow == null
                      ? null
                      : () {
                          // Lógica para modificar película
                          final pelicula = peliculas.firstWhere((p) => p.id == selectedRow);
                          String nombre = pelicula.nombre;
                          String autor = pelicula.autor;
                          String duracion = pelicula.duracion;
                          String genero = pelicula.genero;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Modificar Película'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(labelText: 'Nombre'),
                                      controller: TextEditingController(text: nombre),
                                      onChanged: (v) => nombre = v,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(labelText: 'Autor'),
                                      controller: TextEditingController(text: autor),
                                      onChanged: (v) => autor = v,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(labelText: 'Duración'),
                                      controller: TextEditingController(text: duracion),
                                      onChanged: (v) => duracion = v,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(labelText: 'Género'),
                                      controller: TextEditingController(text: genero),
                                      onChanged: (v) => genero = v,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        final index = peliculas.indexWhere((p) => p.id == selectedRow);
                                        peliculas[index] = Pelicula(
                                          id: pelicula.id,
                                          nombre: nombre,
                                          autor: autor,
                                          duracion: duracion,
                                          genero: genero,
                                        );
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Modificar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                  child: Text('Modificar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 50),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: selectedRow == null
                      ? null
                      : () {
                          setState(() {
                            peliculas.removeWhere((p) => p.id == selectedRow);
                            selectedRow = null;
                          });
                        },
                  child: Text('Eliminar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 50),
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
