import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// Maps a string to a [String] typedef
Either<Failure, T> mapObjectId<T>(dynamic id) {
  try {
    if (id == null) throw const BadRequestException(message: 'Invalid id');
    if (id is ObjectId) return Right(id.oid as T);
    if (id is String) return Right(id as T);
    throw const BadRequestException(message: 'Invalid id');
  } on BadRequestException catch (e) {
    return Left(
      RequestFailure(
        message: e.message,
        statusCode: e.statusCode,
      ),
    );
  }
}
