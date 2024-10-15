class UserModel {
  final Organization? organization;

  UserModel({this.organization});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(organization: Organization.fromJson(json['organization']));
  }
}

class Organization {
  final String? name;
  final int? froundedYear;
  final List<Departments>? departments;

  Organization(
      {required this.name, required this.froundedYear, this.departments});

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      name: json['name'],
      froundedYear: json['foundedYear'],
      departments: (json['departments'] as List)
          .map((i) => Departments.fromJson(i))
          .toList(),
    );
  }
}

class Departments {
  final String? departmentId;
  final String? name;
  final Manager? manager;
  final List<Employee>? employee;

  Departments({this.departmentId, this.name, this.manager, this.employee});

  factory Departments.fromJson(Map<String, dynamic> json) {
    return Departments(
      departmentId: json['departmentId'],
      name: json['name'],
      manager: Manager.fromJson(json['manager']),
      employee:
          (json['employees'] as List).map((e) => Employee.fromJson(e)).toList(),
    );
  }
}

class Manager {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? position;

  Manager({this.id, this.name, this.email, this.phone, this.position});

  factory Manager.fromJson(Map<String, dynamic> json) {
    return Manager(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        position: json['position']);
  }
}

class Employee {
  final String? employeeId;
  final String? name;
  final String? email;
  final String? position;
  final Salary? salary;
  final Contact? contactInfo;
  final List<Project>? project;
  final String? joinDate;
  final Health? health;

  Employee(
      {this.employeeId,
      this.name,
      this.email,
      this.position,
      this.salary,
      this.contactInfo,
      this.project,
      this.joinDate,
      this.health});

  factory Employee.fromJson(Map<String, dynamic> json) {
    var tasksJson =
        json['projects'] as List<dynamic>?; 
    List<Project>? tasksList = tasksJson != null && tasksJson.isNotEmpty
        ? tasksJson.map((taskJson) => Project.fromJson(taskJson)).toList()
        : null;
    return Employee(
      employeeId: json['employeeId'],
      name: json['name'],
      email: json['email'],
      position: json['position'],
      salary: Salary.fromJson(json['salary']),
      contactInfo: json['contactInfo'] != null
          ? Contact.fromJson(json['contactInfo'])
          : null,
      project: tasksList,
      joinDate: json['joiningDate'],
      health: Health.fromJson(json['healthDetails']),
    );
  }
}

class Salary {
  final int? amount;
  final String? currency;
  final String? paySchedule;

  Salary({this.amount, this.currency, this.paySchedule});

  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
        amount: json['amount'],
        currency: json['currency'],
        paySchedule: json['paySchedule']);
  }
}

class Contact {
  final Address? address;
  final String? phone;
  final Emergency? emergency;

  Contact({this.address, this.phone, this.emergency});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      emergency: Emergency.fromJson(json['emergencyContact']),
    );
  }
}

class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? pastalCode;

  Address({this.street, this.city, this.state, this.pastalCode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        city: json['city'],
        state: json['state'],
        pastalCode: json['postalCode']);
  }
}

class Emergency {
  final String? name;
  final String? relation;
  final String? phone;

  Emergency({this.name, this.relation, this.phone});

  factory Emergency.fromJson(Map<String, dynamic> json) {
    return Emergency(
        name: json['name'],
        relation: json['relationship'],
        phone: json['phone']);
  }
}

class Project {
  final String? projectId;
  final String? name;
  final String? description;
  final List<Task>? task;

  Project({this.projectId, this.name, this.description, this.task});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['projectId'],
      name: json['name'],
      description: json['description'],
      task: (json['tasks'] as List).map((e) => Task.fromJson(e)).toList(),
    );
  }
}

class Task {
  final String? taskId;
  final String? description;
  final String? assignedTo;
  final String? status;
  final String? deadline;

  Task({
    this.taskId,
    this.description,
    this.assignedTo,
    this.status,
    this.deadline,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json['taskId'],
      deadline: json['deadline'],
      assignedTo: json['assignedTo'],
      status: json['status'],
      description: json['description'],
    );
  }
}

class Health {
  final String? blood;
  final List<String>? known;

  Health({this.blood, this.known});

  factory Health.fromJson(Map<String, dynamic> json) {
    return Health(
      blood: json['bloodGroup'],
      known: List<String>.from(json['knownConditions']),
    );
  }
}
