// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_4/models/notes_model.dart';

class DB{


  // Define a function that inserts notes into the database
  Future<void> insertNote(Note note) async {
    final db = await openDatabase(
        join(await getDatabasesPath(), 'notes_database.db'));
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

   // A method that retrieves all the notes from the notes table.
  Future<List<Note>> notes() async {
    // Get a reference to the database.
    final db = await openDatabase(
        join(await getDatabasesPath(), 'notes_database.db'));

    // Query the table for all The Notes.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Note>.
    return List.generate(maps.length, (i) {
      return Note(
        dateTime: maps[i]['dateTime'],
        task: maps[i]['task'],
      );
    });
  }
}