part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {

  const ThemeEvent();
  
  @override
  List<Object> get props => [];
}

class ThemeChangeAppBarColorEvent extends ThemeEvent {
  final Color appBarColor;

  const ThemeChangeAppBarColorEvent(this.appBarColor);
}
