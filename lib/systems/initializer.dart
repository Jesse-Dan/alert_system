import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

/// The `OverlayManagerInit` class is responsible for initializing the `bot_toast` package and setting it up as the builder and navigator observer for the Flutter application.
///
/// To use this class, you need to import the `OverlayManagerInit` class from the `package:bot_toast/bot_toast.dart` file.
/// This class extends the `BotToast` class and provides the necessary setup for the `bot_toast` package.
///
/// ## Example
///
/// ```dart
/// import 'package:bot_toast/bot_toast.dart';
/// import 'package:flutter/material.dart';
///
/// // Initialize the overlay manager
/// OverlayManagerInit.builder = BotToastInit();
/// OverlayManagerInit.navigatorObserver = BotToastNavigatorObserver();
///
/// // Run the Flutter application
/// MaterialApp(
///  builder: OverlayManagerInit.builder,
///  navigatorObservers: [OverlayManagerInit.navigatorObserver])
/// ```
class OverlayManagerInit extends BotToast {
  /// The builder for the `MaterialApp` widget.
  static Widget Function(BuildContext, Widget?)? builder = BotToastInit();

  /// The navigator observer for the `MaterialApp` widget.
  static NavigatorObserver navigatorObserver = BotToastNavigatorObserver();
}
