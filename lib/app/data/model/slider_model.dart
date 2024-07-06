import 'package:bring_me_bd/app/domain/entity/slider_entity.dart';

class SliderModel extends SliderEntity {
  SliderModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.content,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['content'] = content;
    return data;
  }
}
