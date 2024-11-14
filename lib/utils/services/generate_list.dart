import 'package:gas_sale/data/models/cylinder_model.dart';

class GenerateList {
  static List<CylinderModel> generate3KGCylinderList(List<CylinderModel> cylinders){
    int length = cylinders.length;
    return length > 10 ? cylinders.sublist(0, 10) : cylinders;
  }

  static List<CylinderModel> generate6KGCylinderList(List<CylinderModel> cylinders){
    int length = cylinders.length -1;
    return length > 20 ? cylinders.sublist(length ~/ 2, ((length ~/ 2) + 10)) : cylinders;
  }

  static List<CylinderModel> generate12KGCylinderList(List<CylinderModel> cylinders){
    int length = cylinders.length -1;
    return length > 20 ? cylinders.sublist(((length - 1) - 10), length -1) : cylinders;
  }

  static List<CylinderModel> generateAllCylinderList(List<CylinderModel> cylinders){
    List list3kg = generate3KGCylinderList(cylinders);
    List list6kg = generate6KGCylinderList(cylinders);
    List list12kg = generate12KGCylinderList(cylinders);
    return cylinders.where(
      (element) => list3kg.where((cylinder) => cylinder == element).toList().isEmpty
      && list6kg.where((cylinder) => cylinder == element).toList().isEmpty
      && list12kg.where((cylinder) => cylinder == element).toList().isEmpty,
    ).toList();
  }
}