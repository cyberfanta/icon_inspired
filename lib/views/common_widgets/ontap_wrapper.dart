import 'package:flutter/material.dart';

class OnTapWrapper extends StatelessWidget {
  const OnTapWrapper({
    Key? key,
    required this.widgetToWrap,
    this.actionsToDo,
  }) : super(key: key);

  final Widget widgetToWrap;
  final VoidCallback? actionsToDo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: actionsToDo,
      child: widgetToWrap,
    );
  }
}
