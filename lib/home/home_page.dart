import 'package:find_track_app/content/favourites/favourites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

double opacity = 0;
double radius = 0;

bool hearing = false;
bool show = true;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String msg = "Toque para escuchar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                msg,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          show
              ? CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  child: Container(
                    width: 200,
                    height: 200,
                    child: IconButton(
                      icon: Icon(
                        Icons.hearing_rounded,
                        size: 90,
                        color: Colors.grey[850],
                      ),
                      onPressed: () {
                        setState(() {
                          hearing = true;
                          show = false;
                          msg = ("Escuchando...");
                        });
                      },
                    ),
                  ),
                )
              : SizedBox(),
          hearing
              ? PulsatingCircleIconButton(
                  onTap: () {
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.hearing_rounded,
                    color: Colors.deepPurple,
                    size: 90,
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 140,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.grey[850],
                  highlightColor: Colors.purple,
                  focusColor: Colors.deepPurple,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavouritesPage(),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(
                width: 40,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.logout),
                  color: Colors.grey[850],
                  highlightColor: Colors.purple,
                  focusColor: Colors.deepPurple,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(
                          'Cerrar sesión',
                          style: TextStyle(
                              fontSize: 20, color: Colors.deepPurple[100]),
                        ),
                        content: Text(
                            "Está a punto de cerrar sesión ¿Desea continuar?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancelar'),
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.deepPurple[100]),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignOutEvent(),
                              );
                              Navigator.pop(context, 'Ok');
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.deepPurple[100]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//Animation
class PulsatingCircleIconButton extends StatefulWidget {
  const PulsatingCircleIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final Icon icon;

  @override
  _PulsatingCircleIconButtonState createState() =>
      _PulsatingCircleIconButtonState();
}

class _PulsatingCircleIconButtonState extends State<PulsatingCircleIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween(begin: 0.0, end: 24.0).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOutCubicEmphasized)
        ..addListener(() {
          setState(() {
            opacity = _animationController.value / 2;
            radius = _animationController.value * 3;
          });
        }),
    );
    _animationController.repeat(
      reverse: true,
    );
    _animationController.addStatusListener(
      (status) {
        //print(status);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Ink(
            width: 200,
            height: 200,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                for (int i = 1; i <= 2; i++)
                  BoxShadow(
                    color: Colors.purple.withOpacity(
                      opacity.toDouble() / 2,
                    ),
                    spreadRadius: radius.toDouble() * i * 12,
                  ),
              ],
            ),
            child: widget.icon,
          );
        },
      ),
    );
  }
}
