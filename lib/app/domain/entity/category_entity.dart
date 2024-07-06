abstract class CategoryEntity{
  num? id;
  String? name;
  String? slug;
  String? displayMode;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  num? status;
  dynamic imageUrl;
  dynamic categoryIconPath;
  dynamic additional;
  String? createdAt;
  String? updatedAt;

  CategoryEntity(
      {this.id,
        this.name,
        this.slug,
        this.displayMode,
        this.description,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.status,
        this.imageUrl,
        this.categoryIconPath,
        this.additional,
        this.createdAt,
        this.updatedAt});

}