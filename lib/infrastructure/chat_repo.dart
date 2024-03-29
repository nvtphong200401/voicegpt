import 'package:dartz/dartz.dart';
import 'package:voicegpt/infrastructure/models/failure.dart';
import 'package:voicegpt/infrastructure/models/message_model.dart';
import 'package:voicegpt/service/chat_service.dart';

class ChatRepository {
  final ChatService _chatService;
  ChatRepository(this._chatService);

  Future<Either<Failure, MessageModel>> sendMessage(List<MessageModel> messages) async {
    final response = await _chatService.sendMessage(messages);
    return response.fold((l) => left(l), (r) => right(r.choices.last.message));
  }
}
