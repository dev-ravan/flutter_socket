import 'dart:ffi';
import 'dart:io';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketClient {
  /// Create the WebSocket channel

  void connectToSocket() {
    WebSocketChannel.connect(
      Uri.parse(
          'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self'),
    );
    // print("Socket connected....");
  }
}
