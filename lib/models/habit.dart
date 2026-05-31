class Habit {
  String? id;
  String userId;
  String name;
  String? goal;
  DateTime? targetDate;
  double? targetAmount;
  String unit;
  List<int> repeatDays;
  bool hasReminder;
  DateTime? reminderTime;
  int currentStreak;
  int longestStreak;
  bool isCompleted;
  DateTime? lastCompletedDate;
  int pointsEarned;
  int totalTimeSpent;
  double progress;
  DateTime createdAt;
  DateTime? completedAt;

  Habit({
    this.id,
    required this.userId,
    required this.name,
    this.goal,
    this.targetDate,
    this.targetAmount,
    this.unit = 'min',
    this.repeatDays = const [0, 1, 2, 3, 4, 5, 6],
    this.hasReminder = false,
    this.reminderTime,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.isCompleted = false,
    this.lastCompletedDate,
    this.pointsEarned = 0,
    this.totalTimeSpent = 0,
    this.progress = 0,
    DateTime? createdAt,
    this.completedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'goal': goal,
      'target_date': targetDate?.toIso8601String(),
      'target_amount': targetAmount,
      'unit': unit,
      'repeat_days': repeatDays,
      'has_reminder': hasReminder,
      'reminder_time': reminderTime?.toIso8601String(),
      'current_streak': currentStreak,
      'longest_streak': longestStreak,
      'is_completed': isCompleted,
      'last_completed_date': lastCompletedDate?.toIso8601String(),
      'points_earned': pointsEarned,
      'total_time_spent': totalTimeSpent,
      'progress': progress,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      goal: json['goal'],
      targetDate: json['target_date'] != null
          ? DateTime.parse(json['target_date'])
          : null,
      targetAmount: json['target_amount']?.toDouble(),
      unit: json['unit'] ?? 'min',
      repeatDays: List<int>.from(json['repeat_days'] ?? [0, 1, 2, 3, 4, 5, 6]),
      hasReminder: json['has_reminder'] ?? false,
      reminderTime: json['reminder_time'] != null
          ? DateTime.parse(json['reminder_time'])
          : null,
      currentStreak: json['current_streak'] ?? 0,
      longestStreak: json['longest_streak'] ?? 0,
      isCompleted: json['is_completed'] ?? false,
      lastCompletedDate: json['last_completed_date'] != null
          ? DateTime.parse(json['last_completed_date'])
          : null,
      pointsEarned: json['points_earned'] ?? 0,
      totalTimeSpent: json['total_time_spent'] ?? 0,
      progress: (json['progress'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['created_at']),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,
    );
  }
}
