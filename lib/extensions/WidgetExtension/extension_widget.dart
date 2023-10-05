import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter_bounce/flutter_bounce.dart';

const List<IconData> icons = [
  Icons.message,
  Icons.call,
  Icons.mail,
  Icons.notifications,
  Icons.settings,
];

extension WidgetExtension on Widget {
  //
  Widget refreshIndicator({
    required Future<void> Function() onRefresh,
  }) =>
      RefreshIndicator(
        onRefresh: onRefresh,
        child: this,
      );
  //
  // implement routing using GetX

  // implement shimmer
  // Widget shimmerEffect({ShimmerDirection? direction}) => Shimmer.fromColors(
  //       direction: direction ?? ShimmerDirection.ltr,
  //       baseColor: Colors.grey[300]!,
  //       highlightColor: Colors.grey[100]!,
  //       child: this,
  //     );
  // //
  // Widget shimmerWhite({ShimmerDirection? direction}) => Shimmer.fromColors(
  //       direction: direction ?? ShimmerDirection.ltr,
  //       highlightColor: Colors.white,
  //       baseColor: Colors.grey[300]!,
  //       child: this,
  //     );
  // //scrollable
  // Widget scrollable({Axis? axis, ScrollPhysics? physics}) =>
  //     SingleChildScrollView(
  //       scrollDirection: axis ?? Axis.vertical,
  //       physics: physics,
  //       child: this,
  //     );
  // //
  // Widget shimmerWhiteObx(
  //         {required bool isLoading, ShimmerDirection? direction}) =>
  //     isLoading
  //         ? Shimmer.fromColors(
  //             direction: direction ?? ShimmerDirection.ltr,
  //             highlightColor: Colors.white,
  //             baseColor: Colors.grey[300]!,
  //             child: this,
  //           )
  //         : this;
  // DevicePreview for MaterialApp
  // Widget devicePreview() => DevicePreview(builder: (x) => this);
  Widget hide() => Visibility(visible: false, child: this);
  //

  //

