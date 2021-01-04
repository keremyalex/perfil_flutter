class Usuario {
    Usuario({
        this.id,
        this.name,
        this.direction,
        this.telephone,
        this.email,
        this.profilePhoto,
    });

    int id;
    String name;
    String direction;
    int telephone;
    String email;
    String profilePhoto;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        name: json["name"],
        direction: json["direction"],
        telephone: json["telephone"],
        email: json["email"],
        profilePhoto: json["profile_photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "direction": direction,
        "telephone": telephone,
        "email": email,
        "profile_photo": profilePhoto,
    };
}