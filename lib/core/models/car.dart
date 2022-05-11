// To parse required this JSON data, do
//
//     final car = carFromJson(jsonString);

import 'dart:convert';

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  Car({
    required this.updatedAt,
    required this.descripiton,
    required this.createdAt,
    required this.ratings,
    required this.carDetail,
    required this.reviews,
    required this.price,
    required this.id,
    required this.carImages,
  });

  final DateTime updatedAt;
  final String descripiton;
  final DateTime createdAt;
  final Ratings ratings;
  final CarDetail carDetail;
  final Ratings reviews;
  final int price;
  final String id;
  final CarImages carImages;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    updatedAt: DateTime.parse(json['updated_at']),
    descripiton: json['descripiton'],
    createdAt: DateTime.parse(json['created_at']),
    ratings: Ratings.fromJson(json['ratings']),
    carDetail: CarDetail.fromJson(json['car_detail']),
    reviews: Ratings.fromJson(json['reviews']),
    price: json['price'],
    id: json['id'],
    carImages: CarImages.fromJson(json['car_images']),
  );

  Map<String, dynamic> toJson() => {
    'updated_at': updatedAt.toIso8601String(),
    'descripiton': descripiton,
    'created_at': createdAt.toIso8601String(),
    'ratings': ratings.toJson(),
    'car_detail': carDetail.toJson(),
    'reviews': reviews.toJson(),
    'price': price,
    'id': id,
    'car_images': carImages.toJson(),
  };
}

class CarDetail {
  CarDetail({
    required this.returnPoint,
    required this.vehicleRegistrationDueDate,
    required this.transmission,
    required this.carYear,
    required this.milage,
    required this.model,
    required this.vin,
    required this.state,
    required this.pickUpPoint,
    required this.make,
  });

  final String returnPoint;
  final DateTime vehicleRegistrationDueDate;
  final String transmission;
  final String carYear;
  final String milage;
  final String model;
  final String vin;
  final String state;
  final String pickUpPoint;
  final String make;

  factory CarDetail.fromJson(Map<String, dynamic> json) => CarDetail(
    returnPoint: json['return_point']??'',
    vehicleRegistrationDueDate: DateTime.parse(json['vehicle_registration_due_date']),
    transmission: json['transmission'],
    carYear: json['car_year'],
    milage: json['milage'],
    model: json['model'],
    vin: json['vin'],
    state: json['state'],
    pickUpPoint: json['pick_up_point']??'',
    make: json['make'],
  );

  Map<String, dynamic> toJson() => {
    'return_point': returnPoint,
    'vehicle_registration_due_date': '${vehicleRegistrationDueDate.year.toString().padLeft(4, '0')}-${vehicleRegistrationDueDate.month.toString().padLeft(2, '0')}-${vehicleRegistrationDueDate.day.toString().padLeft(2, '0')}',
    'transmission': transmission,
    'car_year': carYear,
    'milage': milage,
    'model': model,
    'vin': vin,
    'state': state,
    'pick_up_point': pickUpPoint,
    'make': make,
  };
}

class CarImages {
  CarImages({
    required this.image1,
  });

  final String image1;

  factory CarImages.fromJson(Map<String, dynamic> json) => CarImages(
    image1: json['image_1'],
  );

  Map<String, dynamic> toJson() => {
    'image_1': image1,
  };
}

class Ratings {
  Ratings();

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
  );

  Map<String, dynamic> toJson() => {
  };
}
