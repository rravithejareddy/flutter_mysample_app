class CheckBoxListItem {
  int qty;
  int price;

  CheckBoxListItem(this.qty, this.price);

  factory CheckBoxListItem.fromJson(Map<String,dynamic> json) {
    return CheckBoxListItem(json['qty'], json['price']);
  }
}