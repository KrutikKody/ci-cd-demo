import 'package:flutter/material.dart';


class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    instructionStep(
                      stepNumber: '1',
                      instructionText: 'Click on "Check Credit Health Now" button.Grahak will receive a link to check the credit health on his mobile number.',
                    ),

                    instructionStep(
                      stepNumber: '2',
                      instructionText: 'Select grahak and enter grahak\'s details and then click \'Send Link to Grahak\' button.',
                    ),
                    instructionStep(
                      stepNumber: '3',
                      instructionText: 'Grahak will receive a link to check the credit health on his mobile number.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    ));
  }

  Widget instructionStep({required String stepNumber, required String instructionText}) {
    final GlobalKey key = GlobalKey();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              key: key,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(stepNumber.toString()),
              ),
            ),
            const SizedBox(width: 10.0),
            Flexible(
              child: Text(
                instructionText,
                style: const TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(left: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final RenderBox? textRenderBox = key.currentContext?.findRenderObject() as RenderBox?;
              final double textHeight = textRenderBox?.size.height ?? 0.0;
              return DottedLine(height: textHeight);
            },
          ),
        ),
      ],
    );
  }
}

class DottedLine extends StatelessWidget {
  final double height;

  const DottedLine({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedLinePainter(),
      size: Size(1.0, height),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dotSize = 3.0;
    const double space = 4.0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = dotSize;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawCircle(Offset(size.width / 2, startY), dotSize / 2, paint);
      startY += dotSize + space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}





