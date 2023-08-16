import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

List<String> msgList = [];

class FlutterSocket extends StatefulWidget {
  const FlutterSocket({super.key});

  @override
  State<FlutterSocket> createState() => _FlutterSocketState();
}

class _FlutterSocketState extends State<FlutterSocket> {
  final textController = TextEditingController();

  // Socket Connection
  final channel = IOWebSocketChannel.connect(
      "wss://free.blr2.piesocket.com/v3/1?api_key=Yio85XbYT8KywzIw1VI41PwbRUm38eY9HvfCiqwv&notify_self=1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "S O C K E T   F L U T T E R",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                snapshot.data != null
                    ? Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          snapshot.data ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2,
                                color: Colors.deepPurple), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Colors.deepPurple), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        // ! send data to the server
                        channel.sink.add(textController.text);
                        textController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder()),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
