import 'package:bring_me_bd/app/data/dto_models/products_list_response.dart';
import 'package:bring_me_bd/app/data/model/product.dart';

class CartDetailsResponse {
  String? message;
  CartDetails? details;

  CartDetailsResponse({this.message, this.details});

  CartDetailsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    details = json['data'] != null ? CartDetails.fromJson(json['data']) : null;
  }
}

class CartDetails {
  int? id;
  dynamic customerEmail;
  dynamic customerFirstName;
  dynamic customerLastName;
  dynamic shippingMethod;
  dynamic couponCode;
  int? isGift;
  int? itemsCount;
  String? itemsQty;
  dynamic exchangeRate;
  String? globalCurrencyCode;
  String? baseCurrencyCode;
  String? channelCurrencyCode;
  String? cartCurrencyCode;
  String? grandTotal;
  String? formatedGrandTotal;
  String? baseGrandTotal;
  String? formatedBaseGrandTotal;
  String? subTotal;
  String? formatedSubTotal;
  String? baseSubTotal;
  String? formatedBaseSubTotal;
  String? taxTotal;
  String? formatedTaxTotal;
  String? baseTaxTotal;
  String? formatedBaseTaxTotal;
  String? discount;
  String? formatedDiscount;
  String? baseDiscount;
  String? formatedBaseDiscount;
  dynamic checkoutMethod;
  int? isGuest;
  int? isActive;
  dynamic conversionTime;
  dynamic channel;
  List<CartItem>? items;
  dynamic selectedShippingRate;
  dynamic payment;
  dynamic billingAddress;
  dynamic shippingAddress;
  String? createdAt;
  String? updatedAt;
  String? taxes;
  String? formatedTaxes;
  String? baseTaxes;
  String? formatedBaseTaxes;
  String? formatedDiscountedSubTotal;
  String? formatedBaseDiscountedSubTotal;

  CartDetails(
      {this.id,
      this.customerEmail,
      this.customerFirstName,
      this.customerLastName,
      this.shippingMethod,
      this.couponCode,
      this.isGift,
      this.itemsCount,
      this.itemsQty,
      this.exchangeRate,
      this.globalCurrencyCode,
      this.baseCurrencyCode,
      this.channelCurrencyCode,
      this.cartCurrencyCode,
      this.grandTotal,
      this.formatedGrandTotal,
      this.baseGrandTotal,
      this.formatedBaseGrandTotal,
      this.subTotal,
      this.formatedSubTotal,
      this.baseSubTotal,
      this.formatedBaseSubTotal,
      this.taxTotal,
      this.formatedTaxTotal,
      this.baseTaxTotal,
      this.formatedBaseTaxTotal,
      this.discount,
      this.formatedDiscount,
      this.baseDiscount,
      this.formatedBaseDiscount,
      this.checkoutMethod,
      this.isGuest,
      this.isActive,
      this.conversionTime,
      this.channel,
      this.items,
      this.selectedShippingRate,
      this.payment,
      this.billingAddress,
      this.shippingAddress,
      this.createdAt,
      this.updatedAt,
      this.taxes,
      this.formatedTaxes,
      this.baseTaxes,
      this.formatedBaseTaxes,
      this.formatedDiscountedSubTotal,
      this.formatedBaseDiscountedSubTotal});

  CartDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerEmail = json['customer_email'];
    customerFirstName = json['customer_first_name'];
    customerLastName = json['customer_last_name'];
    shippingMethod = json['shipping_method'];
    couponCode = json['coupon_code'];
    isGift = json['is_gift'];
    itemsCount = json['items_count'];
    itemsQty = json['items_qty'];
    exchangeRate = json['exchange_rate'];
    globalCurrencyCode = json['global_currency_code'];
    baseCurrencyCode = json['base_currency_code'];
    channelCurrencyCode = json['channel_currency_code'];
    cartCurrencyCode = json['cart_currency_code'];
    grandTotal = json['grand_total'];
    formatedGrandTotal = json['formated_grand_total'];
    baseGrandTotal = json['base_grand_total'];
    formatedBaseGrandTotal = json['formated_base_grand_total'];
    subTotal = json['sub_total'];
    formatedSubTotal = json['formated_sub_total'];
    baseSubTotal = json['base_sub_total'];
    formatedBaseSubTotal = json['formated_base_sub_total'];
    taxTotal = json['tax_total'];
    formatedTaxTotal = json['formated_tax_total'];
    baseTaxTotal = json['base_tax_total'];
    formatedBaseTaxTotal = json['formated_base_tax_total'];
    discount = json['discount'];
    formatedDiscount = json['formated_discount'];
    baseDiscount = json['base_discount'];
    formatedBaseDiscount = json['formated_base_discount'];
    checkoutMethod = json['checkout_method'];
    isGuest = json['is_guest'];
    isActive = json['is_active'];
    conversionTime = json['conversion_time'];
    channel = json['channel'];
    if (json['items'] != null) {
      items = <CartItem>[];
      json['items'].forEach((v) {
        items!.add(CartItem.fromJson(v));
      });
    }
    selectedShippingRate = json['selected_shipping_rate'];
    payment = json['payment'];
    billingAddress = json['billing_address'];
    shippingAddress = json['shipping_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxes = json['taxes'];
    formatedTaxes = json['formated_taxes'];
    baseTaxes = json['base_taxes'];
    formatedBaseTaxes = json['formated_base_taxes'];
    formatedDiscountedSubTotal = json['formated_discounted_sub_total'];
    formatedBaseDiscountedSubTotal = json['formated_base_discounted_sub_total'];
  }
}

class CartItem {
  int? id;
  int? quantity;
  String? sku;
  String? type;
  String? name;
  dynamic couponCode;
  String? weight;
  String? totalWeight;
  String? baseTotalWeight;
  String? price;
  String? formatedPrice;
  String? basePrice;
  String? formatedBasePrice;
  dynamic customPrice;
  String? formatedCustomPrice;
  String? total;
  String? formatedTotal;
  String? baseTotal;
  String? formatedBaseTotal;
  String? taxPercent;
  String? taxAmount;
  String? formatedTaxAmount;
  String? baseTaxAmount;
  String? formatedBaseTaxAmount;
  String? discountPercent;
  String? discountAmount;
  String? formatedDiscountAmount;
  String? baseDiscountAmount;
  String? formatedBaseDiscountAmount;
  Additional? additional;
  dynamic child;
  Product? product;
  String? createdAt;
  String? updatedAt;

  CartItem(
      {this.id,
      this.quantity,
      this.sku,
      this.type,
      this.name,
      this.couponCode,
      this.weight,
      this.totalWeight,
      this.baseTotalWeight,
      this.price,
      this.formatedPrice,
      this.basePrice,
      this.formatedBasePrice,
      this.customPrice,
      this.formatedCustomPrice,
      this.total,
      this.formatedTotal,
      this.baseTotal,
      this.formatedBaseTotal,
      this.taxPercent,
      this.taxAmount,
      this.formatedTaxAmount,
      this.baseTaxAmount,
      this.formatedBaseTaxAmount,
      this.discountPercent,
      this.discountAmount,
      this.formatedDiscountAmount,
      this.baseDiscountAmount,
      this.formatedBaseDiscountAmount,
      this.additional,
      this.child,
      this.product,
      this.createdAt,
      this.updatedAt});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    couponCode = json['coupon_code'];
    weight = json['weight'];
    totalWeight = json['total_weight'];
    baseTotalWeight = json['base_total_weight'];
    price = json['price'];
    formatedPrice = json['formated_price'];
    basePrice = json['base_price'];
    formatedBasePrice = json['formated_base_price'];
    customPrice = json['custom_price'];
    formatedCustomPrice = json['formated_custom_price'];
    total = json['total'];
    formatedTotal = json['formated_total'];
    baseTotal = json['base_total'];
    formatedBaseTotal = json['formated_base_total'];
    taxPercent = json['tax_percent'];
    taxAmount = json['tax_amount'];
    formatedTaxAmount = json['formated_tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    formatedBaseTaxAmount = json['formated_base_tax_amount'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    formatedDiscountAmount = json['formated_discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    formatedBaseDiscountAmount = json['formated_base_discount_amount'];
    additional = json['additional'] != null
        ? Additional.fromJson(json['additional'])
        : null;
    child = json['child'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Additional {
  String? productId;
  String? quantity;
  dynamic parentId;

  Additional({this.productId, this.quantity, this.parentId});

  Additional.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'].toString();
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['parent_id'] = this.parentId;
    return data;
  }
}
