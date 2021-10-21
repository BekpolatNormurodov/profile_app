import 'dart:typed_data';

class Picture {
  Uint8List? picture;
  Uint8List? rasm;


  Picture({this.picture,this.rasm});

  Picture.fromMap(Map map) {
    this.picture = map['picture'];
    this.rasm = map["rasm"];
  }

  Map<String, dynamic> toMap() => {
    "picture": picture,
    "rasm": rasm,
  };
}
