import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton  extends StatelessWidget {  
  final String label;
  final Function() onPressed;

  AdaptativeButton(this.label, this.onPressed);
  
  @override
  Widget build(BuildContext context) {

    return Platform.isIOS ? 
    CupertinoButton(
      child: Text(label), 
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(10),
    )
    : TextButton(
        child: Text(label),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          primary: Colors.white,
          padding: EdgeInsets.all(10),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
      ) 
    );

  }
}