import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shareover_api/api.dart';

import 'config_file_manager.dart';

class APIService extends InheritedWidget {
  final Function(String) setToken;
  late final ApiClient client;
  late final bool authorized;
  late final userApi = UserApi(client);
  late final offerApi = OfferApi(client);
  late final notificationApi = NotificationApi(client);

  APIService({
    super.key,
    required String basePath,
    required super.child,
    required Authentication auth,
    required this.setToken,
    required this.authorized,
  }) {
    client = ApiClient(basePath: basePath, authentication: auth);
  }

  static APIService? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<APIService>();
  }

  static APIService of(BuildContext context) {
    final APIService? result = maybeOf(context);
    assert(result != null, 'No APIService found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(APIService oldWidget) =>
      authorized != oldWidget.authorized;
}

class ApiServiceWrapper extends StatefulWidget {
  final Widget child;

  const ApiServiceWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<ApiServiceWrapper> createState() => _ApiServiceWrapperState();
}

class _ApiServiceWrapperState extends State<ApiServiceWrapper> {
  var auth = HttpBearerAuth();
  var authorized = false;

  setToken(String token, {bool save = true}) {
    setState(() {
      auth.accessToken = token;
      authorized = true;
      if(save) {
        ConfigFileManager().writeConfig(token).then((_) => print("Loaded"));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    ConfigFileManager().loadConfig().then((value) {
      print(value + "_> LOADED");
      if(value != "") setToken(value, save: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return APIService(
      basePath: "https://seeker.endrealm.net",
      auth: auth,
      setToken: setToken,
      authorized: authorized,
      child: widget.child,
    );
  }
}
