/// OverlayManager Plugin
///
/// This plugin provides an overlay-based alert system for displaying alerts
/// on top of other widgets in your Flutter application.
///
/// To use this plugin, follow these steps:
/// 1. Wrap your `MaterialApp` with the `OverlayManagerInit.builder` in the `builder` property.
/// 2. Add `OverlayManagerInit.navigatorObserver` to the `navigatorObservers` property of your `MaterialApp`.
/// 3. Use the `OverlayManager.show` method to display an alert overlay with the desired content.
///    - You can use the provided `AlertDialog` widget or customize the content as needed.
///    - You can dismiss the overlay using `OverlayManager.dismissOverlay`.
///
/// Example:
///
/// ```dart
/// void main() {
///   runApp(const MyApp());
/// }
///
/// class MyApp extends StatefulWidget {
///   const MyApp({Key? key}) : super(key: key);
///
///   @override
///   State<MyApp> createState() => _MyAppState();
/// }
///
/// class _MyAppState extends State<MyApp> {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       builder: OverlayManagerInit.builder,
///       navigatorObservers: [OverlayManagerInit.navigatorObserver],
///       home: const HomePage(),
///     );
///   }
/// }
///
/// class HomePage extends StatelessWidget {
///   const HomePage({Key? key}) : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(
///         title: const Text('Plugin example app'),
///       ),
///       body: const Center(
///         child: Text('Running on: '),
///       ),
///       floatingActionButton: FloatingActionButton(
///         onPressed: () {
///           OverlayManager.show(
///             child: AlertDialog(
///               title: const Text('Text alert'),
///               content: const Text('Text content'),
///               actions: [
///                 TextButton(
///                   onPressed: () {
///                     OverlayManager.dismissOverlay();
///                     if (kDebugMode) {
///                       print('Object');
///                     }
///                   },
///                   child: const Text('Test'),
///                 ),
///               ],
///             ),
///           );
///         },
///       ),
///     );
///   }
/// }
/// ```
library alert_system;

import 'package:alert_system/alert_overlay_plugin.dart';
import 'package:alert_system/systems/initializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Entry point of the application.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: OverlayManagerInit.builder,
      navigatorObservers: [OverlayManagerInit.navigatorObserver],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: const Center(
        child: Text('Running OverlayManager'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.open_in_full),
        onPressed: () {
          OverlayManager.show(
            child: AlertDialog(
              title: const Text('Text alert'),
              content: const Text('Text content'),
              actions: [
                TextButton(
                  onPressed: () {
                    OverlayManager.dismissOverlay();
                    if (kDebugMode) {
                      print('overlay dismissed');
                    }
                  },
                  child: const Text('close'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
