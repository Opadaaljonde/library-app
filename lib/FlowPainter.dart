import 'dart:ui';

import 'package:flutter/material.dart';

class FlowPainter extends CustomPainter {
  final BuildContext context;
  final ValueNotifier<double> notifier;
  final GlobalKey target;
  final List<Color> colors;
  RenderBox _renderBox;

  FlowPainter({
    @required this.context,
    @required this.notifier,
    @required this.target,
    @required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final screen = MediaQuery.of(context).size;
    if (_renderBox == null) {
      _renderBox = target.currentContext.findRenderObject();
    }
    if (_renderBox == null || notifier == null) return;
    final page = notifier.value.floor();
    final animatorval = notifier.value - page;
    final targetpos = _renderBox.localToGlobal(Offset.zero);
    final xSceal = screen.height * 8, ySceal = xSceal / 2;
    final reverseval = 1 - animatorval;
    var curvedval = Curves.easeInOut.transformInternal(animatorval);

    Paint buttompaint = Paint(), bgpaint = Paint();
    Rect buttomrect, bgrect = Rect.fromLTWH(0, 0, screen.width, screen.height);
    if (animatorval < 0.5) {
      curvedval = Curves.easeInOut.transformInternal(curvedval);
      bgpaint..color = colors[page % colors.length];

      buttompaint..color = colors[(page + 1) % colors.length];
      buttomrect = Rect.fromLTRB(
        targetpos.dx - (xSceal * curvedval),
        targetpos.dy - (ySceal * curvedval),
        targetpos.dx + _renderBox.size.width * reverseval,
        targetpos.dy + _renderBox.size.height + (ySceal * curvedval),
      );
    } else {
      buttompaint..color = colors[page % colors.length];
      bgpaint..color = colors[(page + 1) % colors.length];
      buttomrect = Rect.fromLTRB(
        targetpos.dx + _renderBox.size.width * reverseval,
        targetpos.dy - ySceal * reverseval,
        targetpos.dx + _renderBox.size.width + xSceal * reverseval,
        targetpos.dy + _renderBox.size.height + ySceal * reverseval,
      );
    }
    canvas.drawRect(bgrect, bgpaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(buttomrect, Radius.circular(screen.height)),
      buttompaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
