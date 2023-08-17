class Medicine {
  final String id;
  final String name;
  final String dosage;
  final String frequency;
  final List<String> reminderTimes; // stored times in 24hr format like "14:00"
  final String notes;

  Medicine({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.reminderTimes,
    required this.notes,
  });
}
