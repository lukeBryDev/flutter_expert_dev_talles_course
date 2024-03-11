import 'package:flutter/cupertino.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/src/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String txt) async {
    if (txt.isEmpty) return;
    final newMessage = Message(text: txt, fromWho: FromWho.me);
    messages.add(newMessage);

    if (txt.endsWith('?')) {
      _herReply();
    }

    notifyListeners();
    _moveScrollToBottom();
  }

  Future<void> _herReply() async {
    final newMessage = await getYesNoAnswer.getAnswer();
    messages.add(newMessage);
    notifyListeners();
    _moveScrollToBottom();
  }

  Future<void> _moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
