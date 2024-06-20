import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

/// Represents [ADAttachment](http://wiki.openbravo.com/wiki/ERP/2.50/Developers_Guide/Reference/Entity_Model/Attachment) in openbravo.
///
/// [id], [name], [description] fields will come with openbravo by default. [fileData] comes from a custom module.
/// Please ensure that, that module exists in the server in order for this class to act as intended.
@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    @JsonKey(name: 'id') required String id,

    /// [name] value can be found with either key 'name' or 'file-name'. This condition has been handled
    /// in [Attachment.fromJson].
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'file_data', defaultValue: '') required String fileData,
    @JsonKey(name: 'description', defaultValue: '') required String description,
  }) = _Attachment;

  factory Attachment.fromJson(final Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  factory Attachment.fromJson2(final Map<String, dynamic> json) {
    final $attachmentFromJson = Attachment.fromJson(json);
    final name = $attachmentFromJson.name;

    return $attachmentFromJson.copyWith(
        name: name.isEmpty ? (json['file-name'] ?? '') : name);
  }
}
