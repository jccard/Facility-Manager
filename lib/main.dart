import 'dart:async';

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
//manager and models
import 'package:shop_app/services/facility-manager.dart';
import 'package:shop_app/models/Facility.dart';
import 'package:shop_app/models/ProdLine.dart';
import 'package:shop_app/models/Modifier.dart';

import 'package:shop_app/screens/facility/production_lines/select.dart';

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
  Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        facilityManager.updateFacilityCurrentCash();
      });
    });
  }

  Future<String> _loadLocalJsonAssetAsString() async {
    return await rootBundle.loadString('assets/json/prod-lines.json');
  }

  Future createFacilityFromJson() async {
    String facilityString = await _loadLocalJsonAssetAsString();
    //Facility facilityObject = JsonMapper.deserialize<Facility>(facilityString);
    Facility facilityObject = JsonMapper.deserialize<Facility>(facilityString);
    print("createFacilitiesFromJson - facilityObject result: ${facilityObject}");
    facilityManager.addFromMain(facilityObject);
  }

  @override
  void initState() {
    JsonMapper()
        .useAdapter(flutterColorAdapter)
        .useAdapter(JsonMapperAdapter(valueDecorators: {
          typeOf<List<Facility>>(): (value) => value.cast<Facility>(),
          typeOf<List<Modifier>>(): (value) => value.cast<Modifier>(),
          typeOf<List<ProdLine>>(): (value) => value.cast<ProdLine>(),
          typeOf<List<ProdLineDepartment>>(): (value) => value.cast<ProdLineDepartment>(),
          typeOf<List<Employee>>(): (value) => value.cast<Employee>(),
        }));
    createFacilityFromJson().then((result) {
      setState(() {
        dataLoadCompleted = true;
        _startTimer();
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
          home: Select(),
        ),
      );
    }
  }
}
