import 'package:flutter/material.dart';

import '../../../data/models/note.dart';


class NotesViewModel extends ChangeNotifier {
  DateTime _selected = DateTime.now();
  final List<Note> _items = [
    // some seed data (descending by date)
    Note(
      id: 'n1',
      date: DateTime.now().subtract(const Duration(days: 1)),
      text: 'The wound looks slightly smaller today. No signs of redness. Pain level lower than yesterday.',
    ),
    Note(
      id: 'n2',
      date: DateTime.now().subtract(const Duration(days: 2)),
      text: 'Mild redness around the edges. Applied ointment after cleaning. Pain when touching.',
    ),
    Note(
      id: 'n3',
      date: DateTime.now().subtract(const Duration(days: 7)),
      text: 'Changed the dressing in the afternoon. Some pus appeared. Noticed a slight odor.',
    ),
  ];

  DateTime get selected => _selected;

  void select(DateTime d) {
    _selected = DateTime(d.year, d.month, d.day);
    notifyListeners();
  }

  List<Note> get all => List.unmodifiable(_items..sort((a, b) => b.date.compareTo(a.date)));

  List<Note> recent({int count = 8}) {
    final sorted = List<Note>.from(_items)..sort((a, b) => b.date.compareTo(a.date));
    return sorted.take(count).toList();
  }

  List<Note> byDate(DateTime d) {
    return _items.where((n) => n.date.year == d.year && n.date.month == d.month && n.date.day == d.day).toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  void addNote({required DateTime date, required String text}) {
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    _items.add(Note(id: id, date: DateTime(date.year, date.month, date.day), text: text.trim()));
    notifyListeners();
  }
}
