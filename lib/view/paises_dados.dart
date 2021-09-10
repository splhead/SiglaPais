import 'package:flutter/material.dart';
import 'package:sigla_pais_app/service/requisicao.dart';

class PaisesDados extends StatefulWidget {

  final String pais;

  PaisesDados(this.pais);

  @override
  _PaisesDadosState createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<PaisesDados> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            future: Requisicao.requisicaoPaises(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                List? paises = snapshot.data;
                return _listaPaises(_filtraPais(widget.pais, paises, context));
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Text(
                      'Carregando...', style: TextStyle(fontSize: 16),),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  List? _filtraPais(String pais, List? paises, BuildContext context) {
    List filtro = [];
    
    if (paises == null) return paises;

    paises.forEach((cadaPais) {
      if (cadaPais["name"].toString().toLowerCase() == pais.toLowerCase()) {
        filtro.add(cadaPais);
      }
    });

    return filtro.isEmpty ? paises: filtro;
  }
}

Widget _listaPaises(List? paises) {
  return paises != null ? Flexible(
      child: ListView.builder(
          itemCount: paises.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                child: ExpansionTile(
                  title: Text("${paises[index]["name"]}", style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("${paises[index]["code"] ?? '--'}", style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold,
                            fontSize: 16
                        )),
                      ),
                    )
                  ],
                ),
              ),
            );
          })
  ) : Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Text('Carregando...', style: TextStyle(fontSize: 16),),
      )
  );
}