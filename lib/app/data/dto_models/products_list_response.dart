import 'package:bring_me_bd/app/data/dto_models/product_details_response.dart';

class ProductListResponse {
  List<Product>? data;
  PaginationLinks? links;
  Meta? meta;

  ProductListResponse({this.data, this.links, this.meta});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
    links =
        json['links'] != null ? PaginationLinks.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Product {

  int? id;
  String? type;
  String? name;
  String? urlKey;
  num? price;
  String? formatedPrice;
  String? shortDescription;
  String? description;
  String? sku;
  List<ProductImage>? images;
  ProductImage? baseImage;
  List<Variants>? variants;
  bool? inStock;
  Reviews? reviews;
  bool? isSaved;
  String? createdAt;
  String? updatedAt;


  Product(
      {this.id,
        this.type,
        this.name,
        this.urlKey,
        this.price,
        this.formatedPrice,
        this.shortDescription,
        this.description,
        this.sku,
        this.images,
        this.baseImage,
        this.variants,
        this.inStock,
        this.reviews,
        this.isSaved,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    urlKey = json['url_key'];
    price = num.tryParse(json['price']?.toString()??'0')??0;
    formatedPrice = json['formated_price'];
    shortDescription = json['short_description'];
    description = json['description'];
    sku = json['sku'];
    if (json['images'] != null) {
      images = <ProductImage>[];
      json['images'].forEach((v) {
        images!.add(new ProductImage.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    baseImage = json['base_image'] != null
        ? new ProductImage.fromJson(json['base_image'])
        : null;

    inStock = json['in_stock'];
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    isSaved = json['is_saved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['url_key'] = this.urlKey;
    data['price'] = this.price;
    data['formated_price'] = this.formatedPrice;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['sku'] = this.sku;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.baseImage != null) {
      data['base_image'] = this.baseImage!.toJson();
    }
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['in_stock'] = this.inStock;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    data['is_saved'] = this.isSaved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductImage {
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? originalImageUrl;

  ProductImage(
      {this.smallImageUrl,
      this.mediumImageUrl,
      this.largeImageUrl,
      this.originalImageUrl});

  ProductImage.fromJson(Map<String, dynamic> json) {
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
    originalImageUrl = json['original_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small_image_url'] = this.smallImageUrl;
    data['medium_image_url'] = this.mediumImageUrl;
    data['large_image_url'] = this.largeImageUrl;
    data['original_image_url'] = this.originalImageUrl;
    return data;
  }
}

class Prices {
  Regular? regular;
  Prices? from;
  Prices? to;
  Regular? finalPrice;

  Prices({this.regular, this.from, this.to, this.finalPrice});

  Prices.fromJson(Map<String, dynamic> json) {
    regular =
        json['regular'] != null ? Regular.fromJson(json['regular']) : null;
    from = json['from'] != null ? Prices.fromJson(json['from']) : null;
    to = json['to'] != null ? Prices.fromJson(json['to']) : null;
    finalPrice = json['final'] != null ? Regular.fromJson(json['final']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.regular != null) {
      data['regular'] = this.regular!.toJson();
    }
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to!.toJson();
    }
    if (this.finalPrice != null) {
      data['final'] = this.finalPrice!.toJson();
    }
    return data;
  }
}

class Regular {
  num? price;
  String? formattedPrice;

  Regular({this.price, this.formattedPrice});

  Regular.fromJson(Map<String, dynamic> json) {
    price = num.tryParse(json['price'].toString())??0;
    formattedPrice = json['formatted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = this.price;
    data['formatted_price'] = this.formattedPrice;
    return data;
  }
}

class PaginationLinks {
  String? first;
  String? last;
  String? prev;
  String? next;

  PaginationLinks({this.first, this.last, this.prev, this.next});

  PaginationLinks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  num? currentPage;
  num? from;
  num? lastPage;
  List<PaginationLinks>? links;
  String? path;
  num? perPage;
  num? to;
  num? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <PaginationLinks>[];
      json['links'].forEach((v) {
        links!.add(PaginationLinks.fromJson(v));
      });
    }
    path = json['path'];
    perPage = num.parse(json['per_page'].toString());
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
