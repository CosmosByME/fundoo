import 'package:fundoo/data/models/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getRecentTransactions();
  Future<List<Transaction>> getTransactionsByPage(int page);
}
