class UploadCredentialsModel {
  String? pubKey;
  int? expire;
  String? signature;
  bool? secure;
  bool? imageInfo;
  String? source;
  String? cdnBase;

  UploadCredentialsModel({
    this.pubKey,
    this.expire,
    this.signature,
    this.secure,
    this.imageInfo,
    this.source,
    this.cdnBase,
  });

  factory UploadCredentialsModel.fromJson(Map<String, dynamic> json) {
    return UploadCredentialsModel(
      pubKey: json['pub_key'] as String?,
      expire: json['expire'] as int?,
      signature: json['signature'] as String?,
      secure: json['secure'] as bool?,
      imageInfo: json['image_info'] as bool?,
      source: json['source'] as String?,
      cdnBase: json['cdn_base'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'pub_key': pubKey,
    'expire': expire,
    'signature': signature,
    'secure': secure,
    'image_info': imageInfo,
    'source': source,
    'cdn_base': cdnBase,
  };
}
