// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:amide_app/features/data/models/elderly/elderly.dart' as _i16;
import 'package:amide_app/features/data/models/reminder/reminder.dart' as _i17;
import 'package:amide_app/realtime_screen.dart' as _i1;
import 'package:amide_app/views/screens/dashboard/dashboard.dart' as _i2;
import 'package:amide_app/views/screens/elderly/create.dart' as _i3;
import 'package:amide_app/views/screens/elderly/edit.dart' as _i4;
import 'package:amide_app/views/screens/elderly/elderly.dart' as _i5;
import 'package:amide_app/views/screens/elderly/view.dart' as _i6;
import 'package:amide_app/views/screens/records/all.dart' as _i7;
import 'package:amide_app/views/screens/records/record.dart' as _i8;
import 'package:amide_app/views/screens/records/recording.dart' as _i9;
import 'package:amide_app/views/screens/reminder/screens/create.dart' as _i10;
import 'package:amide_app/views/screens/reminder/screens/edit.dart' as _i11;
import 'package:amide_app/views/screens/reminder/screens/reminder.dart' as _i12;
import 'package:amide_app/views/screens/reminder/screens/view.dart' as _i13;
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    RealTimeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.RealTimeScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardScreen(),
      );
    },
    CreateElderlyRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CreateElderlyScreen(),
      );
    },
    EditElderlyRoute.name: (routeData) {
      final args = routeData.argsAs<EditElderlyRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EditElderlyScreen(
          key: args.key,
          elderly: args.elderly,
        ),
      );
    },
    ElderlyRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ElderlyScreen(),
      );
    },
    ViewElderlyRoute.name: (routeData) {
      final args = routeData.argsAs<ViewElderlyRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ViewElderlyScreen(
          key: args.key,
          elderly: args.elderly,
        ),
      );
    },
    AllRecordsRoute.name: (routeData) {
      final args = routeData.argsAs<AllRecordsRouteArgs>(orElse: () => const AllRecordsRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.AllRecordsScreen(
          elderly: args.elderly,
          key: args.key,
        ),
      );
    },
    RecordRoute.name: (routeData) {
      final args = routeData.argsAs<RecordRouteArgs>(orElse: () => const RecordRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RecordScreen(
          key: args.key,
          elderly: args.elderly,
        ),
      );
    },
    RecordingRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RecordingScreen(),
      );
    },
    CreateReminderRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CreateReminderScreen(),
      );
    },
    EditReminderRoute.name: (routeData) {
      final args = routeData.argsAs<EditReminderRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.EditReminderScreen(
          reminder: args.reminder,
          key: args.key,
        ),
      );
    },
    ReminderRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ReminderScreen(),
      );
    },
    ViewReminderRoute.name: (routeData) {
      final args = routeData.argsAs<ViewReminderRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.ViewReminderScreen(
          key: args.key,
          reminder: args.reminder,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.RealTimeScreen]
class RealTimeRoute extends _i14.PageRouteInfo<void> {
  const RealTimeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RealTimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RealTimeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CreateElderlyScreen]
class CreateElderlyRoute extends _i14.PageRouteInfo<void> {
  const CreateElderlyRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CreateElderlyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateElderlyRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EditElderlyScreen]
class EditElderlyRoute extends _i14.PageRouteInfo<EditElderlyRouteArgs> {
  EditElderlyRoute({
    _i15.Key? key,
    required _i16.Elderly elderly,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          EditElderlyRoute.name,
          args: EditElderlyRouteArgs(
            key: key,
            elderly: elderly,
          ),
          initialChildren: children,
        );

  static const String name = 'EditElderlyRoute';

  static const _i14.PageInfo<EditElderlyRouteArgs> page = _i14.PageInfo<EditElderlyRouteArgs>(name);
}

class EditElderlyRouteArgs {
  const EditElderlyRouteArgs({
    this.key,
    required this.elderly,
  });

  final _i15.Key? key;

  final _i16.Elderly elderly;

  @override
  String toString() {
    return 'EditElderlyRouteArgs{key: $key, elderly: $elderly}';
  }
}

/// generated route for
/// [_i5.ElderlyScreen]
class ElderlyRoute extends _i14.PageRouteInfo<void> {
  const ElderlyRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ElderlyRoute.name,
          initialChildren: children,
        );

  static const String name = 'ElderlyRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ViewElderlyScreen]
class ViewElderlyRoute extends _i14.PageRouteInfo<ViewElderlyRouteArgs> {
  ViewElderlyRoute({
    _i15.Key? key,
    required _i16.Elderly elderly,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ViewElderlyRoute.name,
          args: ViewElderlyRouteArgs(
            key: key,
            elderly: elderly,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewElderlyRoute';

  static const _i14.PageInfo<ViewElderlyRouteArgs> page = _i14.PageInfo<ViewElderlyRouteArgs>(name);
}

class ViewElderlyRouteArgs {
  const ViewElderlyRouteArgs({
    this.key,
    required this.elderly,
  });

  final _i15.Key? key;

  final _i16.Elderly elderly;

  @override
  String toString() {
    return 'ViewElderlyRouteArgs{key: $key, elderly: $elderly}';
  }
}

/// generated route for
/// [_i7.AllRecordsScreen]
class AllRecordsRoute extends _i14.PageRouteInfo<AllRecordsRouteArgs> {
  AllRecordsRoute({
    _i16.Elderly? elderly,
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          AllRecordsRoute.name,
          args: AllRecordsRouteArgs(
            elderly: elderly,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AllRecordsRoute';

  static const _i14.PageInfo<AllRecordsRouteArgs> page = _i14.PageInfo<AllRecordsRouteArgs>(name);
}

class AllRecordsRouteArgs {
  const AllRecordsRouteArgs({
    this.elderly,
    this.key,
  });

  final _i16.Elderly? elderly;

  final _i15.Key? key;

  @override
  String toString() {
    return 'AllRecordsRouteArgs{elderly: $elderly, key: $key}';
  }
}

/// generated route for
/// [_i8.RecordScreen]
class RecordRoute extends _i14.PageRouteInfo<RecordRouteArgs> {
  RecordRoute({
    _i15.Key? key,
    _i16.Elderly? elderly,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RecordRoute.name,
          args: RecordRouteArgs(
            key: key,
            elderly: elderly,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordRoute';

  static const _i14.PageInfo<RecordRouteArgs> page = _i14.PageInfo<RecordRouteArgs>(name);
}

class RecordRouteArgs {
  const RecordRouteArgs({
    this.key,
    this.elderly,
  });

  final _i15.Key? key;

  final _i16.Elderly? elderly;

  @override
  String toString() {
    return 'RecordRouteArgs{key: $key, elderly: $elderly}';
  }
}

/// generated route for
/// [_i9.RecordingScreen]
class RecordingRoute extends _i14.PageRouteInfo<void> {
  const RecordingRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RecordingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecordingRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CreateReminderScreen]
class CreateReminderRoute extends _i14.PageRouteInfo<void> {
  const CreateReminderRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CreateReminderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateReminderRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.EditReminderScreen]
class EditReminderRoute extends _i14.PageRouteInfo<EditReminderRouteArgs> {
  EditReminderRoute({
    required _i17.Reminder reminder,
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          EditReminderRoute.name,
          args: EditReminderRouteArgs(
            reminder: reminder,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditReminderRoute';

  static const _i14.PageInfo<EditReminderRouteArgs> page = _i14.PageInfo<EditReminderRouteArgs>(name);
}

class EditReminderRouteArgs {
  const EditReminderRouteArgs({
    required this.reminder,
    this.key,
  });

  final _i17.Reminder reminder;

  final _i15.Key? key;

  @override
  String toString() {
    return 'EditReminderRouteArgs{reminder: $reminder, key: $key}';
  }
}

/// generated route for
/// [_i12.ReminderScreen]
class ReminderRoute extends _i14.PageRouteInfo<void> {
  const ReminderRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ReminderRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReminderRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ViewReminderScreen]
class ViewReminderRoute extends _i14.PageRouteInfo<ViewReminderRouteArgs> {
  ViewReminderRoute({
    _i15.Key? key,
    required _i17.Reminder reminder,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ViewReminderRoute.name,
          args: ViewReminderRouteArgs(
            key: key,
            reminder: reminder,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewReminderRoute';

  static const _i14.PageInfo<ViewReminderRouteArgs> page = _i14.PageInfo<ViewReminderRouteArgs>(name);
}

class ViewReminderRouteArgs {
  const ViewReminderRouteArgs({
    this.key,
    required this.reminder,
  });

  final _i15.Key? key;

  final _i17.Reminder reminder;

  @override
  String toString() {
    return 'ViewReminderRouteArgs{key: $key, reminder: $reminder}';
  }
}
