class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  int? active;
  int? phone;
  String? apiToken;
  String? joiningDate;
  String? firstName;
  String? lastName;
  String? gender;
  String? imagePath;
  String? idGivenBySchool;
  String? contactNumber;
  String? createdAt;
  String? updatedAt;
  int? isPasswordReseted;
  int? isDeleted;
  int? isMailSent;
  String? boardId;
  List<Roles>? roles;
  List<Companies>? companies;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.active,
      this.phone,
      this.apiToken,
      this.joiningDate,
      this.firstName,
      this.lastName,
      this.gender,
      this.imagePath,
      this.idGivenBySchool,
      this.contactNumber,
      this.createdAt,
      this.updatedAt,
      this.isPasswordReseted,
      this.isDeleted,
      this.isMailSent,
      this.boardId,
      this.roles,
      this.companies});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    active = json['active'];
    phone = json['phone'];
    apiToken = json['api_token'];
    joiningDate = json['joining_date'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    imagePath = json['image_path'];
    idGivenBySchool = json['id_given_by_school'];
    contactNumber = json['contact_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isPasswordReseted = json['is_password_reseted'];
    isDeleted = json['is_deleted'];
    isMailSent = json['is_mail_sent'];
    boardId = json['board_id'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['active'] = this.active;
    data['phone'] = this.phone;
    data['api_token'] = this.apiToken;
    data['joining_date'] = this.joiningDate;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['image_path'] = this.imagePath;
    data['id_given_by_school'] = this.idGivenBySchool;
    data['contact_number'] = this.contactNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_password_reseted'] = this.isPasswordReseted;
    data['is_deleted'] = this.isDeleted;
    data['is_mail_sent'] = this.isMailSent;
    data['board_id'] = this.boardId;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Roles({this.id, this.name, this.createdAt, this.updatedAt});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Companies {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? address;
  String? logoPath;
  String? contactPerson;
  String? createdAt;
  String? updatedAt;
  String? city;
  String? state;
  String? pincode;
  String? code;
  int? isMailSent;

  Companies(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.logoPath,
      this.contactPerson,
      this.createdAt,
      this.updatedAt,
      this.city,
      this.state,
      this.pincode,
      this.code,
      this.isMailSent});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    logoPath = json['logo_path'];
    contactPerson = json['contact_person'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    code = json['code'];
    isMailSent = json['is_mail_sent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['logo_path'] = this.logoPath;
    data['contact_person'] = this.contactPerson;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['code'] = this.code;
    data['is_mail_sent'] = this.isMailSent;
    return data;
  }
}
