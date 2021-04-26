import 'package:flutter/material.dart';
import 'package:personal_web/models/typewriter.dart';

class SkillBox extends StatefulWidget {
  final String name;
  final Color color;
  final bool isMobile, seen;
  final double score;
  final int waitTime;

  const SkillBox(
      {this.name,
      this.color = Colors.white,
      this.isMobile = false,
      this.score = 0,
      this.seen = false,
      this.waitTime = 0});
  @override
  _SkillBoxState createState() => _SkillBoxState();
}

class _SkillBoxState extends State<SkillBox> with TickerProviderStateMixin {
  double widgetWidth, insideWidgetWidth, space;
  bool start;
  @override
  void initState() {
    super.initState();
    if (widget.seen) {
      start = true;
      widgetWidth = 200;
      insideWidgetWidth = widget.score * 2;
    } else {
      start = false;
      widgetWidth = 0;
      insideWidgetWidth = 0;
    }

    if (widget.name == 'Dart    ') {
      space = 7.0;
    } else if (widget.name == 'PhP      ') {
      space = 8.5;
    } else if (widget.name == 'Git      ') {
      space = 9;
    } else if (widget.name == 'MySQL ') {
      space = 6.5;
    } else if (widget.name == 'Linux  ') {
      space = 11.5;
    } else if (widget.name == 'HTML   ') {
      space = 8;
    } else {
      space = 5;
    }

    startWidget();
    //updateValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (start)
          Typewriter(
            widget.name,
            animate: true,
            duration: Duration(seconds: widget.seen ? 0 : 1),
            textStyle: TextStyle(
              color: widget.color,
              fontSize: widget.name == 'Selenium' ? 12.5 : 15,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
            ),
            onEnd: () {
              if (mounted) {
                updateValues();
              }
            },
          ),
        SizedBox(
          width: space,
        ),
        AnimatedContainer(
          duration: Duration(seconds: widget.seen ? 0 : 1),
          decoration: BoxDecoration(
              color: Color(0xfffafafa), borderRadius: BorderRadius.circular(8)),
          height: 17.5,
          width: widgetWidth,
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 2.5,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: widget.seen ? 0 : 1),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6)),
                  height: 12.5,
                  width: insideWidgetWidth,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  startWidget() async {
    if (!widget.seen) {
      await Future.delayed(Duration(seconds: widget.waitTime));
      setState(() {
        start = true;
      });
    }
  }

  updateValues() async {
    setState(() {
      widgetWidth = 200;
    });
    if (!widget.seen) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        insideWidgetWidth = widget.score * 2;
      });
    }
  }
}
