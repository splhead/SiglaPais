import 'dart:convert';

import 'package:http/http.dart' as http;

class Requisicao {

  static Future<List> requisicaoPaises() async {

    Map paises = Map();

    String apiUrl = "api.nobelprize.org";

    http.Response response = await http.get(Uri.http(apiUrl, 'v1/country.json'));

    // debugPrint(response.body);

    if (response.statusCode == 200) {
      paises = json.decode(response.body);
      return paises.values.first;
    } else {
      throw Exception("Falhou a requisição");
    }
  }
}
