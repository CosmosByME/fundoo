import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/data/models/pie_data.dart';
import 'package:fundoo/data/repository/pie_data_repository.dart';

class PieDataRepositoryImpl implements PieDataRepository {
  @override
  Future<PieData> fetchPieData(int period) async {
    try {
      final response = await dio.get(
        "/api/v1/Wallet/expense-breakdown",
        queryParameters: {"period": period},
      );

      if (response.statusCode == 200) {
        return PieData.fromJson(response.data["data"]);
      } else {
        throw Exception("Failed to load pie data");
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      final message =
          data?['error']?['message'] ??
              data?['detail'] ??
              e.message ??
              'Unknown error';
      throw Exception(message);
    } catch (e) {
      throw Exception('Error occurred while fetching pie data: $e');
    }
  }
}
