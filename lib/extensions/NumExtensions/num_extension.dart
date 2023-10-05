import 'package:flutter/material.dart';

//
extension IntExtension on int {
  //
  Duration get second => Duration(seconds: this);
  //
  Duration get milliseconds => Duration(milliseconds: this);
  //
  SizedBox get sh => SizedBox(height: toDouble());

  SizedBox get sw => SizedBox(width: toDouble());
  SizedBox get swh => SizedBox(height: toDouble(), width: toDouble());
  //
  BorderRadius get br => BorderRadius.circular(toDouble());
  BorderRadius get brtl => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
      );
  BorderRadius get brtr => BorderRadius.only(
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get brbl => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
      );
  BorderRadius get brbr => BorderRadius.only(
        bottomRight: Radius.circular(toDouble()),
      );
  BorderRadius get brtltr => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get brblbr => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );
  BorderRadius get brtlbl => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        bottomLeft: Radius.circular(toDouble()),
      );
  BorderRadius get brtrbr => BorderRadius.only(
        topRight: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );

  EdgeInsets get eh => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get ev => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get e => EdgeInsets.all(toDouble());
  EdgeInsets get et => EdgeInsets.only(top: toDouble());
  EdgeInsets get eb => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get el => EdgeInsets.only(left: toDouble());
  EdgeInsets get er => EdgeInsets.only(right: toDouble());
  EdgeInsets get etb => EdgeInsets.only(top: toDouble(), bottom: toDouble());
  EdgeInsets get elr => EdgeInsets.only(left: toDouble(), right: toDouble());
  EdgeInsets get etl => EdgeInsets.only(top: toDouble(), left: toDouble());
  EdgeInsets get etr => EdgeInsets.only(top: toDouble(), right: toDouble());
  EdgeInsets get ebl => EdgeInsets.only(bottom: toDouble(), left: toDouble());
  EdgeInsets get ebr => EdgeInsets.only(bottom: toDouble(), right: toDouble());
  EdgeInsets get etlbr => EdgeInsets.only(
      top: toDouble(), left: toDouble(), bottom: toDouble(), right: toDouble());
  EdgeInsets get etlblr => EdgeInsets.only(
      top: toDouble(), left: toDouble(), bottom: toDouble(), right: toDouble());
  EdgeInsets get etlbrl => EdgeInsets.only(
      top: toDouble(), left: toDouble(), bottom: toDouble(), right: toDouble());
  EdgeInsets get etlbrlr => EdgeInsets.only(
      top: toDouble(), left: toDouble(), bottom: toDouble(), right: toDouble());
  EdgeInsets get etlbrlrl => EdgeInsets.only(
      top: toDouble(), left: toDouble(), bottom: toDouble(), right: toDouble());
  EdgeInsets get etlbrlrll => EdgeInsets.only(
      top: toDouble(), left: toDouble(), bottom: toDouble(), right: toDouble());

  EdgeInsets get etlbrlrlll => EdgeInsets.only(
      top: toDouble(), left: toDouble(), bottom: toDouble(), right: toDouble());
}

//
