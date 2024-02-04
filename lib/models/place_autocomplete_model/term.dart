class Term {
  int? offset;
  String? value;

  Term({this.offset, this.value});

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        offset: json['offset'] as int?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'value': value,
      };
}
