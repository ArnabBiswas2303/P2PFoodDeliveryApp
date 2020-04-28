import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

loading(BuildContext context) {
  return Container(
    color: Colors.black.withOpacity(0.3),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.15,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitRing(
              color: Colors.black,
              lineWidth: 4,
            ),
            SizedBox(width: 20),
            Text(
              "Loading",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    ),
  );
}
