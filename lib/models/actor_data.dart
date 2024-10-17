class ActorDetails {
  final String name;
  final String? profilePath;
  final String? birthday;
  final String? placeOfBirth;
  final String? biography;

  ActorDetails({
    required this.name,
    this.profilePath,
    this.birthday,
    this.placeOfBirth,
    this.biography,
  });

  factory ActorDetails.fromJson(Map<String, dynamic> json) {
    return ActorDetails(
      name: json['name'] ?? 'Unknown',
      profilePath: json['profile_path'],
      birthday: json['birthday'],
      placeOfBirth: json['place_of_birth'],
      biography: json['biography'] ?? 'No biography available',
    );
  }
}
