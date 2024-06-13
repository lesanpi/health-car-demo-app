import 'package:flutter/material.dart';

class AnimatedCounterText extends StatefulWidget {
  const AnimatedCounterText({
    required this.finalValue,
    super.key,
    this.duration = const Duration(seconds: 2),
    this.style,
  });

  final int finalValue;
  final Duration duration;
  final TextStyle? style;

  @override
  State<AnimatedCounterText> createState() => _AnimatedCounterTextState();
}

class _AnimatedCounterTextState extends State<AnimatedCounterText>
    with SingleTickerProviderStateMixin {
  late Animation<int> _animacionConteo;
  late AnimationController _controladorAnimacion;

  @override
  void initState() {
    super.initState();

    _controladorAnimacion = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animacionConteo = IntTween(
      begin: 0,
      end: widget.finalValue,
    ).animate(_controladorAnimacion);

    _controladorAnimacion.forward();
  }

  @override
  void dispose() {
    _controladorAnimacion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animacionConteo,
      builder: (context, child) {
        return Text(
          _animacionConteo.value.toString(),
          style: widget.style,
        );
      },
    );
  }
}
