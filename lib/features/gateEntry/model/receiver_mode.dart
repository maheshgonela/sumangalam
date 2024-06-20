enum ReceiverMode {
  byHand('By Hand'),
  byVehicle('By Vehicle');

  final String name;
  const ReceiverMode(this.name);

  static ReceiverMode? fromName(String? name) {
    if(name == ReceiverMode.byHand.name) {
      return  ReceiverMode.byHand;
    } else if(name == ReceiverMode.byVehicle.name){
      return ReceiverMode.byVehicle;
    }
    return null;
  }
}
