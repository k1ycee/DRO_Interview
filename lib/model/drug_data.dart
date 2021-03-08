class Drugs {
  Drugs({
    required this.id,
    required this.drugName,
    required this.drugContent,
    required this.drugForm,
    required this.price,
    required this.image,
    required this.mass,
    required this.availableAmount,
  });

  int id;
  String drugName;
  String drugContent;
  String drugForm;
  int price;
  String image;
  String mass;
  int availableAmount;

  factory Drugs.fromJson(Map<String, dynamic> json) => Drugs(
        id: json["id"] == null ? null : json["id"],
        drugName: json["drug_name"] == null ? null : json["drug_name"],
        drugContent: json["drug_content"] == null ? null : json["drug_content"],
        drugForm: json["drug_form"] == null ? null : json["drug_form"],
        price: json["price"] == null ? null : json["price"],
        image: json["image"] == null ? null : json["image"],
        mass: json["mass"] == null ? null : json["mass"],
        availableAmount:
            json["available_amount"] == null ? null : json["available_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "drug_name": drugName,
        "drug_content": drugContent,
        "drug_form": drugForm,
        "price": price,
        "image": image,
        "mass": mass,
        "available_amount": availableAmount,
      };
}
