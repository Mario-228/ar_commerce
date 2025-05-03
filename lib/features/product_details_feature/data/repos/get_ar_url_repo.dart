import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

abstract class GetArUrlRepo {
  Future<Either<Errors, String>> getArUrl({required int productId});
}
