part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final Color appBarColor;
  final Color backgroundColor;

  const ThemeState({
    this.appBarColor = const Color.fromARGB(255, 98, 98, 98),
    this.backgroundColor = Colors.white,
  });

  ThemeState copyWith({
    Color? appBarColor,
    Color? backgroundColor,
  }) {
    return ThemeState(
      appBarColor: appBarColor ?? this.appBarColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  List<Object> get props => [appBarColor, backgroundColor];
}
