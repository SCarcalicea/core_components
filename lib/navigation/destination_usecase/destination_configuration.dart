import 'package:core_components/navigation/model/page_destination.dart';
import 'package:flutter/material.dart';

const List<PageDestination> destinationsSample = <PageDestination>[
  PageDestination(
      'Investments', Icon(Icons.trending_up), Icon(Icons.trending_up_outlined)),
  PageDestination(
      'Expenses', Icon(Icons.attach_money), Icon(Icons.attach_money_outlined)),
  PageDestination(
      'Dashboard', Icon(Icons.dashboard), Icon(Icons.dashboard_outlined)),
  PageDestination(
      'NetWorth', Icon(Icons.money), Icon(Icons.money_outlined)),
  PageDestination(
      'Debts', Icon(Icons.money_off), Icon(Icons.money_off_outlined)),
];