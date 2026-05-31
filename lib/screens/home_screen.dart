import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/habit_provider.dart';
import '../models/habit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime(2025, 3, 10);
  String userName = "Budi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with Profile Image
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side - Text content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('h:mm').format(DateTime.now()),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 28),

                          Text(
                            'Morning, $userName',
                            style: GoogleFonts.ubuntu(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),

                          Text(
                            DateFormat(
                              'EEEE, d MMMM, yyyy',
                            ).format(_selectedDate),
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Profile Image - Right side
                    GestureDetector(
                      onTap: () {
                        // Navigate to profile screen
                        // You can add navigation here
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF7C3AED),
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Week days row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildWeekDay('Mon'),
                    _buildWeekDay('Tue'),
                    _buildWeekDay('Wed'),
                    _buildWeekDay('Thu'),
                    _buildWeekDay('Fri'),
                    _buildWeekDay('Sat'),
                    _buildWeekDay('Sun'),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Dates row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateCircle('7', false),
                    _buildDateCircle('8', false),
                    _buildDateCircle('9', false),
                    _buildDateCircle('10', true),
                    _buildDateCircle('11', false),
                    _buildDateCircle('12', false),
                    _buildDateCircle('13', false),
                  ],
                ),
              ),

              // Set Reminder Card with Ring Image
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFF97316), Color(0xFFEA580C)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        // Left side - Text content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Set the reminder',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Never miss your morning routine!\nSet a reminder to stay on track',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: const Color(0xFFFFF3E0),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  _showSetReminderDialog();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    'Set Now',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFEA580C),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Right side - Ring Image
                        Container(
                          width: 70,
                          height: 70,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/ring.jpeg',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.notifications_active,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Daily Routine Header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daily routine',
                      style: GoogleFonts.ubuntu(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    Text(
                      'See all',
                      style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Daily Routine Timeline
              Column(
                children: [
                  _buildTimelineHabit(
                    title: "Drink a glass of water",
                    streak: "Streak 3 days",
                    time: "5 min",
                    imagePath: "assets/images/water.png",
                    iconBg: const Color(0xFFFFF3E8),
                    completed: true,
                    isFirst: true,
                    isLast: false,
                  ),

                  _buildTimelineHabit(
                    title: "Meditate to relax",
                    streak: "Streak 6 days",
                    time: "15 min",
                    imagePath: "assets/images/cycle.png",
                    iconBg: const Color(0xFFF3FAD9),
                    completed: true,
                    isFirst: false,
                    isLast: false,
                  ),

                  _buildTimelineHabit(
                    title: "Stretch for 10 minutes",
                    streak: "Streak 5 days",
                    time: "10 min",
                    imagePath: "assets/images/exerise.png",
                    iconBg: const Color(0xFFFFE7FA),
                    completed: false,
                    isFirst: false,
                    isLast: false,
                  ),

                  _buildTimelineHabit(
                    title: "Go for a short walk",
                    streak: "Streak 3 days",
                    time: "",
                    imagePath: "assets/images/man.png",
                    iconBg: const Color(0xFFFFF3E8),
                    completed: false,
                    isFirst: false,
                    isLast: true,
                    showAddButton: true,
                  ),
                ],
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF7C3AED),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.inter(fontSize: 12),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size: 24),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
          if (index == 1) {
            Navigator.pushNamed(context, '/progress');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFF97316),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: IconButton(
          onPressed: _showAddHabitDialog,
          icon: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
    );
  }

  Widget _buildWeekDay(String day) {
    return Text(
      day,
      style: GoogleFonts.inter(
        color: Colors.grey.shade600,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildDateCircle(String date, bool isSelected) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? const Color(0xFF1F2430) : Colors.white,
        border: isSelected
            ? null
            : Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Center(
        child: Text(
          date,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineHabit({
    required String title,
    required String streak,
    required String time,
    required String imagePath,
    required Color iconBg,
    required bool completed,
    required bool isFirst,
    required bool isLast,
    bool showAddButton = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Column
          SizedBox(
            width: 30,
            child: Column(
              children: [
                // Circle indicator
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: completed ? const Color(0xFFFF8A00) : Colors.white,
                    border: Border.all(
                      color: completed
                          ? const Color(0xFFFF8A00)
                          : Colors.grey.shade400,
                      width: 2,
                    ),
                  ),
                  child: completed
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),

                // Vertical line (except for last item)
                if (!isLast)
                  Container(
                    width: 2,
                    height: 100,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          completed
                              ? const Color(0xFFFF8A00)
                              : Colors.grey.shade300,
                          Colors.grey.shade200,
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Habit Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),

                  const SizedBox(width: 14),

                  // Title and streak
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          streak,
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Time or Add button
                  if (showAddButton)
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3E8FF),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, size: 18),
                        color: const Color(0xFF7C3AED),
                        onPressed: () {
                          _showAddHabitDialog();
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    )
                  else if (time.isNotEmpty) ...[
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.shade200,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      children: [
                        const Icon(
                          Icons.access_time_filled,
                          size: 16,
                          color: Colors.black54,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          time,
                          style: GoogleFonts.ubuntu(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSetReminderDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Set Reminder Time',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.alarm),
              title: Text('9:00 AM', style: GoogleFonts.inter()),
              onTap: () {
                Navigator.pop(context);
                _showSuccessMessage('Reminder set for 9:00 AM');
              },
            ),
            ListTile(
              leading: const Icon(Icons.alarm),
              title: Text('10:00 AM', style: GoogleFonts.inter()),
              onTap: () {
                Navigator.pop(context);
                _showSuccessMessage('Reminder set for 10:00 AM');
              },
            ),
            ListTile(
              leading: const Icon(Icons.alarm),
              title: Text('11:00 AM', style: GoogleFonts.inter()),
              onTap: () {
                Navigator.pop(context);
                _showSuccessMessage('Reminder set for 11:00 AM');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddHabitDialog() {
    final TextEditingController habitController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'New Habit',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: habitController,
              decoration: InputDecoration(
                hintText: 'Name your habit',
                hintStyle: GoogleFonts.inter(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: GoogleFonts.inter(),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (habitController.text.isNotEmpty) {
                    Navigator.pop(context);
                    _showSuccessMessage('${habitController.text} added!');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C3AED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Habit',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.ubuntu()),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
