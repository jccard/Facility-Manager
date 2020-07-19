import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
//for Json import and serialization/deserialization
import 'package:flutter/services.dart'
    show rootBundle; // used to load a local file
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dart_json_mapper_flutter/dart_json_mapper_flutter.dart'
    show flutterColorAdapter;
import 'main.reflectable.dart';
//models
import 'package:shop_app/facility-manager.dart';
import 'package:shop_app/models/Facility.dart';
import 'package:shop_app/models/Department.dart';
import 'package:shop_app/models/SubDepartment.dart';

import 'package:shop_app/screens/facility/facility-select/screen-facility-select.dart';

void main() {
  initializeReflectable();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dataLoadCompleted = false;
  final FacilityManager facilityManager = FacilityManager();

  Future<String> _loadLocalJsonAssetAsString() async {
    return await rootBundle.loadString('assets/json/facility-data.json');
  }

  Future createFacilitiesFromJson() async {
    String facilityString = await _loadLocalJsonAssetAsString();
    Facility facilityObject = JsonMapper.deserialize<Facility>(facilityString);
    print("createFacilitiesFromJson - facilityObject result: ${facilityObject}");
    facilityManager.addFromMain(facilityObject);
  }

  @override
  void initState() {

    JsonMapper()
        .useAdapter(flutterColorAdapter)
        .useAdapter(JsonMapperAdapter(valueDecorators: {
          typeOf<List<Department>>(): (value) => value.cast<Department>(),
          typeOf<List<SubDepartment>>(): (value) => value.cast<SubDepartment>()
        }));
    createFacilitiesFromJson().then((result) {
      setState(() {
        dataLoadCompleted = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoadCompleted) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return ChangeNotifierProvider(
        create: (context) => facilityManager, //FacilityManager(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ScreenFacilitySelect(),
        ),
      );
    }
  }
}
