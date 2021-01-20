import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/Header.dart';
import '../components/nav.dart';
import '../components/timeline.dart';
import '../constants.dart';

class PatientDetail extends StatelessWidget {
  final String data;
  const PatientDetail({
    Key key,
    this.data,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

      child: _SuccessTimeline(),
    );
  }
}




class _SuccessTimeline extends StatefulWidget {
  @override
  _SuccessTimelineState createState() => _SuccessTimelineState();
}

class _SuccessTimelineState extends State<_SuccessTimeline> {
  List<Step> _steps;

  @override
  void initState() {
    _steps = _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,

      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          //accentColor: const Color(0xFFFCB69F).withOpacity(0.2),
          accentColor: docbarbk,
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: docbarbk1,
            body: Center(
              child: Column(
                children: <Widget>[
                  Header(
                    title:'Dr First name'
                  ),
                  nav(
                    left:'Back',
                    right:'Patient Profile',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    onPressed1:() {
                      Navigator.of(context).pushNamed('/patientprofile',arguments:"checking");
                    },
                    visible: true,
                  ),
                  Expanded(child: timeline()),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  List<Step> _generateData() {
    return <Step>[
      const Step(
        step: 1,
        title: 'Dec 1',
        message:
        'Blood Pressure checked. Normal"',
      ),
      const Step(
        step: 2,
        title: 'Dec 1',
        message:
        'Blood Pressure checked. Normal"',
      ),
      const Step(
        step: 3,
        title: 'Dec 1',
        message:
        'Blood Pressure checked. Normal"',),
      const Step(
        step: 4,
        title: 'Dec 1',
        message:
        'Blood Pressure checked. Normal"',),
      const Step(
        step: 5,
        title: 'Dec 1',
        message:
        'Blood Pressure checked. Normal"',),
      const Step(
        step: 6,
        title: 'Dec 1',
        message:
        'Blood Pressure checked. Normal"',),
      const Step(
        step: 7,
        title: 'Dec 1',
        message:
        'Blood Pressure checked. Normal"',),
    ];
  }
}

class _TimelineSteps extends StatelessWidget {
  const _TimelineSteps({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          if (index.isOdd)
            return const TimelineDivider(
              color: Color(0xFFCB8421),
              thickness: 5,
              begin: 0.1,
              end: 0.9,
            );

          final int itemIndex = index ~/ 2;
          final Step step = steps[itemIndex];

          final bool isLeftAlign = itemIndex.isEven;

          final child = _TimelineStepsChild(
            title: step.title,
            subtitle: step.message,
            isLeftAlign: isLeftAlign,
          );

          final isFirst = itemIndex == 0;
          final isLast = itemIndex == steps.length - 1;
          double indicatorY;
          if (isFirst) {
            indicatorY = 0.2;
          } else if (isLast) {
            indicatorY = 0.8;
          } else {
            indicatorY = 0.5;
          }

         return TimelineTile(
            alignment: TimelineAlign.manual,
            endChild: isLeftAlign ? child : null,
            startChild: isLeftAlign ? null : child,
            lineXY: isLeftAlign ? 0.1 : 0.9,
            isFirst: isFirst,
            isLast: isLast,
            indicatorStyle: IndicatorStyle(
              width: 40,
              height: 40,
              indicatorXY: indicatorY,
              indicator: _TimelineStepIndicator(step: '${step.step}'),
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFCB8421),
              thickness: 5,
            ),
          );

        },
        childCount: max(0, steps.length * 2 - 1),
      ),
    );
  }
}

class _TimelineStepIndicator extends StatelessWidget {
  const _TimelineStepIndicator({Key key, this.step}) : super(key: key);

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFCB8421),
      ),
      child: Center(
        child: Text(
          step,
          style: GoogleFonts.architectsDaughter(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TimelineStepsChild extends StatelessWidget {
  const _TimelineStepsChild({
    Key key,
    this.title,
    this.subtitle,
    this.isLeftAlign,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isLeftAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isLeftAlign
          ? const EdgeInsets.only(right: 32, top: 16, bottom: 16, left: 10)
          : const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment:
        isLeftAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.acme(
              fontSize: 22,
              color: const Color(0xFFB96320),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.architectsDaughter(
              fontSize: 16,
              color: const Color(0xFFB96320),
            ),
          ),
        ],
      ),
    );
  }
}




class Step {
  const Step({
    this.step,
    this.title,
    this.message,
  });

  final int step;
  final String title;
  final String message;
}