import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _goHome();
    super.initState();
  }

  _goHome() async {
    await Future.delayed(Duration(seconds: 1))
        .then((value) => {Navigator.of(context).pushReplacementNamed('/home')});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/pokeball.png')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image(image: AssetImage('assets/images/pokedex.png'))
          ],
        )),
      ),
    );
  }
}
