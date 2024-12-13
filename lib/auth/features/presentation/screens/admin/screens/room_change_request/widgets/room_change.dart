class RoomChange {
  final String name;
  final String userName;
  final String currentRoom;
  final String currentBlock;
  final String email;
  final String phoneNo;
  final String block;
  final String room;
  final String reason;
  final void Function()? reject;
  final void Function()? approve;

  RoomChange(
    this.name,
    this.userName,
    this.currentRoom,
    this.currentBlock,
    this.email,
    this.phoneNo,
    this.block,
    this.room,
    this.reason,
    this.reject,
    this.approve,
  );
}
