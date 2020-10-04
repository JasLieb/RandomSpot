
import 'package:RandomSpot/login/bloc/login_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(StartLoginEvent()),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if(state is LoginNotConnected) {
            return Text("You aren't connected to Spotify :(");
          } 
          else if(state is LoginConnected) {
            return Text("You are connected to Spotify :D\n" + state.token);
          } 
          else 
            return Text("SplashScreen");
        }
      )
    );
  }
}