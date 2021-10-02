// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';
part 'user.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;

  ApiReturnValue({this.message, this.value});
}
