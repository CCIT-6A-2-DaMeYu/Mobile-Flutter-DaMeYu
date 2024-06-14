import 'package:dio/dio.dart';

class ArtikelAPI {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getArtikel() async {
    try {
      final response = await _dio.get(
        "https://6669a1f32e964a6dfed5f371.mockapi.io/dameyu/artikel",
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(
          response.data.map((dynamic artikel) => artikel as Map<String, dynamic>),
        );
      } else {
        // ignore: avoid_print
        print("Failed to fetch reminders. Status code: ${response.statusCode}");
        return [];
      }
    } catch (error) {
      // ignore: avoid_print
      print("Error fetching reminders: $error");
      return [];
    }
  }
}