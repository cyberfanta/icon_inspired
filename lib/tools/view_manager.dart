import 'package:flutter/material.dart';
import 'package:icon_inspired/tools/stacks.dart';
import 'package:icon_inspired/tools/stamp.dart';

import '../views/screens/main_view/main_view.dart';

class ViewManager {
  final String _tag = "ViewManager";
  final Stacks<String> _viewStack = Stacks<String>();
  bool _isInitialized = false;
  String _controlPoint = "";
  final String _viewManagerRoot = MainMenuView.routeName;

  ViewManager() {
    init();
  }

  void init() {
    if (!_isInitialized) {
      stamp(_tag, "View Manager Initialized");
      _viewStack.push(_viewManagerRoot);
      stamp(_tag, "Now: $_viewStack", extraLine: true);
      _isInitialized = true;
    }
  }

  void reset(BuildContext context) {
    clearAndPush(context, _viewManagerRoot);
  }

  void push(BuildContext context, String value) {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.push(value);
    stamp(_tag, "Push View: ${value.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
    Navigator.pushNamedAndRemoveUntil(context, value, (r) => false);
  }

  void pushAndStay(BuildContext context, String value) {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.push(value);
    stamp(_tag, "Push View: ${value.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
  }

  void pop(BuildContext context) {
    stamp(_tag, "Before: $_viewStack");
    String? value = _viewStack.pop();
    stamp(_tag, "Pop View: ${value?.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
    value = _viewStack.last;
    Navigator.pushNamedAndRemoveUntil(context, value as String, (r) => false);
  }

  void popAndStay(BuildContext context) {
    stamp(_tag, "Before: $_viewStack");
    String? value = _viewStack.pop();
    stamp(_tag, "Pop View: ${value?.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
  }

  void clearAndPush(BuildContext context, String value) {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.clear();
    _viewStack.push(value);
    stamp(_tag, "PushAndClear View: ${value.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
    Navigator.pushNamedAndRemoveUntil(context, value, (r) => false);
  }

  void resetAndPush(BuildContext context, String value) {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.clear();
    _viewStack.push(_viewManagerRoot);
    _viewStack.push(value);
    stamp(_tag, "ResetAndClear View: ${value.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
    Navigator.pushNamedAndRemoveUntil(context, value, (r) => false);
  }

  void setControlPoint(String value) {
    _controlPoint = value;
    stamp(_tag, "Control Point - Set: $_controlPoint");
  }

  void goToControlPoint(BuildContext context) {
    stamp(_tag, "Control Point - Processing: $_controlPoint");

    do {
      popAndStay(context);
    } while (getCurrent() != _controlPoint);

    stamp(_tag, "Control Point- Finishing: $_controlPoint", extraLine: true);

    String value = _controlPoint;
    _controlPoint = "";
    Navigator.pushNamedAndRemoveUntil(context, value, (r) => false);
  }

  String getCurrent() {
    return _viewStack.last.toString();
  }

  String getParentOfCurrent() {
    if ((_viewStack.length - 2) < 0) {
      return _viewManagerRoot;
    }

    return _viewStack.elementAt(_viewStack.length - 2);
  }

  String getElementAt(int value) {
    if (value > (_viewStack.length - 1)) {
      return "";
    }

    if (value < 0) {
      return "";
    }

    return _viewStack.elementAt(value);
  }

  int getSize() {
    return _viewStack.length;
  }
}
