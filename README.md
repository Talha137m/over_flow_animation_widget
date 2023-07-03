<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

overFlow animation widget that animate it's child widget when it overflow

<!-- ## Features

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package. -->
## ScreenShots

![screen_shot](https://github.com/Talha137m/over_flow_animation_widget/assets/99283895/c280904c-ab12-415b-a843-e784f8eefd3d)



## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.
1.Add over_flow_animation as a dependency in your pubspec.yaml file.

dependencies:
  over_flow_animation: ^1.1.0
2.Now in your flutter project, you can use:

```dart
       SizedBox(
              width: 50,
              child: OverFlowAnimation(
                backCurve: Curves.linear,
                backDuration: const Duration(milliseconds: 1),
                startCurve: Curves.linear,
                pauseDuration: const Duration(milliseconds: 1),
                animationDuration: const Duration(seconds: 3),
                direction: Axis.horizontal,
                child: const Text('Pakistan zindabad'),
              ),
            ),
```
## properties
1.backCurve:
2.backDuration:
3.startCurve:
4.pauseDuration:
5.animationDuration:
6.direction:
7.child:

<!-- ## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
