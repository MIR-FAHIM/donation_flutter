// To parse this JSON data, do
//
//     final coachListModel = coachListModelFromJson(jsonString);

import 'dart:convert';

CoachListModel coachListModelFromJson(String str) => CoachListModel.fromJson(json.decode(str));

String coachListModelToJson(CoachListModel data) => json.encode(data.toJson());

class CoachListModel {
  String message;
  dynamic errors;
  Map<String, Datums> data;
  String version;
  int timestamp;

  CoachListModel({
    required this.message,
    this.errors,
    required this.data,
    required this.version,
    required this.timestamp,
  });

  factory CoachListModel.fromJson(Map<String, dynamic> json) => CoachListModel(
    message: json["message"],
    errors: json["errors"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, Datums>(k, Datums.fromJson(v))),
    version: json["version"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors,
    "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "version": version,
    "timestamp": timestamp,
  };
}

class Datums {
  int tripId;
  int tripRouteId;
  Details details;
  Details tripRoute;
  List<IngPoint> boardingPoints;
  Bus bus;
  Operator datumsOperator;
  int shohozQuota;
  int shohozSpecialQuota;
  List<dynamic> tripParentRoute;
  int isEidDay;
  List<IngPoint> dropingPoints;
  bool incrementing;
  bool timestamps;
  bool exists;
  String provider;

  Datums({
    required this.tripId,
    required this.tripRouteId,
    required this.details,
    required this.tripRoute,
    required this.boardingPoints,
    required this.bus,
    required this.datumsOperator,
    required this.shohozQuota,
    required this.shohozSpecialQuota,
    required this.tripParentRoute,
    required this.isEidDay,
    required this.dropingPoints,
    required this.incrementing,
    required this.timestamps,
    required this.exists,
    required this.provider,
  });

  factory Datums.fromJson(Map<String, dynamic> json) => Datums(
    tripId: json["tripId"],
    tripRouteId: json["tripRouteId"],
    details: Details.fromJson(json["details"]),
    tripRoute: Details.fromJson(json["tripRoute"]),
    boardingPoints: List<IngPoint>.from(json["boardingPoints"].map((x) => IngPoint.fromJson(x))),
    bus: Bus.fromJson(json["bus"]),
    datumsOperator: Operator.fromJson(json["operator"]),
    shohozQuota: json["shohozQuota"],
    shohozSpecialQuota: json["shohozSpecialQuota"],
    tripParentRoute: List<dynamic>.from(json["TripParentRoute"].map((x) => x)),
    isEidDay: json["isEidDay"],
    dropingPoints: List<IngPoint>.from(json["dropingPoints"].map((x) => IngPoint.fromJson(x))),
    incrementing: json["incrementing"],
    timestamps: json["timestamps"],
    exists: json["exists"],
    provider: json["provider"],
  );

  Map<String, dynamic> toJson() => {
    "tripId": tripId,
    "tripRouteId": tripRouteId,
    "details": details.toJson(),
    "tripRoute": tripRoute.toJson(),
    "boardingPoints": List<dynamic>.from(boardingPoints.map((x) => x.toJson())),
    "bus": bus.toJson(),
    "operator": datumsOperator.toJson(),
    "shohozQuota": shohozQuota,
    "shohozSpecialQuota": shohozSpecialQuota,
    "TripParentRoute": List<dynamic>.from(tripParentRoute.map((x) => x)),
    "isEidDay": isEidDay,
    "dropingPoints": List<dynamic>.from(dropingPoints.map((x) => x.toJson())),
    "incrementing": incrementing,
    "timestamps": timestamps,
    "exists": exists,
    "provider": provider,
  };
}

class IngPoint {
  int locationId;
  String locationName;
  int locationStatus;
  int cityId;
  int tripId;
  int tripPointId;
  int locationType;
  DateTime locationDate;
  String locationTime;
  int? counterId;
  String? counterName;
  String? counterAddress;
  int isPublishForShohoz;

  IngPoint({
    required this.locationId,
    required this.locationName,
    required this.locationStatus,
    required this.cityId,
    required this.tripId,
    required this.tripPointId,
    required this.locationType,
    required this.locationDate,
    required this.locationTime,
    this.counterId,
    this.counterName,
    this.counterAddress,
    required this.isPublishForShohoz,
  });

