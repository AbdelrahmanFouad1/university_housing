import 'package:university_housing/model/get_buildings_model.dart';

String token ='';

String idDB ='';

String totalCost ='1580';

GetBuildingsModel? buildings;

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}