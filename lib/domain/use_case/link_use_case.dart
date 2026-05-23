import 'package:fundoo/data/models/links.dart';
import 'package:fundoo/domain/repository/links_repository_impl.dart';

class LinkUseCase {
  Future<Links> getLinks() async {
    final repository = LinksRepositoryImpl();
    return await repository.getLinks();
  }
}