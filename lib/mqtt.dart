import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:flutter/foundation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mqtt {
  static final client = MqttServerClient.withPort(
      ApiEndPoints.MQTTClientUrl, randomAlphaNumeric(10), ApiEndPoints.port);
  static bool isConnected = false;

  Mqtt() {
    client.useWebSocket = true;
    client.logging(on: false);
    client.keepAlivePeriod = 600;
    client.onConnected = onConnect;
    client.onAutoReconnected = onConnect;
    client.onAutoReconnect = onAutoReconnect;
    client.onDisconnected = onDisconnected;
    client.useWebSocket = true;
  }

  connect() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("auth_token") ?? "";
    if (token.isNotEmpty &&
        Mqtt.client.connectionStatus != null &&
        (Mqtt.client.connectionStatus?.state ==
            MqttConnectionState.disconnected)) {
      await Mqtt.client.connect("", token);
    }
  }

  onConnect() {
    isConnected = true;
    if (kDebugMode) {
      print("=============");
      print("connected");
      print("=============");
    }
  }

  onDisconnected() {
    isConnected = false;
    if (kDebugMode) {
      print("disconnected");
      print("***********");
    }

    connect();
  }

  onAutoReconnect() {
    isConnected = false;
    if (kDebugMode) {
      print("reconnecting");
      print("***********");
    }
  }
}
