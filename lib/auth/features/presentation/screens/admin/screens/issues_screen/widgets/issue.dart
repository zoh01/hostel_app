class Issue {
  final String name;
  final String userName;
  final String roomNo;
  final String email;
  final String phoneNo;
  final String issue;
  final String comment;
  final void Function()? onTap;

  Issue(
    this.name,
    this.userName,
    this.roomNo,
    this.email,
    this.phoneNo,
    this.issue,
    this.comment,
    this.onTap,
  );
}
