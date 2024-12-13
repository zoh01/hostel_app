class Details {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final void Function()? onTap;

  Details(
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNo,
    this.onTap,
  );
}
