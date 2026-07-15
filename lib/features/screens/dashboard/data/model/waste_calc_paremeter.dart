class WasteCalcParemeter {
  final List<MaterialItem> items;

  WasteCalcParemeter({
    required this.items,
  });



  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class MaterialItem {
  final int materialId ;
  final double requiredQuantity;

  MaterialItem({
    required this.materialId,
    required this.requiredQuantity,
  });


  Map<String, dynamic> toJson() {
    return {
      'material_id': materialId,
      'required_quantity': requiredQuantity,
    };
  }
}