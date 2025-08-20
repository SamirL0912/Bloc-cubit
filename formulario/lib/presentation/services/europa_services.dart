import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/europa_model.dart';

class EuropaService {
  final String url = "https://api.jsonbin.io/v3/qs/68a65740d0ea881f405eb257";

  Future<List<EuropaModel>> getEuropa() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => EuropaModel.fromJson(json)).toList();
    } else {
      throw Exception("Error al cargar los campeones de Europa League");
    }
  }
}
