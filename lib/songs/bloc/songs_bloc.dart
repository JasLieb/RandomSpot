import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc() : super(SongsInitial());

  @override
  Stream<SongsState> mapEventToState(
    SongsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
