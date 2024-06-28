class CustomerPaymentInputModel {
  final String email;
  final String name;

  CustomerPaymentInputModel({required this.email, required this.name});

  toJson(){
    return{
      "name":name,
      "email":email
    };
  }

}