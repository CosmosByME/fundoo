import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/core/toasts/error_toast.dart';
import 'package:fundoo/data/models/transaction.dart';
import 'package:fundoo/data/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<List<Transaction>> getRecentTransactions() async {
    try {
      final response = await dio.get("/api/v1/Transactions/recent", queryParameters: {"count": 4});
      if (response.statusCode == 200) {
        List data = response.data["data"] as List;
        return data.map((json) => Transaction.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load recent transactions");
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

  @override
  Future<List<Transaction>> getTransactionsByPage(int page) async {
    try {
      final response = await dio.get("/api/v1/Transactions", queryParameters: {"pageSize": 15, "page": page});
      if (response.statusCode == 200) {
        List data = response.data["data"]["items"] as List;
        return data.map((json) => Transaction.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load transactions for page $page");
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