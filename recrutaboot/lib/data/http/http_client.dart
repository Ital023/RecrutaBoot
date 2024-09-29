import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class IHttpClient{
  Future get({required String url});
  Future put({required String url});
  Future post({required String url, required Map<String, dynamic> body});
  Future delete({required String url});

}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<http.Response> get({required String url}) async {
    try {
      final response = await client.get(Uri.parse(url));
      
      if (response.statusCode != 200) {
        throw Exception('Falha ao carregar dados: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      print("Erro ao fazer a requisição: $e");
      rethrow;
    }
  }
  
  @override
  Future<http.Response> put({required String url}) async {
    try {
      final response = await client.put(Uri.parse(url));
      
      if (response.statusCode != 204) {
        throw Exception('Falha ao carregar dados: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      print("Erro ao fazer a requisição: $e");
      rethrow;
    }
  }
  
  @override
  Future<http.Response> post({required String url, required Map<String, dynamic> body}) async {
    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      
      if (response.statusCode != 201) {
        throw Exception('Falha ao enviar dados: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      print("Erro ao fazer a requisição POST: $e");
      rethrow;
    }
  }
  
   @override
  Future<http.Response> delete({required String url}) async {
    try {
      final response = await client.delete(Uri.parse(url));
      
      if (response.statusCode != 204) {
        throw Exception('Falha ao carregar dados: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      print("Erro ao fazer a requisição: $e");
      rethrow;
    }
  }


}