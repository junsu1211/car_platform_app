class UserModel {
  late int id;
  late String name;
  int? profile;
  get profileUrl => 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMDlfMjM2%2FMDAxNzAyMTA5MDU0MDEy.47lj6fYEYK9sOk1_zja3P5OpqoLRYRxhZbZoWsWDxo0g.zkPJUTBop4ugFckMdJJZu-lJxJDIHNh7qZT9FMIxRA0g.JPEG.mmx041%2F52126057797_442d8064d8_b.jpg&type=sc960_832';

  UserModel({required this.id, required this.name});
}