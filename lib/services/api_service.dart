import 'package:flutter/material.dart';
import 'package:shareover_api/api.dart';

class APIService extends InheritedWidget {
  final Function(String) setToken;
  late final ApiClient client;
  late final userApi = UserApi(client);
  late final offerApi = OfferApi(client);
  late final notificationApi = NotificationApi(client);

  APIService({
    super.key,
    required String basePath,
    required super.child,
    required Authentication auth,
    required this.setToken,
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
  bool updateShouldNotify(APIService oldWidget) => false;
}

class ApiServiceWrapper extends StatefulWidget {
  final Widget child;

  const ApiServiceWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<ApiServiceWrapper> createState() => _ApiServiceWrapperState();
}

class _ApiServiceWrapperState extends State<ApiServiceWrapper> {
  var auth = HttpBearerAuth();

  setToken(String token) {
    setState(() {
      auth.accessToken(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return APIService(
      basePath: "https://seeker.endrealm.net",
      auth: auth,
      setToken: setToken,
      child: widget.child,
    );
  }
}
