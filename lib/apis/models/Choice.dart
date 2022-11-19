class Choice {
  late int id;
  late String selected;

  Choice({required this.id, required this.selected});

  Choice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['selected'] = selected;
    return data;
  }
}
