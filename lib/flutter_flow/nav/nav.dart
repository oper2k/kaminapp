import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';
import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : Onboarding1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : Onboarding1Widget(),
          routes: [
            FFRoute(
              name: 'Onboarding_1',
              path: 'onboarding1',
              builder: (context, params) => Onboarding1Widget(),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'Signin',
              path: 'signin',
              builder: (context, params) => SigninWidget(),
            ),
            FFRoute(
              name: 'ResetPassword',
              path: 'resetPassword',
              builder: (context, params) => ResetPasswordWidget(),
            ),
            FFRoute(
              name: 'ResetPasswordSuccess',
              path: 'resetPasswordSuccess',
              builder: (context, params) => ResetPasswordSuccessWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'Edit_Profile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'Basic_Course',
              path: 'basicCourse',
              builder: (context, params) => BasicCourseWidget(
                currentCourse: params.getParam<CourseRow>(
                    'currentCourse', ParamType.SupabaseRow),
              ),
            ),
            FFRoute(
              name: 'SubLessonsDetailsSlides',
              path: 'subLessonsDetailsSlides',
              builder: (context, params) => SubLessonsDetailsSlidesWidget(
                currentSubLesson: params.getParam<SubLessonsRow>(
                    'currentSubLesson', ParamType.SupabaseRow),
              ),
            ),
            FFRoute(
              name: 'TestsDetails',
              path: 'testsDetails',
              builder: (context, params) => TestsDetailsWidget(
                currentTest: params.getParam<TestsRow>(
                    'currentTest', ParamType.SupabaseRow),
                currentCourse: params.getParam<CourseRow>(
                    'currentCourse', ParamType.SupabaseRow),
                currentLesson: params.getParam<LessonsRow>(
                    'currentLesson', ParamType.SupabaseRow),
              ),
            ),
            FFRoute(
              name: 'TestEnd',
              path: 'testEnd',
              builder: (context, params) => TestEndWidget(),
            ),
            FFRoute(
              name: 'Admin',
              path: 'admin',
              builder: (context, params) => AdminWidget(),
            ),
            FFRoute(
              name: 'AdminTestDetail',
              path: 'adminTestDetail',
              builder: (context, params) => AdminTestDetailWidget(
                currentTestAnswers: params.getParam<TestsAnswersRow>(
                    'currentTestAnswers', ParamType.SupabaseRow),
              ),
            ),
            FFRoute(
              name: 'Dictionary',
              path: 'dictionary',
              builder: (context, params) => DictionaryWidget(),
            ),
            FFRoute(
              name: 'MapAll',
              path: 'mapAll',
              builder: (context, params) => MapAllWidget(),
            ),
            FFRoute(
              name: 'MapUC',
              path: 'mapUC',
              builder: (context, params) => MapUCWidget(),
            ),
            FFRoute(
              name: 'MapSecondFloor',
              path: 'mapSecondFloor',
              builder: (context, params) => MapSecondFloorWidget(),
            ),
            FFRoute(
              name: 'MapThirdFloor',
              path: 'mapThirdFloor',
              builder: (context, params) => MapThirdFloorWidget(),
            ),
            FFRoute(
              name: 'MapFourthFloor',
              path: 'mapFourthFloor',
              builder: (context, params) => MapFourthFloorWidget(),
            ),
            FFRoute(
              name: 'MapSales',
              path: 'mapSales',
              builder: (context, params) => MapSalesWidget(),
            ),
            FFRoute(
              name: 'MapBO',
              path: 'mapBO',
              builder: (context, params) => MapBOWidget(),
            ),
            FFRoute(
              name: 'MapTO',
              path: 'mapTO',
              builder: (context, params) => MapTOWidget(),
            ),
            FFRoute(
              name: 'Cheklist',
              path: 'cheklist',
              builder: (context, params) => CheklistWidget(),
            ),
            FFRoute(
              name: 'Contacts',
              path: 'contacts',
              builder: (context, params) => ContactsWidget(),
            ),
            FFRoute(
              name: 'Chat',
              path: 'chat',
              builder: (context, params) => ChatWidget(
                chat: params.getParam<ChatsRow>('chat', ParamType.SupabaseRow),
              ),
            ),
            FFRoute(
              name: 'AllChats',
              path: 'allChats',
              builder: (context, params) => AllChatsWidget(),
            ),
            FFRoute(
              name: 'TestEndSuccess',
              path: 'testEndSuccess',
              builder: (context, params) => TestEndSuccessWidget(
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'MapEat',
              path: 'mapEat',
              builder: (context, params) => MapEatWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/1_.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
