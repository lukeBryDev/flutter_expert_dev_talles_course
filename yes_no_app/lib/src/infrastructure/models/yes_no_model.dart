import 'package:yes_no_app/src/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() {
    String message;
    switch (answer.toLowerCase()) {
      case 'yes':
        message = 'si';
        break;
      case 'no':
        message = 'no';
        break;
      case 'maybe':
        message = 'tal vez';
        break;
      default:
        message = '';
    }

    return Message(text: message, fromWho: FromWho.hers, imageUrl: image);
  }
}
