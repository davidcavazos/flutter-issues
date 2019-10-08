# TextField refresh

Reference application for [issue 42201](https://github.com/flutter/flutter/issues/42201).

## Setup

Clone the `flutter-issues` repository and navigate to the appropriate directory.

```sh
git clone git@github.com:davidcavazos/flutter-issues.git
cd flutter-issues/textfield_refresh
```

## To reproduce bug

Relevant source code:

* [lib/main.dart](lib/main.dart)

Run the app in Chrome.

```sh
flutter run -d chrome -v
```

Refresh (press `r`) the app and no errors happen:

```
[+2603 ms] Performing hot restart...
[ +790 ms] About to build [web]...
[   +1 ms] Running build...
[  +76 ms] Running build completed, took 36ms

[        ] Caching finalized dependency graph...
[   +3 ms] Caching finalized dependency graph completed, took 45ms

[   +1 ms] Succeeded after 83ms with 0 outputs (0 actions)

[  +61 ms] Restarted application in 934ms.
[        ] Performing hot restart... (completed in 935ms)
```

*Click* or *edit the value* of the `TextField` in the web app,
then refresh (press `r`) and the following error appears:

```
[+73762 ms] Performing hot restart...
[ +448 ms] About to build [web]...
[        ] Running build...
[  +67 ms] Running build completed, took 25ms

[        ] Caching finalized dependency graph...
[   +4 ms] Caching finalized dependency graph completed, took 46ms

[        ] Succeeded after 73ms with 0 outputs (0 actions)

[  +31 ms] Restarted application in 553ms.
[        ] Performing hot restart... (completed in 554ms)
[ +350 ms] ══╡ EXCEPTION CAUGHT BY ANIMATION LIBRARY ╞═════════════════════════════════════════════════════════
[   +5 ms] The following JSNoSuchMethodError was thrown while notifying listeners for AnimationController:
[        ] NoSuchMethodError: invalid member on null: 'findRenderObject'
[        ] When the exception was thrown, this was the stack:
[        ] package:flutter/src/widgets/editable_text.dart 1726:68            get renderEditable
[        ] package:flutter/src/widgets/editable_text.dart 1590:20            [_onCursorColorTick]
[        ] package:flutter/src/animation/listener_helpers.dart 124:21        notifyListeners
[        ] package:flutter/src/animation/animation_controller.dart 362:5     set value
[        ] package:flutter/src/widgets/editable_text.dart 1625:37            [_cursorTick]
[        ] package:build_web_compilers/src/dev_compiler/dart_sdk.js 28721:9  <fn>
[        ] The AnimationController notifying listeners was:
[   +1 ms] AnimationController#468cf(⏮ 0.000; paused)
[        ] ════════════════════════════════════════════════════════════════════════════════════════════════════
[ +405 ms] Another exception was thrown: NoSuchMethodError: invalid member on null: 'findRenderObject'
[ +441 ms] Another exception was thrown: NoSuchMethodError: invalid member on null: 'findRenderObject'
[ +673 ms] Another exception was thrown: NoSuchMethodError: invalid member on null: 'findRenderObject'
...
...
[ +350 ms] Another exception was thrown: NoSuchMethodError: invalid member on null: 'findRenderObject'
[ +645 ms] Another exception was thrown: NoSuchMethodError: invalid member on null: 'findRenderObject'
```

The app still works, but now the terminal is flooded with that animation error every ~500 ms.

Doing a *hard refresh* on the app makes the error disappear.
