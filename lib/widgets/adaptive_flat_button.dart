import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  Widget _child;
  Function _onPressed;

  AdaptiveFlatButton(this._child, this._onPressed);

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;
    return isAndroid
        ? FlatButton(
            onPressed: this._onPressed,
            child: this._child,
            textColor: Theme.of(context).primaryColor,
          )
        : CupertinoButton(
            child: this._child,
            onPressed: this._onPressed,
          );
  }
}
