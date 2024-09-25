import 'package:http/http.dart' as http;

abstract class IHttpClient{
  Future get({required String url});
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<http.Response> get({required String url}) async {
    try {
      final response = await client.get(Uri.parse(url));

      print("Status da resposta: ${response.statusCode}");
      
      if (response.statusCode != 200) {
        throw Exception('Falha ao carregar dados: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      print("Erro ao fazer a requisição: $e");
      rethrow;
    }
  }
}