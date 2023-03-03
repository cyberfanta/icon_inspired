import 'package:flutter/material.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({Key? key}) : super(key: key);

  static const routeName = '/MainMenuView';

  @override
  MainMenuViewState createState() => MainMenuViewState();
}

class MainMenuViewState extends State<MainMenuView> {
  String tag = MainMenuView.routeName.substring(1);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
