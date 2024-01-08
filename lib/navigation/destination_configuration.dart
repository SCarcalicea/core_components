import 'package:core_components/navigation/page_destination.dart';
import 'package:flutter/material.dart';

const List<PageDestination> destinations = <PageDestination>[
  PageDestination(
      'Messages', Icon(Icons.widgets_outlined), Icon(Icons.widgets)),
  PageDestination(
      'Profile', Icon(Icons.format_paint_outlined), Icon(Icons.format_paint)),
  PageDestination(
      'Settings', Icon(Icons.settings_outlined), Icon(Icons.settings)),
];