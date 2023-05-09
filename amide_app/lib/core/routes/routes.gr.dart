// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:amide_app/features/data/models/elderly.dart' as _i14;
import 'package:amide_app/features/data/models/reminder.dart' as _i15;
import 'package:amide_app/features/presentation/dashboard/screens/dashboard_screen.dart'
    as _i1;
import 'package:amide_app/features/presentation/elderly/screens/create_elderly_screen.dart'
    as _i2;
import 'package:amide_app/features/presentation/elderly/screens/edit_elderly_screen.dart'
    as _i3;
import 'package:amide_app/features/presentation/elderly/screens/elderly_screen.dart'
    as _i4;
import 'package:amide_app/features/presentation/elderly/screens/view_elderly_screen.dart'
    as _i5;
import 'package:amide_app/features/presentation/records/screens/all_records_screen.dart'
    as _i6;
import 'package:amide_app/features/presentation/records/screens/recording_screen.dart'
    as _i7;
import 'package:amide_app/features/presentation/reminder/screens/create_reminder_screen.dart'
    as _i8;
import 'package:amide_app/features/presentation/reminder/screens/edit_reminder_screen.dart'
    as _i9;
import 'package:amide_app/features/presentation/reminder/screens/reminder_screen.dart'
    as _i10;
import 'package:amide_app/features/presentation/reminder/screens/view_reminder_screen.dart'
    as _i11;
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DashboardScreen(key: args.key),
      );
    },
    CreateElderlyRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CreateElderlyScreen(),
      );
    },
    EditElderlyRoute.name: (routeData) {
      final args = routeData.argsAs<EditElderlyRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditElderlyScreen(
          key: args.key,
          currentElderly: args.currentElderly,
        ),
      );
    },
    ElderlyRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ElderlyScreen(),
      );
    },
    ViewElderlyRoute.name: (routeData) {
      final args = routeData.argsAs<ViewElderlyRouteArgs>(
          orElse: () => const ViewElderlyRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ViewElderlyScreen(key: args.key),
      );
    },
    AllRecordsRoute.name: (routeData) {
      final args = routeData.argsAs<AllRecordsRouteArgs>(
          orElse: () => const AllRecordsRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.AllRecordsScreen(key: args.key),
      );
    },
    RecordingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RecordingScreen(),
      );
    },
    CreateReminderRoute.name: (routeData) {
      final args = routeData.argsAs<CreateReminderRouteArgs>(
          orElse: () => const CreateReminderRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CreateReminderScreen(key: args.key),
      );
    },
    EditReminderRoute.name: (routeData) {
      final args = routeData.argsAs<EditReminderRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.EditReminderScreen(
          currentReminder: args.currentReminder,
          key: args.key,
        ),
      );
    },
    ReminderRoute.name: (routeData) {
      final args = routeData.argsAs<ReminderRouteArgs>(
          orElse: () => const ReminderRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ReminderScreen(key: args.key),
      );
    },
    ViewReminderRoute.name: (routeData) {
      final args = routeData.argsAs<ViewReminderRouteArgs>(
          orElse: () => const ViewReminderRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ViewReminderScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i12.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i12.PageInfo<DashboardRouteArgs> page =
      _i12.PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CreateElderlyScreen]
class CreateElderlyRoute extends _i12.PageRouteInfo<void> {
  const CreateElderlyRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CreateElderlyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateElderlyRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_CreateElderlyScreenState]
class _CreateElderlyRouteState extends _i12.PageRouteInfo<void> {
  const _CreateElderlyRouteState({List<_i12.PageRouteInfo>? children})
      : super(
          _CreateElderlyRouteState.name,
          initialChildren: children,
        );

  static const String name = '_CreateElderlyRouteState';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditElderlyScreen]
class EditElderlyRoute extends _i12.PageRouteInfo<EditElderlyRouteArgs> {
  EditElderlyRoute({
    _i13.Key? key,
    required _i14.Elderly currentElderly,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EditElderlyRoute.name,
          args: EditElderlyRouteArgs(
            key: key,
            currentElderly: currentElderly,
          ),
          initialChildren: children,
        );

  static const String name = 'EditElderlyRoute';

  static const _i12.PageInfo<EditElderlyRouteArgs> page =
      _i12.PageInfo<EditElderlyRouteArgs>(name);
}

class EditElderlyRouteArgs {
  const EditElderlyRouteArgs({
    this.key,
    required this.currentElderly,
  });

  final _i13.Key? key;

  final _i14.Elderly currentElderly;

  @override
  String toString() {
    return 'EditElderlyRouteArgs{key: $key, currentElderly: $currentElderly}';
  }
}

/// generated route for
/// [_i4.ElderlyScreen]
class ElderlyRoute extends _i12.PageRouteInfo<void> {
  const ElderlyRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ElderlyRoute.name,
          initialChildren: children,
        );

  static const String name = 'ElderlyRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ViewElderlyScreen]
class ViewElderlyRoute extends _i12.PageRouteInfo<ViewElderlyRouteArgs> {
  ViewElderlyRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ViewElderlyRoute.name,
          args: ViewElderlyRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ViewElderlyRoute';

  static const _i12.PageInfo<ViewElderlyRouteArgs> page =
      _i12.PageInfo<ViewElderlyRouteArgs>(name);
}

class ViewElderlyRouteArgs {
  const ViewElderlyRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ViewElderlyRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.AllRecordsScreen]
class AllRecordsRoute extends _i12.PageRouteInfo<AllRecordsRouteArgs> {
  AllRecordsRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AllRecordsRoute.name,
          args: AllRecordsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AllRecordsRoute';

  static const _i12.PageInfo<AllRecordsRouteArgs> page =
      _i12.PageInfo<AllRecordsRouteArgs>(name);
}

class AllRecordsRouteArgs {
  const AllRecordsRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'AllRecordsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RecordingScreen]
class RecordingRoute extends _i12.PageRouteInfo<void> {
  const RecordingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RecordingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecordingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CreateReminderScreen]
class CreateReminderRoute extends _i12.PageRouteInfo<CreateReminderRouteArgs> {
  CreateReminderRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CreateReminderRoute.name,
          args: CreateReminderRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateReminderRoute';

  static const _i12.PageInfo<CreateReminderRouteArgs> page =
      _i12.PageInfo<CreateReminderRouteArgs>(name);
}

class CreateReminderRouteArgs {
  const CreateReminderRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'CreateReminderRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.EditReminderScreen]
class EditReminderRoute extends _i12.PageRouteInfo<EditReminderRouteArgs> {
  EditReminderRoute({
    required _i15.Reminder currentReminder,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EditReminderRoute.name,
          args: EditReminderRouteArgs(
            currentReminder: currentReminder,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditReminderRoute';

  static const _i12.PageInfo<EditReminderRouteArgs> page =
      _i12.PageInfo<EditReminderRouteArgs>(name);
}

class EditReminderRouteArgs {
  const EditReminderRouteArgs({
    required this.currentReminder,
    this.key,
  });

  final _i15.Reminder currentReminder;

  final _i13.Key? key;

  @override
  String toString() {
    return 'EditReminderRouteArgs{currentReminder: $currentReminder, key: $key}';
  }
}

/// generated route for
/// [_i10.ReminderScreen]
class ReminderRoute extends _i12.PageRouteInfo<ReminderRouteArgs> {
  ReminderRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ReminderRoute.name,
          args: ReminderRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ReminderRoute';

  static const _i12.PageInfo<ReminderRouteArgs> page =
      _i12.PageInfo<ReminderRouteArgs>(name);
}

class ReminderRouteArgs {
  const ReminderRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ReminderRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.ViewReminderScreen]
class ViewReminderRoute extends _i12.PageRouteInfo<ViewReminderRouteArgs> {
  ViewReminderRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ViewReminderRoute.name,
          args: ViewReminderRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ViewReminderRoute';

  static const _i12.PageInfo<ViewReminderRouteArgs> page =
      _i12.PageInfo<ViewReminderRouteArgs>(name);
}

class ViewReminderRouteArgs {
  const ViewReminderRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ViewReminderRouteArgs{key: $key}';
  }
}