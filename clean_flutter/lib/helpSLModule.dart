import 'package:clean_flutter/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_flutter/injection_container.dart';
import 'package:get_it/get_it.dart';

extension AddSupportModule on GetIt {
  void addHelpModule() {
    registerFactory(
      () => NumberTriviaBloc(
        concrete: sl(),
        random: sl(),
        inputConverter: sl(),
      ),
    );
  }
}
