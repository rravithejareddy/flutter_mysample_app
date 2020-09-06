class Filter {
  const Filter(this.cropType, this.cropName, this.quantity, this.grade);

  Filter.initial()
      : this(
          <String>[],
          <String>[],
          <int>[],
          <int>[],
        );

  final List<String> cropType;
  final List<String> cropName;
  final List<int> quantity;
  final List<int> grade;

  Filter fromAddedItem({
    String cropType,
    String cropName,
    int quantity,
    int grade,
  }) {
    this.cropType.add(cropType);
    this.cropName.add(cropName);
    this.quantity.add(quantity);
    this.grade.add(grade);

    return Filter(
      this.cropType,
      this.cropName,
      this.quantity,
      this.grade,
    );
  }

  Filter fromRemovedItem({
    String cropType,
    String cropName,
    int quantity,
    int grade,
  }) {
    if (cropType != null) {
      this.cropType.removeWhere((item) => item == cropType);
    } else if (cropName != null) {
      this.cropName.removeWhere((item) => item == cropName);
    } else if (quantity != null) {
      this.quantity.removeWhere((item) => item == quantity);
    } else if (grade != null) {
      this.grade.removeWhere((item) => item == grade);
    }

    return Filter(
      this.cropType,
      this.cropName,
      this.quantity,
      this.grade,
    );
  }

  List<Object> get props => [cropType, cropName, quantity, grade];
}
