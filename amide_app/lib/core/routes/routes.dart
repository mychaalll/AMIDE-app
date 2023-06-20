import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: DashboardRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ReminderRoute.page,
          path: "/reminder",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: CreateReminderRoute.page,
          path: "/createReminder",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: EditReminderRoute.page,
          path: "/editReminder",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ViewReminderRoute.page,
          path: "/viewReminder",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ElderlyRoute.page,
          path: "/elderly",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: CreateElderlyRoute.page,
          path: "/createElderly",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: EditElderlyRoute.page,
          path: "/editElderly",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: ViewElderlyRoute.page,
          path: "/viewElderly",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: AllRecordsRoute.page,
          path: "/allRecords",
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: RealTimeRoute.page,
          // path: "/",
          transitionsBuilder: TransitionsBuilders.slideLeft,
          // initial: true,
        ),
        CustomRoute(
          page: RecordRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
      ];
}
