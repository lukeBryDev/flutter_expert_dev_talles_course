import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/src/presentation/providers/chat_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6).theme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(
              child: Text('Hello World'),
            ),
          ),
        ),
      ),
    );
  }
}
