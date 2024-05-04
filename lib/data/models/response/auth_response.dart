// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  String? accessToken;
  String? tokenType;
  DateTime? expiresAt;
  String? datetimeFormat;
  User? user;
  Company? company;
  dynamic branchId;

  AuthResponse({
    this.accessToken,
    this.tokenType,
    this.expiresAt,
    this.datetimeFormat,
    this.user,
    this.company,
    this.branchId,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresAt: DateTime.parse(json["expires_at"]),
    datetimeFormat: json["datetime_format"],
    user: User.fromJson(json["user"]),
    company: Company.fromJson(json["company"]),
    branchId: json["branch_id"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_at": expiresAt?.toIso8601String(),
    "datetime_format": datetimeFormat,
    "user": user?.toJson(),
    "company": company?.toJson(),
    "branch_id": branchId,
  };
}

class Company {
  int? id;
  String? name;
  String? name2;
  String? registrationNo;
  String? description;
  dynamic status;
  String? urlPrefix;
  String? styles;
  String? logo;
  String? backgroundImage;
  int? userId;
  dynamic regionId;
  dynamic companyEmail;
  String? addressLine1;
  dynamic addressLine2;
  String? city;
  dynamic state;
  String? zip;
  String? country;
  String? businessAddress;
  String? contactNo;
  int? isBusinessAddressSame;
  String? typeOfBusiness;
  String? category;
  String? website;
  String? settings;
  String? vatSettings;
  String? cardSettings;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic tempPaymentSettings;
  String? companyUrl;
  int? showCardTerminalSelection;
  dynamic dojoAccountName;
  dynamic dojoApiKey;
  dynamic dojoSoftwareHouseId;

  Company({
    this.id,
    this.name,
    this.name2,
    this.registrationNo,
    this.description,
    this.status,
    this.urlPrefix,
    this.styles,
    this.logo,
    this.backgroundImage,
    this.userId,
    this.regionId,
    this.companyEmail,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.businessAddress,
    this.contactNo,
    this.isBusinessAddressSame,
    this.typeOfBusiness,
    this.category,
    this.website,
    this.settings,
    this.vatSettings,
    this.cardSettings,
    this.createdAt,
    this.updatedAt,
    this.tempPaymentSettings,
    this.companyUrl,
    this.showCardTerminalSelection,
    this.dojoAccountName,
    this.dojoApiKey,
    this.dojoSoftwareHouseId,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    name2: json["name2"],
    registrationNo: json["registration_no"],
    description: json["description"],
    status: json["status"],
    urlPrefix: json["url_prefix"],
    styles: json["styles"],
    logo: json["logo"],
    backgroundImage: json["background_image"],
    userId: json["user_id"],
    regionId: json["region_id"],
    companyEmail: json["company_email"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
    country: json["country"],
    businessAddress: json["business_address"],
    contactNo: json["contact_no"],
    isBusinessAddressSame: json["is_business_address_same"],
    typeOfBusiness: json["type_of_business"],
    category: json["category"],
    website: json["website"],
    settings: json["settings"],
    vatSettings: json["vat_settings"],
    cardSettings: json["card_settings"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    tempPaymentSettings: json["temp_payment_settings"],
    companyUrl: json["company_url"],
    showCardTerminalSelection: json["show_card_terminal_selection"],
    dojoAccountName: json["dojo_account_name"],
    dojoApiKey: json["dojo_api_key"],
    dojoSoftwareHouseId: json["dojo_software_house_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name2": name2,
    "registration_no": registrationNo,
    "description": description,
    "status": status,
    "url_prefix": urlPrefix,
    "styles": styles,
    "logo": logo,
    "background_image": backgroundImage,
    "user_id": userId,
    "region_id": regionId,
    "company_email": companyEmail,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "city": city,
    "state": state,
    "zip": zip,
    "country": country,
    "business_address": businessAddress,
    "contact_no": contactNo,
    "is_business_address_same": isBusinessAddressSame,
    "type_of_business": typeOfBusiness,
    "category": category,
    "website": website,
    "settings": settings,
    "vat_settings": vatSettings,
    "card_settings": cardSettings,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "temp_payment_settings": tempPaymentSettings,
    "company_url": companyUrl,
    "show_card_terminal_selection": showCardTerminalSelection,
    "dojo_account_name": dojoAccountName,
    "dojo_api_key": dojoApiKey,
    "dojo_software_house_id": dojoSoftwareHouseId,
  };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  List<String>? roles;
  Billing? billing;
  Delivery? delivery;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.roles,
    this.billing,
    this.delivery,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    billing: Billing.fromJson(json["billing"]),
    delivery: Delivery.fromJson(json["delivery"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "roles": List<dynamic>.from(roles!.map((x) => x)),
    "billing": billing!.toJson(),
    "delivery": delivery!.toJson(),
  };
}

class Billing {
  dynamic billingAddress;
  dynamic billingCity;
  dynamic billingPostalCode;
  dynamic billingCountry;

  Billing({
    this.billingAddress,
    this.billingCity,
    this.billingPostalCode,
    this.billingCountry,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
    billingAddress: json["billing_address"],
    billingCity: json["billing_city"],
    billingPostalCode: json["billing_postal_code"],
    billingCountry: json["billing_country"],
  );

  Map<String, dynamic> toJson() => {
    "billing_address": billingAddress,
    "billing_city": billingCity,
    "billing_postal_code": billingPostalCode,
    "billing_country": billingCountry,
  };
}

class Delivery {
  dynamic deliveryAddress;
  dynamic deliveryCity;
  dynamic deliveryCountry;
  dynamic deliveryPostalCode;

  Delivery({
    this.deliveryAddress,
    this.deliveryCity,
    this.deliveryCountry,
    this.deliveryPostalCode,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
    deliveryAddress: json["delivery_address"],
    deliveryCity: json["delivery_city"],
    deliveryCountry: json["delivery_country"],
    deliveryPostalCode: json["delivery_postal_code"],
  );

  Map<String, dynamic> toJson() => {
    "delivery_address": deliveryAddress,
    "delivery_city": deliveryCity,
    "delivery_country": deliveryCountry,
    "delivery_postal_code": deliveryPostalCode,
  };
}
