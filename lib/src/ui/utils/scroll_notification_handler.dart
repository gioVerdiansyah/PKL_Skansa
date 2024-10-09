import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool handleScrollNotification(ScrollNotification notification, Function(bool) isHideBottomNavBar) {
  if (notification.depth == 0) {
    if (notification is UserScrollNotification) {
      final UserScrollNotification userScroll = notification;
      switch (userScroll.direction) {
        case ScrollDirection.forward:
          isHideBottomNavBar(true);
          break;
        case ScrollDirection.reverse:
          isHideBottomNavBar(false);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
  }
  return true;
}
