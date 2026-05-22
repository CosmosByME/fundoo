import 'package:fundoo/data/models/pie_data.dart';

abstract class PieDataRepository {
  Future<PieData> fetchPieData(int period);
}