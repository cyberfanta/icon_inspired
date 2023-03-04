import 'package:flutter_test/flutter_test.dart';
import 'package:icon_inspired/tools/stamp.dart';

String tag = "UnitTest";

List<List<Object>> model = [
  // [
  //   InstallPostCityOnSite,
  //   InstallPostCityOnSite.defaultInstance(),
  //   installPostCityOnSiteFromJson(InstallPostCityOnSite.otherInstance().toString()),
  // ],
];

void main() {
  for (int i = 0; i < model.length; i++) {
    group("Model: ${model[i][0].toString()}", () {
      stamp(model[i][0].toString(),
          "Def.Ins.[$i]: ${model[i][1]} - ${(model[i][1].runtimeType == model[i][0]) ? "OK" : "NO OK"}");
      stamp(model[i][0].toString(),
          "toString[$i]: ${model[i][2]} - ${(model[i][2].runtimeType == model[i][0]) ? "OK" : "NO OK"}\n\n");

      testWidgets('Test - Def.Ins.', (WidgetTester tester) async {
        expect(model[i][1].runtimeType, model[i][0]);
      });

      testWidgets('Test - toString', (WidgetTester tester) async {
        expect(model[i][2].runtimeType, model[i][0]);
      });

      testWidgets('Control Test - Def.Ins. vs toString',
          (WidgetTester tester) async {
        expect(model[i][1].runtimeType, model[i][2].runtimeType);
      });
    });
  }
}
