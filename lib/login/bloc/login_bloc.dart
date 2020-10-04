import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is StartLoginEvent) {
      try {
        var token = await _login();
        yield LoginConnected(token);
      }
      catch (e) {
        yield LoginNotConnected();
      }
    }
    else {
      yield LoginNotConnected();
    }
  }

  Future<String> _login() async {
    try {

      var authenticationToken = 
        await SpotifySdk.getAuthenticationToken(
          clientId: DotEnv().env['CLIENT_ID'], 
          redirectUrl: "http://localhost:62439/redirect.html", 
          scope: "app-remote-control,user-modify-playback-state,playlist-read-private"
        );

      return authenticationToken;
    }
    catch (e) {
      throw e;
    }
  }
}
