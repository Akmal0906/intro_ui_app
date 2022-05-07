import 'package:flutter/material.dart';

class FadePage extends StatefulWidget {
  const FadePage({Key? key}) : super(key: key);
  static const String id = 'fade_page';

  @override
  State<FadePage> createState() => _FadePageState();
}

class _FadePageState extends State<FadePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            height: 150,
            width: 150,
            child: Image.asset('assets/images/image_1.png'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _animationController.forward();
        },
      ),
    );
  }
}
