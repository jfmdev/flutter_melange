import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(false);

  void toggle() => emit(!this.state);

  @override
  bool fromJson(Map<String, dynamic> json) => json['value'] as bool;

  @override
  Map<String, bool> toJson(bool state) => {'value': state};
}
