import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/champions_model.dart';

class ChampionsService {
  final String url = "https://jsonkeeper.com/b/RQ6XE";

  Future<List<ChampionsModel>> getChampions() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ChampionsModel.fromJson(json)).toList();
    } else {
      throw Exception("Error al cargar los campeones de Champions");
    }
  }
}
