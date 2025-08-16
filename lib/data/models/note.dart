class Note {
  final String id;
  final DateTime date; // local date (no time zone math here)
  final String text;

  Note({required this.id, required this.date, required this.text});
}