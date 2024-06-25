import 'package:equatable/equatable.dart';

class GateEntryAttachments extends Equatable {
  const GateEntryAttachments({
    this.vehicleImage,
    this.sealTag,
    this.document,
    this.unloadedPile,
  });

  final String? vehicleImage;
  final String? sealTag;
  final String? document;
  final String? unloadedPile;

  GateEntryAttachments copyWith({
    String? vehicleImage,
    String? sealTagImage,
    String? documentImage,
    String? unloadedPilePic,
  }) =>
      GateEntryAttachments(
        vehicleImage: vehicleImage ?? this.vehicleImage,
        sealTag: sealTagImage ?? sealTag,
        document: documentImage ?? document,
        unloadedPile: unloadedPilePic ?? unloadedPilePic,
      );

  static GateEntryAttachments fromJson(final Map<String, dynamic> json) {
    var obj = const GateEntryAttachments();
    if (json.containsKey('vehicle_image')) {
      obj = obj.copyWith(vehicleImage: json['vehicle_image']);
    }
    if (json.containsKey('seal_tag_image')) {
      obj = obj.copyWith(sealTagImage: json['seal_tag_image']);
    }
    if (json.containsKey('document_image')) {
      obj = obj.copyWith(documentImage: json['document_image']);
    }
    if (json.containsKey('unloaded_pile_pic')) {
      obj = obj.copyWith(unloadedPilePic: json['unloaded_pile_pic']);
    }
    return obj;
  }

  @override
  List<Object?> get props => [vehicleImage, sealTag, document, unloadedPile];
}
