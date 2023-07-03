import 'package:flutter/material.dart';
import 'over_flow_mixin.dart';

class OverFlowAnimation extends StatefulWidget {
  final Widget child;
  final Axis direction;
  final Duration animationDuration, backDuration, pauseDuration;
  final Curve backCurve, startCurve;

  const OverFlowAnimation({
    super.key,
    required this.child,
    this.direction = Axis.horizontal,
    this.animationDuration = const Duration(milliseconds: 6000),
    this.backDuration = const Duration(microseconds: 800),
    this.pauseDuration = const Duration(microseconds: 800),
    this.startCurve = Curves.linear,
    this.backCurve = Curves.bounceInOut,
  })
      : assert(animationDuration > Duration.zero),
  assert(backDuration > Duration.zero);

  @override
  State<OverFlowAnimation> createState() => _OverFlowAnimation();
}

class _OverFlowAnimation extends State<OverFlowAnimation> with OverFlowMixin {
  late Duration animationDuration,backDuration;
  @override
  void initState() {
    super.initState();
    animationDuration = widget.animationDuration;
    backDuration = widget.backDuration;
    if (animationDuration < Duration.zero || backDuration < Duration.zero) {
      throw Exception('Animation delay should not be lees than zero');
    }
    scrollController = ScrollController(initialScrollOffset: 50.0);
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    backCurve = widget.backCurve;
    startCurve = widget.startCurve;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: widget.direction,
      controller: scrollController,
      child: widget.child,
    );
  }

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: widget.animationDuration,
            //start curve
            curve: startCurve);
      }
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(0.0,
            duration: widget.backDuration, curve: backCurve);
      }
    }
  }
}
