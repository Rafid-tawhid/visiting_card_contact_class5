class ContactModel {
  int? id;
  String name;
  String companyName;
  String designation;
  String address;
  String mobile;
  String email;
  String website;
  bool isFav;

  ContactModel(
      {this.id,
      this.name='',
      this.companyName='',
      this.designation='',
      this.address='',
      this.mobile='',
      this.email='',
      this.website='',
      this.isFav=false});

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, companyName: $companyName, designation: $designation, address: $address, mobile: $mobile, email: $email, website: $website, isFav: $isFav}';
  }
}
