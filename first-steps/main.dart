import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const openAIkey = '';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final mainState = MainState();
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      mainState.getChatCompletionHttp(
        inputController.text,
        setState,
      );
    }

    var fullWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    right: 25,
                    left: 25,
                    bottom: 65,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mainState.messages.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const CircleAvatar(),
                          Flexible(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child:
                                    Text(mainState.messages[index]['content']),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                height: 50,
                width: fullWidth,
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(500),
                          ),
                        ),
                        controller: inputController,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const systemPrompt =
    'You will try to teach me german (deutsch). For any word or phrase I ask you about, provide a translation, mulitple possible meanings, etymology and a few example uses in sentence. Describe the individual stem words that the word is made of, with the translation, etymology and example uses of the individual words as well.';

class MainState {
  final messages = [];
  final systemMessage = {
    'content': systemPrompt,
    'role': 'system',
  };

  MainState() {
    messages.add(systemMessage);
  }

  getChatCompletionHttp(
    String prompt,
    void Function(void Function()) callback,
  ) async {
    String urlRaw = 'https://api.openai.com/v1/chat/completions';
    messages.add({
      'content': prompt,
      'role': 'user',
    });
    callback(() {});
    var response = await http.post(
      Uri.parse(urlRaw),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $openAIkey'
      },
      body: jsonEncode({'model': 'gpt-3.5-turbo', 'messages': messages}),
    );
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    messages.add(json['choices'][0]['message']);
    callback(() {});
  }
}
