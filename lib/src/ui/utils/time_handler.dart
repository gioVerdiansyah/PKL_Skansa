String formatDateToStringJMD(String date) {
  DateTime parsedDate = DateTime.parse(date);
  DateTime currentDate = DateTime.now();
  Duration difference = currentDate.difference(parsedDate);

  int hours = difference.inHours;
  int minutes = difference.inMinutes % 60;
  int seconds = difference.inSeconds % 60;

  String formattedTime = "${hours.toString().padLeft(2, '0')} jam "
      "${minutes.toString().padLeft(2, '0')} menit "
      "${seconds.toString().padLeft(2, '0')} detik";

  return formattedTime;
}