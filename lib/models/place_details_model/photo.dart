class Photo {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json['height'] as int?,
        htmlAttributions: json['html_attributions'] as List<String>?,
        photoReference: json['photo_reference'] as String?,
        width: json['width'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'html_attributions': htmlAttributions,
        'photo_reference': photoReference,
        'width': width,
      };
}
