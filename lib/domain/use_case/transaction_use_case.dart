import 'package:fundoo/data/models/transaction.dart';
import 'package:fundoo/domain/repository/transaction_repository_impl.dart';

class TransactionUseCase {
  Future<List<Transaction>> getRecentTransactions() async {
    return await TransactionRepositoryImpl().getRecentTransactions();
  }

  Future<List<Transaction>> getTransactionsByPage(int page) async {
    return await TransactionRepositoryImpl().getTransactionsByPage(page);
  }
}