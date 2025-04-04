import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/widgets/custom_button.dart';
import 'package:linkdin_app/features/payment/presentation/views/payment_view.dart';

class DonateViewBody extends StatelessWidget {
  const DonateViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kPaddingHorizontal, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Donate & Make a Difference', textAlign: TextAlign.center),
            Icon(
              Icons.volunteer_activism,
              size: 80,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Make a Difference with Your Donation',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'Every contribution you make is more than just financial aid; '
              'it’s a beacon of hope for those in need. With your generosity, '
              'we can create real change, ensuring support reaches the most deserving individuals.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            _buildDonationCategory(
              icon: Icons.child_care,
              title: 'Orphans',
              description:
                  'Providing them with a safe home, education, and a brighter future.',
              color: Colors.blueAccent,
            ),
            _buildDonationCategory(
              icon: Icons.favorite,
              title: 'The Needy',
              description:
                  'Offering essentials like food, shelter, and medical assistance.',
              color: Colors.redAccent,
            ),
            _buildDonationCategory(
              icon: Icons.school,
              title: 'Teachers',
              description:
                  'Supporting educators who dedicate their lives to shaping the next generation.',
              color: Colors.greenAccent,
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).push(PaymentView.path);
              },
              title: 'Donate Now',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationCategory({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shadowColor: AppColors.grey12,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 40, color: color),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
