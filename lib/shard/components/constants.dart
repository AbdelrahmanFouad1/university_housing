import 'package:university_housing/model/complaints_model.dart';
import 'package:university_housing/model/get_buildings_model.dart';
import 'package:university_housing/model/get_notifications_model.dart';
import 'package:university_housing/model/queries_model.dart';
import 'package:university_housing/model/students_model.dart';

String token ='';

String idDB ='';

StudentsModel? currentStudentsModel ;

GetBuildingsModel? buildings;

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}