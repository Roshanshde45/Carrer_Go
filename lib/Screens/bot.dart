// import 'package:bubble/bubble.dart';
// import 'package:dialog_flowtter/dialog_flowtter.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_dialogflow/dialogflow_v2.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late DialogFlowtter dialogFlowtter;

//   List<Map<String, dynamic>> messages = [];

//   @override
//   void initState() {
//     super.initState();
//     DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
//   }

//   // void response(query) async {
//   //   print(query);
//   //   DialogAuthCredentials credentials = DialogAuthCredentials.fromJson("");
//   //   // AuthGoogle authGoogle =
//   //   //     await AuthGoogle(fileJson: "assets/apebot-utij-4272c0ec9440.json")
//   //   //         .build();
//   //   // Dialogflow dialogflow =
//   //   //     Dialogflow(authGoogle: authGoogle, language: Language.english);
//   //   // AIResponse aiResponse = await dialogflow.detectIntent("Hi");
//   //   setState(() {
//   //     messsages.insert(0, {
//   //       "data": 0,
//   //       "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
//   //     });
//   //   });
//   // }

//   void sendMessage(String text) async {
//     if (text.isEmpty) return;
//     setState(() {
//       addMessage(
//         Message(text: DialogText(text: [text])),
//         true,
//       );
//     });

//     // dialogFlowtter.projectId = "deimos-apps-0905";

//     DetectIntentResponse response = await dialogFlowtter.detectIntent(
//       queryInput: QueryInput(text: TextInput(text: text)),
//     );

//     if (response.message == null) return;
//     setState(() {
//       addMessage(response.message!);
//     });
//   }

//   void addMessage(Message message, [bool isUserMessage = false]) {
//     messages.add({
//       'message': message,
//       'isUserMessage': isUserMessage,
//     });
//   }

//   final messageInsert = TextEditingController();
//   List<Map> messsages = newList();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Consultant Bot",
//         ),
//         backgroundColor: Colors.deepOrange,
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Flexible(
//                 child: ListView.builder(
//                     reverse: true,
//                     itemCount: messsages.length,
//                     itemBuilder: (context, index) => chat(
//                         messsages[index]["message"].toString(),
//                         messsages[index]["data"]))),
//             Divider(
//               height: 5.0,
//               color: Colors.deepOrange,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 15.0, right: 15.0),
//               margin: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                       child: TextField(
//                     controller: messageInsert,
//                     decoration: InputDecoration.collapsed(
//                         hintText: "Send your message",
//                         hintStyle: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18.0)),
//                   )),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 4.0),
//                     child: IconButton(
//                         icon: Icon(
//                           Icons.send,
//                           size: 30.0,
//                           color: Colors.deepOrange,
//                         ),
//                         onPressed: () {
//                           if (messageInsert.text.isEmpty) {
//                             print("empty message");
//                           } else {
//                             setState(() {
//                               messsages.insert(0,
//                                   {"data": 1, "message": messageInsert.text});
//                             });
//                             sendMessage(messageInsert.text);
//                             messageInsert.clear();
//                             // response(messageInsert.text);
//                             // messageInsert.clear();
//                           }
//                         }),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15.0,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   //for better one i have use the bubble package check out the pubspec.yaml

//   Widget chat(String message, int data) {
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Bubble(
//           radius: Radius.circular(15.0),
//           color: data == 0 ? Colors.deepOrange : Colors.orangeAccent,
//           elevation: 0.0,
//           alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
//           nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
//           child: Padding(
//             padding: EdgeInsets.all(2.0),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: AssetImage(
//                       data == 0 ? "assets/bot.png" : "assets/user.png"),
//                 ),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Flexible(
//                     child: Text(
//                   message,
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ))
//               ],
//             ),
//           )),
//     );
//   }
// }
