import 'package:fundoo/data/models/pie_data.dart';
import 'package:fundoo/domain/repository/pie_data_repository_impl.dart';

class PieDataUseCase {
  Future<PieData> getPieData(int period) {
    return PieDataRepositoryImpl().fetchPieData(period);
  }
}