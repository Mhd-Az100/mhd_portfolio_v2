
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension ListWidgetExtension on List<Widget> {
  List<Widget> addWidget(Widget widget) {
    add(widget);
    return this;
  }

  Widget wrap({
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    WrapAlignment runAlignment = WrapAlignment.start,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    double spacing = 0.0,
    double runSpacing = 0.0,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    List<Widget> children = const <Widget>[],
  }) =>
      Wrap(
        direction: direction,
        alignment: alignment,
        runAlignment: runAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        spacing: spacing,
        runSpacing: runSpacing,
        children: this,
      );



  Widget row({
    MainAxisAlignment maa = MainAxisAlignment.start,
    CrossAxisAlignment caa = CrossAxisAlignment.center,
    MainAxisSize mas = MainAxisSize.max,
    TextDirection? td,
    VerticalDirection vd = VerticalDirection.down,
    TextBaseline? tb,
  }) =>
      Row(
        mainAxisAlignment: maa,
        crossAxisAlignment: caa,
        mainAxisSize: mas,
        textDirection: td,
        verticalDirection: vd,
        textBaseline: tb,
        children: this,
      );

  Widget column({
    MainAxisAlignment maa = MainAxisAlignment.start,
    CrossAxisAlignment caa = CrossAxisAlignment.center,
    MainAxisSize mas = MainAxisSize.max,
    TextDirection? td,
    VerticalDirection vd = VerticalDirection.down,
    TextBaseline? tb,
  }) =>
      Column(
        mainAxisAlignment: maa,
        crossAxisAlignment: caa,
        mainAxisSize: mas,
        textDirection: td,
        verticalDirection: vd,
        textBaseline: tb,
        children: this,
      );

  // convert to stack
  Widget stack({
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      Stack(
        alignment: alignment,
        textDirection: textDirection,
        fit: fit,
        clipBehavior: clipBehavior,
        children: this,
      );
  // listview
  Widget listView({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent = 0.0,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ListView(
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        itemExtent: itemExtent,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        clipBehavior: clipBehavior,
        children: this,
      );










}