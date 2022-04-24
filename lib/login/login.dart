import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://64.media.tumblr.com/abf8e41c954a60c7379207a3d62e9eb6/6c72d1d5f7c29348-fd/s640x960/63f7325452a13a98bf67bb17956d8ef9ecfdc4b7.gifv",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 100, 24, 24),
                  child: Text(
                    "Inicia sesión",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Image.asset(
                //   "assets/icons/app_icon.png",
                //   height: 120,
                // ),
                SizedBox(height: 200),
                MaterialButton(
                  child: Text(
                    "Iniciar sesión con Google",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple[300],
                    ),
                  ),
                  color: Colors.white.withOpacity(0.90),
                  height: 50,
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
