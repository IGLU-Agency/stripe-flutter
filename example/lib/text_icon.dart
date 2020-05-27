import 'package:flutter/material.dart';

class TextIcon extends StatefulWidget {
  final String title;
  final IconData icon;
  final Image leftImage;
  final Widget leftWidget;
  final IconData accessory;
  final Color accessoryColor;
  final Radio<dynamic> accessoryRadio;
  final Widget rightWidget;
  final Function(TapUpDetails) tapHandler;
  final Function(TapUpDetails) leftIconHandler;
  final bool isFirstRow;
  final double fontSize;
  final TextAlign titleAlign;
  final FontWeight fontWeight;
  final double imageSize;
  final bool shapedSelectedBackground;
  final double cellHeight;
  final bool showLeftSpace;
  final bool showSelected;
  final bool updateAfterTap;
  final bool disableIsSelected;
  final int maxLines;
  final bool forceIsSelected;
  final bool showBackgroundView;
  final double spaceBetweenLeftIconAndTitle;
  final TextStyle titleStyle;
  final EdgeInsets containerPadding;
  final Color backgroundColor;

  const TextIcon(
      {Key key,
      this.disableIsSelected = false,
      this.rightWidget,
      this.accessoryRadio,
      this.titleStyle,
      this.titleAlign,
      this.backgroundColor,
      this.updateAfterTap = false,
      this.containerPadding = const EdgeInsets.fromLTRB(20, 0, 20, 0),
      this.leftWidget,
      this.leftImage,
      this.forceIsSelected = false,
      this.showBackgroundView = true,
      this.spaceBetweenLeftIconAndTitle = 15.0,
      this.maxLines = 1,
      this.showSelected = true,
      this.showLeftSpace = false,
      this.cellHeight,
      this.title,
      this.icon,
      this.accessory,
      this.tapHandler,
      this.isFirstRow = false,
      this.fontSize,
      this.imageSize,
      this.shapedSelectedBackground = true,
      this.fontWeight,
      this.leftIconHandler,
      this.accessoryColor})
      : super(key: key);

  @override
  _TextIconState createState() => _TextIconState();
}

class _TextIconState extends State<TextIcon> {
  var isSelected = false;
  var isHover = false;

  BorderRadius _radius() {
    return widget.shapedSelectedBackground
        ? BorderRadius.only(
            topRight: Radius.circular(50.0), bottomRight: Radius.circular(50.0))
        : BorderRadius.only(
            topRight: Radius.circular(0.0), bottomRight: Radius.circular(0.0));
  }

  List<Widget> listChildren() {
    final theme = Theme.of(context);
    List<Widget> temp = List<Widget>();

    if (widget.icon != null || widget.showLeftSpace == true) {
      var _i = Icon(
          widget.icon,
          color: isSelected
              ? Theme.of(context).accentColor
              : Theme.of(context).primaryColor,
          size: widget.imageSize ?? 24,
        );
      temp.add(widget.leftIconHandler == null ? _i : GestureDetector(
        onTapUp: (details) {
          if (widget.leftIconHandler != null) {
            widget.leftIconHandler(details);
          }
        },
        child: _i,
      ));
      temp.add(SizedBox(width: widget.spaceBetweenLeftIconAndTitle));
    } else if (widget.showLeftSpace == true || widget.leftImage != null) {
      temp.add(widget.leftImage);
      temp.add(SizedBox(width: widget.spaceBetweenLeftIconAndTitle));
    } else if (widget.showLeftSpace == true || widget.leftWidget != null) {
      temp.add(widget.leftWidget);
      temp.add(SizedBox(width: widget.spaceBetweenLeftIconAndTitle));
    }
    if (widget.title != null) {
      temp.add(Expanded(
        child: Text(
          widget.title,
          maxLines: widget.maxLines,
          textAlign: widget.titleAlign ?? TextAlign.start,
          overflow: TextOverflow.ellipsis,
          textWidthBasis: TextWidthBasis.longestLine,
          style: widget.titleStyle == null
              ? theme.textTheme.subtitle1.copyWith(
                  fontSize: widget.fontSize ?? 16,
                  color: isSelected
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColor,
                  fontWeight: widget.fontWeight ?? FontWeight.normal)
              : widget.titleStyle,
        ),
      ));
    }
    if (widget.accessory != null) {
      temp.add(Icon(
        widget.accessory,
        color: widget.accessoryColor ?? Theme.of(context).accentColor,
        size: widget.imageSize ?? 24,
      ));
    } else if (widget.accessoryRadio != null) {
      temp.add(widget.accessoryRadio);
    } else if (widget.rightWidget != null) {
      temp.add(widget.rightWidget);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.disableIsSelected) {
      isSelected = false;
    }
    if (widget.forceIsSelected) {
      isSelected = true;
    }
    return GestureDetector(
      onTap: () {
        if (widget.updateAfterTap) {
          setState(() {});
        }
      },
      onTapDown: (details) {
        setState(() {
          if (widget.showSelected) {
            isHover = true;
          }
        });
      },
      onTapUp: (details) {
        if (widget.tapHandler != null) {
          widget.tapHandler(details);
        }
        setState(() {
          if (widget.showSelected) {
            isHover = false;
          }
        });
      },
      onTapCancel: () {
        setState(() {
          if (widget.showSelected) {
            isHover = false;
          }
        });
      },
      child: Container(
        height: widget.cellHeight ?? 50.0,
        margin: widget.shapedSelectedBackground
            ? EdgeInsets.fromLTRB(0, 0, 7, 0)
            : EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: widget.showBackgroundView
            ? BoxDecoration(
                color: isSelected
                    ? Theme.of(context).accentColor.withOpacity(0.20)
                    : (isHover
                        ? Theme.of(context).dividerColor
                        : widget.backgroundColor ?? Theme.of(context).backgroundColor
                            .withAlpha(0)),
                borderRadius: _radius())
            : null,
        child: Padding(
          padding: widget.containerPadding,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: listChildren(),
            ),
          ),
        ),
      ),
    );
  }
}
