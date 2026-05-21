import 'package:dio/dio.dart';
import 'package:fundoo/core/services/dio_service.dart';
import 'package:fundoo/data/models/wallet.dart';
import 'package:fundoo/data/repository/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  @override
  Future<Wallet> getWallet() async {
    try {
      final response = await dio.get("/api/v1/Wallet");
      if (response.statusCode == 200) {
        return Wallet.fromJson(response.data['data']);
      } else {
        throw Exception(
          'Failed to fetch wallet: ${response.statusCode} - ${response.data}',
        );
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
      throw Exception('Error occurred while fetching wallet: $e');
      
    }
  }
}