  factory IngPoint.fromJson(Map<String, dynamic> json) => IngPoint(
    locationId: json["location_id"],
    locationName: json["location_name"],
    locationStatus: json["location_status"],
    cityId: json["city_id"],
    tripId: json["trip_id"],
    tripPointId: json["trip_point_id"],
    locationType: json["location_type"],
    locationDate: DateTime.parse(json["location_date"]),
    locationTime: json["location_time"],
    counterId: json["counter_id"],
    counterName: json["counter_name"],
    counterAddress: json["counter_address"],
    isPublishForShohoz: json["is_publish_for_shohoz"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "location_name": locationName,
    "location_status": locationStatus,
    "city_id": cityId,
    "trip_id": tripId,
    "trip_point_id": tripPointId,
    "location_type": locationType,
    "location_date": "${locationDate.year.toString().padLeft(4, '0')}-${locationDate.month.toString().padLeft(2, '0')}-${locationDate.day.toString().padLeft(2, '0')}",
    "location_time": locationTime,
    "counter_id": counterId,
    "counter_name": counterName,
    "counter_address": counterAddress,
    "is_publish_for_shohoz": isPublishForShohoz,
  };
}

class Bus {
  String busType;

  Bus({
    required this.busType,
  });

  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
    busType: json["bus_type"],
  );

  Map<String, dynamic> toJson() => {
    "bus_type": busType,
  };
}

class Operator {
  int companyId;
  String companyLogoUrl;
  String companyName;
  String companyAddress;
  String companyShortName;
  String addressLine1;
  dynamic addressLine2;
  String postalCode;
  int cityId;
  int areaId;

  Operator({
    required this.companyId,
    required this.companyLogoUrl,
    required this.companyName,
    required this.companyAddress,
    required this.companyShortName,
    required this.addressLine1,
    this.addressLine2,
    required this.postalCode,
    required this.cityId,
    required this.areaId,
  });

  factory Operator.fromJson(Map<String, dynamic> json) => Operator(
    companyId: json["company_id"],
    companyLogoUrl: json["company_logo_url"],
    companyName: json["company_name"],
    companyAddress: json["company_address"],
    companyShortName: json["company_short_name"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    postalCode: json["postal_code"],
    cityId: json["city_id"],
    areaId: json["area_id"],
  );

  Map<String, dynamic> toJson() => {
    "company_id": companyId,
    "company_logo_url": companyLogoUrl,
    "company_name": companyName,
    "company_address": companyAddress,
    "company_short_name": companyShortName,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "postal_code": postalCode,
    "city_id": cityId,
    "area_id": areaId,
  };
}

class Details {
  int tripRouteId;
  int tripId;
  int companyId;
  String companyName;
  int routeId;
  int originCityId;
  String? originCityName;
  int destinationCityId;
  String? destinationCityName;
  int originParentId;
  int destinationParentId;
  int parentTripRouteId;
  String businessClassFare;
  String economyClassFare;
  String specialClassFare;
  String departureDate;
  String departureTime;
  String arrivalDate;
  String arrivalTime;
  DateTime? availableTillDatetime;
  String? busType;
  String tripNumber;
  String? tripHeading;
  String busDesc;
  int isEidDay;
  int isEnabledForFc;
  int isFeatured;
  dynamic promotionText;
  dynamic featureText;
  dynamic isPublishedForFc;
  DateTime? tripOriginDate;
  String? tripOriginTime;
  int webBookingEnabled;
  int mobileBookingEnabled;
  int originCitySeq;
  int destinationCitySeq;
  int isShadowRoute;
  int isIntracityTrip;
  int? availableSeats;
  int? discountType;
  int? discount;

