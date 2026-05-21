import 'package:fundoo/data/models/wallet.dart';
import 'package:fundoo/domain/repository/wallet_repository_impl.dart';

class WalletUseCase {
  Future<Wallet> getWallet() async {
    return WalletRepositoryImpl().getWallet();
  }
}
