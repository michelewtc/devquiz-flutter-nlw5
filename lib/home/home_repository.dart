import 'dart:convert';

import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

import '../shared/models/quiz_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    List<QuizModel> quizzes = [];
    try {
      final response =
              await rootBundle.loadString("assets/database/quizzes.json");
          final list = jsonDecode(response) as List;
          quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    } on Exception catch (e) {
      print(e);
    }   
    return quizzes;
  }
}