  Details({
    required this.tripRouteId,
    required this.tripId,
    required this.companyId,
    required this.companyName,
    required this.routeId,
    required this.originCityId,
    this.originCityName,
    required this.destinationCityId,
    this.destinationCityName,
    required this.originParentId,
    required this.destinationParentId,
    required this.parentTripRouteId,
    required this.businessClassFare,
    required this.economyClassFare,
    required this.specialClassFare,
    required this.departureDate,
    required this.departureTime,
    required this.arrivalDate,
    required this.arrivalTime,
    this.availableTillDatetime,
    this.busType,
    required this.tripNumber,
    this.tripHeading,
    required this.busDesc,
    required this.isEidDay,
    required this.isEnabledForFc,
    required this.isFeatured,
    this.promotionText,
    this.featureText,
    this.isPublishedForFc,
    this.tripOriginDate,
    this.tripOriginTime,
    required this.webBookingEnabled,
    required this.mobileBookingEnabled,
    required this.originCitySeq,
    required this.destinationCitySeq,
    required this.isShadowRoute,
    required this.isIntracityTrip,
    this.availableSeats,
    this.discountType,
    this.discount,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    tripRouteId: json["trip_route_id"],
    tripId: json["trip_id"],
    companyId: json["company_id"],
    companyName: json["company_name"],
    routeId: json["route_id"],
    originCityId: json["origin_city_id"],
    originCityName: json["origin_city_name"],
    destinationCityId: json["destination_city_id"],
    destinationCityName: json["destination_city_name"],
    originParentId: json["origin_parent_id"],
    destinationParentId: json["destination_parent_id"],
    parentTripRouteId: json["parent_trip_route_id"],
    businessClassFare: json["business_class_fare"],
    economyClassFare: json["economy_class_fare"],
    specialClassFare: json["special_class_fare"],
    departureDate: json["departure_date"],
    departureTime: json["departure_time"],
    arrivalDate: json["arrival_date"],
    arrivalTime: json["arrival_time"],
    availableTillDatetime: json["available_till_datetime"] == null ? null : DateTime.parse(json["available_till_datetime"]),
    busType: json["bus_type"],
    tripNumber: json["trip_number"],
    tripHeading: json["trip_heading"],
    busDesc: json["bus_desc"],
    isEidDay: json["is_eid_day"],
    isEnabledForFc: json["is_enabled_for_fc"],
    isFeatured: json["is_featured"],
    promotionText: json["promotion_text"],
    featureText: json["feature_text"],
    isPublishedForFc: json["is_published_for_fc"],
    tripOriginDate: json["trip_origin_date"] == null ? null : DateTime.parse(json["trip_origin_date"]),
    tripOriginTime: json["trip_origin_time"],
    webBookingEnabled: json["web_booking_enabled"],
    mobileBookingEnabled: json["mobile_booking_enabled"],
    originCitySeq: json["origin_city_seq"],
    destinationCitySeq: json["destination_city_seq"],
    isShadowRoute: json["is_shadow_route"],
    isIntracityTrip: json["is_intracity_trip"],
    availableSeats: json["available_seats"],
    discountType: json["discount_type"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "trip_route_id": tripRouteId,
    "trip_id": tripId,
    "company_id": companyId,
    "company_name": companyName,
    "route_id": routeId,
    "origin_city_id": originCityId,
    "origin_city_name": originCityName,
    "destination_city_id": destinationCityId,
    "destination_city_name": destinationCityName,
    "origin_parent_id": originParentId,
    "destination_parent_id": destinationParentId,
    "parent_trip_route_id": parentTripRouteId,
    "business_class_fare": businessClassFare,
    "economy_class_fare": economyClassFare,
    "special_class_fare": specialClassFare,
    "departure_date": departureDate,
    "arrival_date": arrivalDate,
    "arrival_time": arrivalTime,
    "available_till_datetime": availableTillDatetime?.toIso8601String(),
    "bus_type": busType,
    "trip_number": tripNumber,
    "trip_heading": tripHeading,
    "bus_desc": busDesc,
    "is_eid_day": isEidDay,
    "is_enabled_for_fc": isEnabledForFc,
    "is_featured": isFeatured,
    "promotion_text": promotionText,
    "feature_text": featureText,
    "is_published_for_fc": isPublishedForFc,
    "trip_origin_date": "${tripOriginDate!.year.toString().padLeft(4, '0')}-${tripOriginDate!.month.toString().padLeft(2, '0')}-${tripOriginDate!.day.toString().padLeft(2, '0')}",
    "trip_origin_time": tripOriginTime,
    "web_booking_enabled": webBookingEnabled,
    "mobile_booking_enabled": mobileBookingEnabled,
    "origin_city_seq": originCitySeq,
    "destination_city_seq": destinationCitySeq,
    "is_shadow_route": isShadowRoute,
    "is_intracity_trip": isIntracityTrip,
    "available_seats": availableSeats,
    "discount_type": discountType,
    "discount": discount,
  };
}
