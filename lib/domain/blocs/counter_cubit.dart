import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tools/stamp.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  final String _tag = "CounterCubit";

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    stamp(_tag, "$change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    stamp(_tag, "$error: $stackTrace");
    super.onError(error, stackTrace);
  }
}
