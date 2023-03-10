import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/blocs/counter_cubit.dart';
import '../../common_widgets/ontap_wrapper.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({Key? key}) : super(key: key);

  static const routeName = '/MainMenuView';

  @override
  MainMenuViewState createState() => MainMenuViewState();
}

class MainMenuViewState extends State<MainMenuView> {
  String tag = MainMenuView.routeName.substring(1);
  final cubit = CounterCubit();

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
    bool isLandscape(BuildContext context) =>
        MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height >=
        1;
    bool isPortrait(BuildContext context) =>
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height <
        1;

    return buildScaffold(context, isLandscape, isPortrait);
  }

  Scaffold buildScaffold(
      BuildContext context,
      bool Function(BuildContext context) isLandscape,
      bool Function(BuildContext context) isPortrait) {
    return Scaffold(
      body: SafeArea(
        child: (isLandscape(context))
            ? Row(
                children: [
                  object1(),
                  object2(),
                  object3(),
                ],
              )
            : Column(
                children: [
                  object2(),
                  object3(),
                ],
              ),
      ),
      bottomSheet: isPortrait(context)
          ? object1()
          : Container(
              height: 0,
            ),
      floatingActionButton: Row(
        children: [
          OnTapWrapper(
            widgetToWrap: Container(
              width: 200,
              height: 100,
              color: Colors.deepOrange,
            ),
            actionsToDo: () {
              cubit.decrement();
            },
          ),
          OnTapWrapper(
            widgetToWrap: Container(
              width: 200,
              height: 100,
              color: Colors.green,
            ),
            actionsToDo: () {
              cubit.increment();
            },
          ),
        ],
      ),
    );
  }

  Container object1() {
    return Container(
      width: 200,
      height: 100,
      alignment: Alignment.center,
      color: Colors.black,
    );
  }

  Expanded object2() {
    return Expanded(
      flex: 2,
      child: Container(
        width: 200,
        color: Colors.blue,
        child: Center(
          child: BlocBuilder<CounterCubit, int>(
            bloc: cubit,
            builder: (context, count) {
              return Text('$count');
            },
          ),
        ),
      ),
    );
  }

  Expanded object3() {
    return Expanded(
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
