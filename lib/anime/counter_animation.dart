import 'package:flutter/material.dart';

class CounterAnimator extends StatefulWidget {
  @override
  _CounterAnimatorState createState() => _CounterAnimatorState();
}

class _CounterAnimatorState extends State<CounterAnimator> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,
      duration: Duration(seconds: 3)
    );
    super.initState();
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.addListener(() {
      this.setState(() {
        _counter++;
        print(_counter);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        _controller.isAnimating ?
        (_counter).toStringAsFixed(2)
            : "Let's begin",
        style: TextStyle(
          fontSize: 24 * _controller.value + 16
        ),
      ),
      onTap: (){
        _controller.forward(from: 0.0);
      },
    );
  }
}
