import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreDatasource {
  // Future<List<PastpaperModel>> readPastpapers();
  //
  // Future<List<PaperModel>> readPapers();
}

class FirestoreDatasourceImpl implements FirestoreDatasource {
  final FirebaseFirestore firestore;

  FirestoreDatasourceImpl({required this.firestore});

  // @override
  // Future<List<PastpaperModel>> readPastpapers() async {
  //   final documentSnapshot =
  //       await firestore.collection("pastpapers").doc("all").get();
  //   final docAr = documentSnapshot.get("data");
  //
  //   final papers = <PastpaperModel>[];
  //
  //   for (final dynamic pData in docAr) {
  //     papers.add(PastpaperModel(
  //         desc: pData['desc'],
  //         marking_scheme_url: pData['marking_scheme_url'],
  //         paper_url: pData['paper_url'],
  //         title: pData['title'],
  //         year: pData['year'],
  //         time_stamp: pData['time_stamp']));
  //   }
  //   return papers;
  // }

  // @override
  // Future<List<PaperModel>> readPapers() async {
  //   final papers = <PaperModel>[];
  //
  //   final paperSnapshots = await firestore.collection("papers").get();
  //   for (DocumentSnapshot documentSnapshot in paperSnapshots.docs) {
  //     Map<String, dynamic> dataMap =
  //         documentSnapshot.data() as Map<String, dynamic>;
  //
  //     papers.add(PaperModel(
  //         title: dataMap['title'],
  //         finished_count: dataMap['finished_count'],
  //         marks: dataMap['marks'],
  //         started_count: dataMap['started_count'],
  //         time: dataMap['time'],
  //         published: dataMap['published'],
  //         added_on: dataMap['added_on'],
  //         updated_on: dataMap['updated_on'],
  //         questions: await _toQuestions(dataMap['questions'])));
  //   }
  //
  //   return papers;
  // }
  //
  // Future<List<QuestionModel>> _toQuestions(List<dynamic> questions) async {
  //   List<QuestionModel> qList = [];
  //
  //   for (var element in questions) {
  //     qList.add(QuestionModel(
  //         id: element['id'],
  //         type: element['type'],
  //         answer_id: element['answer_id'],
  //         question: element['question'],
  //         answers: await _toAnswers(element['answers'])));
  //   }
  //
  //   return qList;
  // }
  //
  // Future<List<AnswerModel>> _toAnswers(List<dynamic> answers) async {
  //   List<AnswerModel> aList = [];
  //
  //   for (var element in answers) {
  //     aList.add(AnswerModel(id: element['id'], answer: element['answer']));
  //   }
  //
  //   return aList;
  // }
}
