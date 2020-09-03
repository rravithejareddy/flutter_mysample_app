
class Filter {
   const Filter(this.cropType, this.cropName, this.quantity, this.grade);

   const Filter.initial() : this(const <String>[], const <String>[],const <int>[], const <int>[]);

   final List<String> cropType;
   final List<String> cropName ;
   final List<int> quantity;
   final List<int> grade;

  Filter copyWith({String cropType, String cropName, int quantity, int grade}) {
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
  List<Object> get props => [cropType, cropName, quantity, grade];

}