import 'package:flutter/material.dart';

GlobalKey loadingGlobalKey = GlobalKey(debugLabel: "loadingController");

dismissLoading() {
  if (loadingGlobalKey != null && loadingGlobalKey.currentContext != null) {
    if (Navigator.canPop(loadingGlobalKey.currentContext)) {
      Navigator.pop(loadingGlobalKey.currentContext);
    }
  }
}

presentLoading(BuildContext context,
    {bool barrierDismissible,
    Color backgroundColor,
    double width,
    double height,
    List<BoxShadow> boxShadow,
    BoxShape shape,
    BorderRadiusGeometry borderRadius,
    double strokeWidth}) {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (context) {
        return Center(
          key: loadingGlobalKey,
          child: Container(
            width: width ?? 100,
            height: height ?? 100,
            decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).backgroundColor,
              boxShadow: boxShadow ??
                  [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3), blurRadius: 10.0)
                  ],
              shape: shape ?? BoxShape.rectangle,
              borderRadius: borderRadius ?? BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Container(
                child: SizedBox(
                  width: (width ?? 100) / 2,
                  height: height ?? 100 / 2,
                  child: CircularProgressIndicator(
                    strokeWidth: strokeWidth ?? 1.5,
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
