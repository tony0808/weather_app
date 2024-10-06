part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final Color appBarColor;

  const ThemeState({
    this.appBarColor = const Color.fromARGB(255, 98, 98, 98),
  });

  ThemeState copyWith({
    Color? appBarColor,
  }) {
    return ThemeState(appBarColor: appBarColor ?? this.appBarColor);
  }

  @override
  List<Object> get props => [appBarColor];
}
