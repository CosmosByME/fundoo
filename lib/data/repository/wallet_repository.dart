import 'package:fundoo/data/models/wallet.dart';

abstract class WalletRepository {
  Future<Wallet> getWallet();
}