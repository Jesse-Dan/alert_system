import 'package:flutter/material.dart';

import 'systems/overlay_manager.dart';

/// The `OverlayManager` class provides a simplified interface for managing overlays using the `Overlayer` class.
///
/// To use this class, you need to import the `OverlayManager` class from the `systems/overlay_manager.dart` file.
/// This class provides static methods for showing and dismissing overlays.
///
/// ## Example
///
/// ```dart
/// import 'systems/overlay_manager.dart';
///
/// // Show an overlay
/// OverlayManager.show(
///   child: YourOverlayWidget(),
/// );
///
/// // Dismiss the overlay
/// OverlayManager.dismissOverlay();
/// ```
class OverlayManager {
  /// The instance of the `Overlayer` class that manages the overlay.
  static late Overlayer overlayer;

  /// Shows an overlay with the provided `child` widget.
  ///
  /// The `child` widget will be displayed as the content of the overlay.
  static void show({
    required Widget child,
    int backgroundColor = 0x42000000,
    int seconds = 0,
    bool clickClose = false,
    bool allowClick = false,
    bool ignoreContentClick = false,
    bool crossPage = true,
    int animationMilliseconds = 200,
    int animationReverseMilliseconds = 200,
    BackButtonBehaviorChecker backButtonBehavior =
        BackButtonBehaviorChecker.none,
    void Function()? cancelFunc,
  }) {
    overlayer = Overlayer.showOverlay(
      child: child,
      backgroundColor: backgroundColor,
      seconds: seconds,
      clickClose: clickClose,
      allowClick: allowClick,
      ignoreContentClick: ignoreContentClick,
      crossPage: crossPage,
      animationMilliseconds: animationMilliseconds,
      animationReverseMilliseconds: animationReverseMilliseconds,
      backButtonBehavior: backButtonBehavior,
      cancelFunc: cancelFunc,
    );
  }

  /// Dismisses the currently active overlay.
  ///
  /// If there is no active overlay, this method does nothing.
  static void dismissOverlay() {
    overlayer = Overlayer.closeOverlay();
  }
}
