import 'package:bring_me_bd/app/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    super.id,
    super.name,
    super.slug,
    super.displayMode,
    super.description,
    super.metaTitle,
    super.metaDescription,
    super.metaKeywords,
    super.status,
    super.imageUrl,
    super.categoryIconPath,
    super.additional,
    super.createdAt,
    super.updatedAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    displayMode = json['display_mode'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    imageUrl = json['image_url'];
    categoryIconPath = json['category_icon_path'];
    additional = json['additional'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['display_mode'] = displayMode;
    data['description'] = description;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['status'] = status;
    data['image_url'] = imageUrl;
    data['category_icon_path'] = categoryIconPath;
    data['additional'] = additional;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
