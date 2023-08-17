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

  Map<String, dynamic> toMap() {
  return {
    'id': id,
    'name': name,
    'dosage': dosage,
    'frequency': frequency,
    'reminderTimes': reminderTimes.join(','),  // Convert list to comma-separated string
    'notes': notes,
  };
}

static Medicine fromMap(Map<String, dynamic> map) {
  return Medicine(
    id: map['id'],
    name: map['name'],
    dosage: map['dosage'],
    frequency: map['frequency'],
    reminderTimes: map['reminderTimes'].split(','),  // Convert string back to list
    notes: map['notes'],
  );
}

}
