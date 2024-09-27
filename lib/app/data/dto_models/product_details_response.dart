class ProductDetailsResponse {
  ProductDetails? data;

  ProductDetailsResponse({this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ProductDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  num? id;
  String? sku;
  String? type;
  String? name;
  String? urlKey;
  String? price;
  String? formattedPrice;
  String? shortDescription;
  String? description;
  List<Images>? images;
  List<dynamic>? videos;
  BaseImage? baseImage;
  String? createdAt;
  String? updatedAt;
  Reviews? reviews;
  bool? inStock;
  bool? isSaved;
  bool? isItemInCart;
  bool? showQuantityChanger;
  List<ProductDetails>? variants;
  List<SuperAttributes>? superAttributes;

  ProductDetails(
      {this.id,
      this.sku,
      this.type,
      this.name,
      this.urlKey,
      this.price,
      this.formattedPrice,
      this.shortDescription,
      this.description,
      this.images,
      this.videos,
      this.baseImage,
      this.createdAt,
      this.updatedAt,
      this.reviews,
      this.inStock,
      this.isSaved,
      this.isItemInCart,
      this.showQuantityChanger,
      this.variants,
      this.superAttributes});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    urlKey = json['url_key'];
    price = json['price'];
    formattedPrice = json['formatted_price'];
    shortDescription = json['short_description'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <Null>[];
      json['videos'].forEach((v) {
        videos!.add(v);
      });
    }
    baseImage = json['base_image'] != null
        ? BaseImage.fromJson(json['base_image'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reviews =
        json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    inStock = json['in_stock'];
    isSaved = json['is_saved'];
    isItemInCart = json['is_item_in_cart'];
    showQuantityChanger = json['show_quantity_changer'];
    if (json['variants'] != null) {
      variants = <ProductDetails>[];
      json['variants'].forEach((v) {
        variants!.add(ProductDetails.fromJson(v));
      });
    }
    if (json['super_attributes'] != null) {
      superAttributes = <SuperAttributes>[];
      json['super_attributes'].forEach((v) {
        superAttributes!.add(SuperAttributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sku'] = sku;
    data['type'] = type;
    data['name'] = name;
    data['url_key'] = urlKey;
    data['price'] = price;
    data['formatted_price'] = formattedPrice;
    data['short_description'] = shortDescription;
    data['description'] = description;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    if (baseImage != null) {
      data['base_image'] = baseImage!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (reviews != null) {
      data['reviews'] = reviews!.toJson();
    }
    data['in_stock'] = inStock;
    data['is_saved'] = isSaved;
    data['is_item_in_cart'] = isItemInCart;
    data['show_quantity_changer'] = showQuantityChanger;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    if (superAttributes != null) {
      data['super_attributes'] =
          superAttributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  num? id;
  String? path;
  String? url;
  String? originalImageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;

  Images(
      {this.id,
      this.path,
      this.url,
      this.originalImageUrl,
      this.smallImageUrl,
      this.mediumImageUrl,
      this.largeImageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    url = json['url'];
    originalImageUrl = json['original_image_url'];
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['path'] = path;
    data['url'] = url;
    data['original_image_url'] = originalImageUrl;
    data['small_image_url'] = smallImageUrl;
    data['medium_image_url'] = mediumImageUrl;
    data['large_image_url'] = largeImageUrl;
    return data;
  }
}

class BaseImage {
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? originalImageUrl;

  BaseImage(
      {this.smallImageUrl,
      this.mediumImageUrl,
      this.largeImageUrl,
      this.originalImageUrl});

  BaseImage.fromJson(Map<String, dynamic> json) {
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
    originalImageUrl = json['original_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small_image_url'] = smallImageUrl;
    data['medium_image_url'] = mediumImageUrl;
    data['large_image_url'] = largeImageUrl;
    data['original_image_url'] = originalImageUrl;
    return data;
  }
}

class Reviews {
  num? total;
  num? totalRating;
  num? averageRating;
  List<dynamic>? percentage;

  Reviews({this.total, this.totalRating, this.averageRating, this.percentage});

  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = num.tryParse(json['average_rating'].toString())??0;
    if (json['percentage'] != null) {
      percentage = <Null>[];
      json['percentage'].forEach((v) {
        percentage!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['total_rating'] = totalRating;
    data['average_rating'] = averageRating;
    if (percentage != null) {
      data['percentage'] = percentage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variants {
  num? id;
  String? sku;
  String? type;
  num? parentId;
  num? attributeFamilyId;
  dynamic additional;
  String? createdAt;
  String? updatedAt;
  num? manageStock;
  String? shortDescription;
  String? description;
  String? name;
  String? urlKey;
  num? taxCategoryId;
  dynamic color;
  dynamic brand;
  dynamic productNumber;
  num? selectAgeGroup;
  dynamic neck;
  dynamic sleeve;
  dynamic metaTitle;
  dynamic metaKeywords;
  dynamic metaDescription;
  String? price;
  dynamic cost;
  dynamic specialPrice;
  dynamic specialPriceFrom;
  dynamic specialPriceTo;
  dynamic newEntry;
  dynamic featured;
  dynamic visibleIndividually;
  num? status;
  dynamic guestCheckout;
  dynamic length;
  dynamic width;
  dynamic height;
  String? weight;
  AttributeFamily? attributeFamily;
  List<AttributeValues>? attributeValues;
  List<InventoryIndices>? inventoryIndices;

  Variants(
      {this.id,
      this.sku,
      this.type,
      this.parentId,
      this.attributeFamilyId,
      this.additional,
      this.createdAt,
      this.updatedAt,
      this.manageStock,
      this.shortDescription,
      this.description,
      this.name,
      this.urlKey,
      this.taxCategoryId,
      this.color,
      this.brand,
      this.productNumber,
      this.selectAgeGroup,
      this.neck,
      this.sleeve,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.price,
      this.cost,
      this.specialPrice,
      this.specialPriceFrom,
      this.specialPriceTo,
      this.newEntry,
      this.featured,
      this.visibleIndividually,
      this.status,
      this.guestCheckout,
      this.length,
      this.width,
      this.height,
      this.weight,
      this.attributeFamily,
      this.attributeValues,
      this.inventoryIndices});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    type = json['type'];
    parentId = json['parent_id'];
    attributeFamilyId = json['attribute_family_id'];
    additional = json['additional'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    manageStock = json['manage_stock'];
    shortDescription = json['short_description'];
    description = json['description'];
    name = json['name'];
    urlKey = json['url_key'];
    taxCategoryId = json['tax_category_id'];
    color = json['color'];
    brand = json['brand'];
    productNumber = json['product_number'];
    selectAgeGroup = json['select_age_group'];
    neck = json['neck'];
    sleeve = json['sleeve'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    price = json['price'];
    cost = json['cost'];
    specialPrice = json['special_price'];
    specialPriceFrom = json['special_price_from'];
    specialPriceTo = json['special_price_to'];
    newEntry = json['new'];
    featured = json['featured'];
    visibleIndividually = json['visible_individually'];
    status = json['status'];
    guestCheckout = json['guest_checkout'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    weight = json['weight'];
    attributeFamily = json['attribute_family'] != null
        ? AttributeFamily.fromJson(json['attribute_family'])
        : null;
    if (json['attribute_values'] != null) {
      attributeValues = <AttributeValues>[];
      json['attribute_values'].forEach((v) {
        attributeValues!.add(AttributeValues.fromJson(v));
      });
    }
    if (json['inventory_indices'] != null) {
      inventoryIndices = <InventoryIndices>[];
      json['inventory_indices'].forEach((v) {
        inventoryIndices!.add(InventoryIndices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sku'] = sku;
    data['type'] = type;
    data['parent_id'] = parentId;
    data['attribute_family_id'] = attributeFamilyId;
    data['additional'] = additional;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['manage_stock'] = manageStock;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['name'] = name;
    data['url_key'] = urlKey;
    data['tax_category_id'] = taxCategoryId;
    data['color'] = color;
    data['brand'] = brand;
    data['product_number'] = productNumber;
    data['select_age_group'] = selectAgeGroup;
    data['neck'] = neck;
    data['sleeve'] = sleeve;
    data['meta_title'] = metaTitle;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    data['price'] = price;
    data['cost'] = cost;
    data['special_price'] = specialPrice;
    data['special_price_from'] = specialPriceFrom;
    data['special_price_to'] = specialPriceTo;
    data['new'] = newEntry;
    data['featured'] = featured;
    data['visible_individually'] = visibleIndividually;
    data['status'] = status;
    data['guest_checkout'] = guestCheckout;
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    data['weight'] = weight;
    if (attributeFamily != null) {
      data['attribute_family'] = attributeFamily!.toJson();
    }
    if (attributeValues != null) {
      data['attribute_values'] =
          attributeValues!.map((v) => v.toJson()).toList();
    }
    if (inventoryIndices != null) {
      data['inventory_indices'] =
          inventoryIndices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributeFamily {
  num? id;
  String? code;
  String? name;
  num? status;
  num? isUserDefined;

  AttributeFamily(
      {this.id, this.code, this.name, this.status, this.isUserDefined});

  AttributeFamily.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    status = json['status'];
    isUserDefined = json['is_user_defined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['status'] = status;
    data['is_user_defined'] = isUserDefined;
    return data;
  }
}

class AttributeValues {
  num? id;
  String? locale;
  String? channel;
  String? textValue;
  num? booleanValue;
  num? numegerValue;
  String? floatValue;
  dynamic datetimeValue;
  dynamic dateValue;
  dynamic jsonValue;
  num? productId;
  num? attributeId;

  AttributeValues(
      {this.id,
      this.locale,
      this.channel,
      this.textValue,
      this.booleanValue,
      this.numegerValue,
      this.floatValue,
      this.datetimeValue,
      this.dateValue,
      this.jsonValue,
      this.productId,
      this.attributeId});

  AttributeValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    channel = json['channel'];
    textValue = json['text_value'];
    booleanValue = json['boolean_value'];
    numegerValue = json['numeger_value'];
    floatValue = json['float_value'];
    datetimeValue = json['datetime_value'];
    dateValue = json['date_value'];
    jsonValue = json['json_value'];
    productId = json['product_id'];
    attributeId = json['attribute_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locale'] = locale;
    data['channel'] = channel;
    data['text_value'] = textValue;
    data['boolean_value'] = booleanValue;
    data['numeger_value'] = numegerValue;
    data['float_value'] = floatValue;
    data['datetime_value'] = datetimeValue;
    data['date_value'] = dateValue;
    data['json_value'] = jsonValue;
    data['product_id'] = productId;
    data['attribute_id'] = attributeId;
    return data;
  }
}

class InventoryIndices {
  num? id;
  num? qty;
  num? productId;
  num? channelId;
  dynamic createdAt;
  dynamic updatedAt;

  InventoryIndices(
      {this.id,
      this.qty,
      this.productId,
      this.channelId,
      this.createdAt,
      this.updatedAt});

  InventoryIndices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qty = json['qty'];
    productId = json['product_id'];
    channelId = json['channel_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qty'] = qty;
    data['product_id'] = productId;
    data['channel_id'] = channelId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SuperAttributes {
  num? id;
  String? name;
  String? adminName;
  String? code;
  String? type;
  String? swatchType;
  List<Options>? options;
  dynamic validation;
  dynamic position;
  num? isComparable;
  num? isConfigurable;
  num? isRequired;
  num? isUnique;
  num? isFilterable;
  num? isUserDefined;
  num? isVisibleOnFront;
  dynamic useInFlat;
  num? valuePerLocale;
  num? valuePerChannel;
  String? createdAt;
  String? updatedAt;

  SuperAttributes(
      {this.id,
      this.name,
      this.adminName,
      this.code,
      this.type,
      this.swatchType,
      this.options,
      this.validation,
      this.position,
      this.isComparable,
      this.isConfigurable,
      this.isRequired,
      this.isUnique,
      this.isFilterable,
      this.isUserDefined,
      this.isVisibleOnFront,
      this.useInFlat,
      this.valuePerLocale,
      this.valuePerChannel,
      this.createdAt,
      this.updatedAt});

  SuperAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adminName = json['admin_name'];
    code = json['code'];
    type = json['type'];
    swatchType = json['swatch_type'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    validation = json['validation'];
    position = json['position'];
    isComparable = json['is_comparable'];
    isConfigurable = json['is_configurable'];
    isRequired = json['is_required'];
    isUnique = json['is_unique'];
    isFilterable = json['is_filterable'];
    isUserDefined = json['is_user_defined'];
    isVisibleOnFront = json['is_visible_on_front'];
    useInFlat = json['use_in_flat'];
    valuePerLocale = json['value_per_locale'];
    valuePerChannel = json['value_per_channel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['admin_name'] = adminName;
    data['code'] = code;
    data['type'] = type;
    data['swatch_type'] = swatchType;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['validation'] = validation;
    data['position'] = position;
    data['is_comparable'] = isComparable;
    data['is_configurable'] = isConfigurable;
    data['is_required'] = isRequired;
    data['is_unique'] = isUnique;
    data['is_filterable'] = isFilterable;
    data['is_user_defined'] = isUserDefined;
    data['is_visible_on_front'] = isVisibleOnFront;
    data['use_in_flat'] = useInFlat;
    data['value_per_locale'] = valuePerLocale;
    data['value_per_channel'] = valuePerChannel;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Options {
  num? id;
  String? adminName;
  String? label;
  dynamic swatchValue;

  Options({this.id, this.adminName, this.label, this.swatchValue});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminName = json['admin_name'];
    label = json['label'];
    swatchValue = json['swatch_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['admin_name'] = adminName;
    data['label'] = label;
    data['swatch_value'] = swatchValue;
    return data;
  }
}
