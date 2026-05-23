import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/data/models/links.dart';

class LinksRepositoryImpl {
  Future<Links> getLinks() async {
    try {
      final response = await dio.get("/api/v1/Support/links");
      if (response.statusCode == 200) {
        return Links.fromJson(response.data["data"]);
      } else {
        throw Exception("Failed to load links");
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      showErrorToast(message);
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
