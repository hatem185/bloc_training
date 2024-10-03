import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeState { light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(super.initialState);
}
