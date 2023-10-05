import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get heightWithoutAppBar => height - kToolbarHeight;
  double get heightWithoutAppBarAndBottomBar =>
      heightWithoutAppBar - kBottomNavigationBarHeight;
  double get heightWithoutAppBarAndBottomBarAndStatusBar =>
      heightWithoutAppBarAndBottomBar - MediaQuery.of(this).padding.top;
  double get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeArea =>
      heightWithoutAppBarAndBottomBarAndStatusBar -
      MediaQuery.of(this).padding.bottom;
  double
      get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheet =>
          heightWithoutAppBarAndBottomBarAndStatusBarAndSafeArea -
          MediaQuery.of(this).viewInsets.bottom;
  double
      get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboard =>
          heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheet -
          MediaQuery.of(this).viewInsets.top;
  double get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBar =>
      heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboard -
      MediaQuery.of(this).padding.top;
  double get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBarAndBottomBar =>
      heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBar -
      kBottomNavigationBarHeight;
  double get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBarAndBottomBarAndBottomSheet =>
      heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBarAndBottomBar -
      MediaQuery.of(this).viewInsets.bottom;
  double get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBarAndBottomBarAndBottomSheetAndKeyboard =>
      heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBarAndBottomBarAndBottomSheet -
      MediaQuery.of(this).viewInsets.top;
  double get heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBarAndBottomBarAndBottomSheetAndKeyboardAndTopBar =>
      heightWithoutAppBarAndBottomBarAndStatusBarAndSafeAreaAndBottomSheetAndKeyboardAndTopBarAndBottomBarAndBottomSheetAndKeyboard -
      MediaQuery.of(this).padding.top;
}
