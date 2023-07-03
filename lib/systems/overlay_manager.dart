// ignore_for_file: library_private_types_in_public_api, must_be_immutable, depend_on_referenced_packages

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Enum representing different behaviors for handling a back button click event.
enum BackButtonBehaviorChecker {
  /// Indicates that no specific action should be taken when the back button is clicked.
  /// The click event will not be intercepted or blocked in any way.
  none,

  /// Indicates that the back button click event should be intercepted or blocked.
  /// The code can handle this event separately, potentially performing custom logic
  /// instead of the default back button behavior.
  ignore,

  /// Indicates that the back button click event should be intercepted or blocked.
  /// In addition to intercepting the event, it also indicates that a toast (a small
  /// notification typically displayed on the screen) should be closed.
  /// The code can include the necessary logic to handle both the event interception
  /// and closing of the toast.
  close,
}

/// A manager class extending BotToast for overlay management.
class Overlayer extends BotToast {
  /// The background color of the overlay.
  final int backgroundColor;

  /// The duration for which the overlay will be displayed.
  final int seconds;

  /// Determines if clicking on the overlay will close it.
  final bool clickClose;

  /// Determines if clicking outside the overlay area will close it.
  final bool allowClick;

  /// Determines if clicking on the content within the overlay will be ignored.
  final bool ignoreContentClick;

  /// Determines if the overlay should persist across multiple pages.
  final bool crossPage;

  /// The duration for the overlay animation to complete when it appears.
  final int animationMilliseconds;

  /// The duration for the overlay animation to complete when it disappears.
  final int animationReverseMilliseconds;

  /// The behavior to apply when the back button is pressed.
  final BackButtonBehaviorChecker backButtonBehavior;

  /// A callback function to be invoked when the overlay is closed.
  void Function()? cancelFunc;

  /// Constructs an OverLaymanager instance to close an overlay.
  Overlayer.closeOverlay({
    this.backgroundColor = 0x42000000,
    this.seconds = 0,
    this.clickClose = false,
    this.allowClick = false,
    this.ignoreContentClick = false,
    this.crossPage = true,
    this.animationMilliseconds = 200,
    this.animationReverseMilliseconds = 200,
    this.backButtonBehavior = BackButtonBehaviorChecker.none,
    this.cancelFunc,
  }) {
    BotToast.closeAllLoading();
  }

  /// Returns the corresponding BackButtonBehavior based on the provided [backButtonBehavior].
  BackButtonBehavior getBackButtonBehavior(
      {required BackButtonBehaviorChecker backButtonBehavior}) {
    switch (backButtonBehavior) {
      case BackButtonBehaviorChecker.none:
        return BackButtonBehavior.none;
      case BackButtonBehaviorChecker.close:
        return BackButtonBehavior.close;
      case BackButtonBehaviorChecker.ignore:
        return BackButtonBehavior.ignore;
      default:
        return BackButtonBehavior.none;
    }
  }

  /// Constructs an OverLaymanager instance to show an overlay.
  ///
  /// The overlay will display the given [child] widget and can be customized with various parameters.
  /// - [backgroundColor]: The background color of the overlay.
  /// - [seconds]: The duration for which the overlay will be displayed.
  /// - [clickClose]: Determines if clicking on the overlay will close it.
  /// - [allowClick]: Determines if clicking outside the overlay area will close it.
  /// - [ignoreContentClick]: Determines if clicking on the content within the overlay will be ignored.
  /// - [crossPage]: Determines if the overlay should persist across multiple pages.
  /// - [animationMilliseconds]: The duration for the overlay animation to complete when it appears.
  /// - [animationReverseMilliseconds]: The duration for the overlay animation to complete when it disappears.
  /// - [backButtonBehavior]: The behavior to apply when the back button is pressed.
  /// - [cancelFunc]: A callback function to be invoked when the overlay is closed.
  Overlayer.showOverlay({
    this.backgroundColor = 0x42000000,
    this.seconds = 0,
    this.clickClose = false,
    this.allowClick = false,
    this.ignoreContentClick = false,
    this.crossPage = true,
    this.animationMilliseconds = 200,
    this.animationReverseMilliseconds = 200,
    this.backButtonBehavior = BackButtonBehaviorChecker.none,
    this.cancelFunc,
    required Widget child,
  }) {
    BotToast.showCustomLoading(
      clickClose: clickClose,
      allowClick: allowClick,
      backButtonBehavior:
          getBackButtonBehavior(backButtonBehavior: backButtonBehavior),
      ignoreContentClick: ignoreContentClick,
      animationDuration: Duration(milliseconds: animationMilliseconds),
      animationReverseDuration:
          Duration(milliseconds: animationReverseMilliseconds),
      duration: seconds == 0 ? null : Duration(seconds: seconds),
      backgroundColor: Color(backgroundColor),
      align: Alignment.center,
      toastBuilder: (cancelFuncval) {
        cancelFunc = cancelFuncval;
        return child;
      },
    );
  }
}
