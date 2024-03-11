import 'package:dio/dio.dart';
import 'package:yes_no_app/src/domain/entities/message.dart';
import 'package:yes_no_app/src/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  Future<Message> getAnswer() async {
    final dio = Dio();

    final response = await dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();
  }
}
