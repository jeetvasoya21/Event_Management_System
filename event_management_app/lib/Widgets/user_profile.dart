import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final avatarRadius = size.width * 0.16;
    // Responsive, but clamped font sizes to avoid overly large text on wide screens
    final double nameFont = (size.width * 0.056).clamp(18.0, 28.0);
    final double roleFont = (size.width * 0.04).clamp(12.0, 18.0);
    final double sectionTitleFont = (size.width * 0.045).clamp(16.0, 20.0);
    final double infoValueFont = (size.width * 0.04).clamp(14.0, 18.0);

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF4F6FB),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.02),
              CircleAvatar(
                radius: avatarRadius.clamp(46.0, 74.0),
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: (avatarRadius * 1.02).clamp(46.0, 74.0),
                  color: const Color.fromARGB(245, 39, 2, 88),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'User Name',
                style: TextStyle(
                  fontSize: nameFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Student',
                style: TextStyle(
                  fontSize: roleFont,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Card(
                elevation: 4,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                          fontSize: sectionTitleFont,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      profileInfoRow(
                        Icons.email_outlined,
                        'Email',
                        'email@example.com',
                        infoValueFont,
                      ),
                      const SizedBox(height: 14),
                      profileInfoRow(
                        Icons.phone_outlined,
                        'Phone',
                        '+91 98765 43210',
                        infoValueFont,
                      ),
                      const SizedBox(height: 14),
                      profileInfoRow(
                        Icons.school_outlined,
                        'Department',
                        'Computer Science',
                        infoValueFont,
                      ),
                      const SizedBox(height: 14),
                      profileInfoRow(
                        Icons.badge,
                        'ID Number',
                        '1234',
                        infoValueFont,
                      ),
                      const SizedBox(height: 14),
                      profileInfoRow(
                        Icons.apartment_outlined,
                        'College',
                        'College 1',
                        infoValueFont,
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Add logout logic here
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Color.fromARGB(245, 39, 2, 88),
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Color.fromARGB(245, 39, 2, 88),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: Color.fromARGB(245, 39, 2, 88)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileInfoRow(
  IconData icon,
  String label,
  String value,
  double fontSize,
) {
  return Row(
    children: [
      Icon(icon, color: const Color.fromARGB(245, 39, 2, 88), size: 20),
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize * 0.85,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ],
  );
}
