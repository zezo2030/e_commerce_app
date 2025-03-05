import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
