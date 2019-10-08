import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Failed to load dart_sdk.js',
      home: Scaffold(
        appBar: AppBar(title: Text('Failed to load dart_sdk.js')),
//         body: Text('''

// Please check the terminal output for the error/warning:

// [        ] Attempting to connect to browser instance..
// [+4714 ms] Failed to load asset at path: packages/build_web_compilers/src/dev_compiler/dart_sdk.js.

//                     Status code: 404

//                     Headers:
//                     {
//                       "date": "Tue, 08 Oct 2019 17:15:29 GMT",
//                       "content-length": "9",
//                       "x-frame-options": "SAMEORIGIN",
//                       "content-type": "text/plain; charset=utf-8",
//                       "x-xss-protection": "1; mode=block",
//                       "x-content-type-options": "nosniff",
//                       "server": "dart:io with Shelf",
//                       "via": "1.1 shelf_proxy"
//                     }

//                     Content:
//                     Not Found
// '''),
      ),
    ));