  //
  Widget get layoutBuilder => LayoutBuilder(builder: (context, constraints) {
        debugPrint(
            'Max height: ${constraints.maxHeight}, max width: ${constraints.maxWidth}');
        return this; // create function here to adapt to the parent widget's constraints
      });
  //
  // row with center alignment
  Widget get rowCenter => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [this],
      );

  // row with start alignment
  Widget get rowStart => Row(
        children: [this],
      );

  // row with end alignment
  Widget get rowEnd => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [this],
      );

  // row with space between alignment
  Widget get rowBetween => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [this],
      );

  // row with space around alignment
  Widget get rowAround => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [this],
      );
  //

  // column with center alignment
  Widget get columnCenter => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [this],
      );

  // column with start alignment
  Widget get columnStart => Column(
        children: [this],
      );

  // column with end alignment
  Widget get columnEnd => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [this],
      );

  // column with space between alignment
  Widget get columnBetween => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [this],
      );

  // column with space around alignment
  Widget get columnAround => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [this],
      );
  //
  Widget column({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.min,
  }) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: [this],
      );
  //
  // hero animation
  Widget hero({required tag}) => Hero(
        tag: tag,
        child: this,
      );
  // add material widget
  Widget material() => Material(
        type: MaterialType.transparency,
        child: this,
      );
  //
  Widget get flexible => Flexible(
        child: this,
      );
  //
  Widget container({BoxDecoration? boxDecoration}) => Container(
        decoration: boxDecoration,
        child: this,
      );
  //
  Widget visibility({bool? value}) => Visibility(
        visible: value!,
        child: this,
      );
  //
  Widget form(GlobalKey<FormState> value) => Form(
        key: value,
        child: this,
      );
  //
  Widget opacity(double value) => AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: value,
        child: this,
      );
  //
  //
  Widget widthS(double w) => SizedBox(
        width: w,
        child: this,
      );
  //
  Widget heightS(double h) => SizedBox(
        height: h,
        child: this,
      );
  // cliprr
  Widget clipRRect({BorderRadius? borderRadius}) => ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: this,
      );

  //
  Widget positioned({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        left: left,
        top: top,
        width: width,
        height: height,
        right: right,
        bottom: bottom,
        child: this,
      );
  //
  Widget center() => Center(child: this);
  //
  Widget singlChild({ScrollPhysics? scroll, Clip? clip}) =>
      SingleChildScrollView(
        clipBehavior: clip ?? Clip.hardEdge,
        physics: scroll,
        child: this,
      );

  //scrollbar
  Widget scrollBar({ScrollbarOrientation? scrollbarOrientation}) => Scrollbar(
        interactive: true,
        scrollbarOrientation: scrollbarOrientation,
        thumbVisibility: true,
        radius: const Radius.circular(10),
        child: this,
      );
  //
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  // print befor render
  Widget print(value) {
    debugPrint(value);
    return this;
  }

  //
  Widget willPop({required VoidCallback onWillPop}) => WillPopScope(
        onWillPop: () async {
          onWillPop();
          return true;
        },
        child: this,
      );
  //
  Widget directionality(TextDirection t) => Directionality(
        textDirection: t,
        child: this,
      );
  //safeArea
  Widget safeArea() => SafeArea(child: this);
  Widget opacityy(double p) => AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: p,
        child: this,
      );
  // Widget bouce({
  //   required VoidCallback onPressed,
  //   double scale = 1.0,
  //   Duration duration = const Duration(milliseconds: 100),
  //   Curve curve = Curves.linear,
  // }) =>
  //     Bounce(
  //       duration: duration,
  //       onPressed: onPressed,
  //       child: this,
  //     );
  // add Widget Binding add post frame callback
  Widget addPostFrameCallback(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
    return this;
  }

  //
  Widget paddingSymmetric({double h = 0, double v = 0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
        child: this,
      );
  //
  Widget paddingOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );
  //
  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );
  //
  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
  //
  Widget marginOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      Container(
        margin:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );
  //
  Widget expanded({int? flex}) => Expanded(
        flex: flex ?? 1,
        child: this,
      );
  //
  Widget clip({double? radius}) => ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: this,
      );
  //
  Widget align(Alignment alignment) => Align(
        alignment: alignment,
        child: this,
      );
  //
  Widget color(Color color) => Container(
        color: color,
        child: this,
      );
  //
  Widget circular(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );
  //
  Widget boxDecoration(BoxDecoration decoration) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: decoration,
        child: this,
      );
  //
  Widget gesture(Function() onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );
  //
  Widget inkwell({Function()? onTap}) => InkWell(
        onTap: onTap,
        child: this,
      );
  //
  Widget padding({double? left, double? top, double? right, double? bottom}) =>
      Padding(
        padding: EdgeInsets.only(
            left: left ?? 0,
            top: top ?? 0,
            right: right ?? 0,
            bottom: bottom ?? 0),
        child: this,
      );
  //
  Widget margin({double? left, double? top, double? right, double? bottom}) =>
      Container(
        margin: EdgeInsets.only(
          left: left ?? 0,
          top: top ?? 0,
          right: right ?? 0,
          bottom: bottom ?? 0,
        ),
        child: this,
      );
  //

  //
  Widget flexiable({
    int? flex,
    FlexFit? fit,
  }) =>
      Flexible(
        flex: flex ?? 1,
        fit: fit ?? FlexFit.loose,
        child: this,
      );

  //
  Widget boxDecorationWithShadow({
    Color color = Colors.white,
    double radius = 5,
    double blurRadius = 6,
    double spreadRadius = 5,
    Color shadowColor = Colors.black,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ],
        ),
        child: this,
      );
  //
  Widget boxDecorationWithBorder({
    Color color = Colors.white,
    double radius = 0,
    double width = 0,
    Color borderColor = Colors.black,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: width),
        ),
        child: this,
      );
  //
  Widget boxDecorationWithBorderAndShadow({
    Color color = Colors.white,
    double radius = 0,
    double width = 0,
    Color borderColor = Colors.black,
    double blurRadius = 0,
    double spreadRadius = 0,
    Color shadowColor = Colors.black,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: width),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ],
        ),
        child: this,
      );
  //
  Widget boxDecorationWithGradient({
    Color color = Colors.white,
    double radius = 0,
    double blurRadius = 0,
    double spreadRadius = 0,
    Color shadowColor = Colors.black,
    List<Color> colors = const [Colors.white, Colors.white],
    List<double> stops = const [0.0, 1.0],
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ],
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin,
            end: end,
          ),
        ),
        child: this,
      );
  //
  Widget boxDecorationWithBorderAndGradient({
    Color color = Colors.white,
    double radius = 0,
    double width = 0,
    Color borderColor = Colors.black,
    double blurRadius = 0,
    double spreadRadius = 0,
    Color shadowColor = Colors.black,
    List<Color> colors = const [Colors.white, Colors.white],
    List<double> stops = const [0.0, 1.0],
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: width),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ],
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin,
            end: end,
          ),
        ),
        child: this,
      );
  //

  //
}
