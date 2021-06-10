import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PinCodeNumbers extends StatelessWidget {
  final Function onNumberPressed;
  final Function onBackspacePressed;

  PinCodeNumbers({
    @required this.onNumberPressed(int number),
    @required this.onBackspacePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 12,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 2),
      itemBuilder: (context, index) {
        if (index == 9)
          return Center(child: SvgPicture.asset('assets/icons/biometric.svg'));
        if (index == 10) {
          return GestureDetector(
            onTap: () {
              onNumberPressed(0);
            },
            child: Center(
              child: Text(
                '0',
                textScaleFactor: 1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          );
        }
        if (index == 11)
          return GestureDetector(
            onTap: onBackspacePressed,
            child:
                Center(child: SvgPicture.asset('assets/icons/backspace.svg')),
          );
        // return Center(
        //   child: IconButton(
        //       icon: Icon(Icons.backspace_outlined), onPressed: () {}),
        // );
        return GestureDetector(
          onTap: () {
            onNumberPressed(index + 1);
          },
          child: Center(
            child: Text(
              '${index + 1}',
              textScaleFactor: 1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        );
      },
    );
  }
}
