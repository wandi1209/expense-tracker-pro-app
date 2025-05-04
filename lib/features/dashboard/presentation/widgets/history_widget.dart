import 'package:expense_tracker_pro/core/configs/assets/app_vectors.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transactions History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => context.push('/transactions'),
              child: const Text('See All'),
            ),
          ],
        ),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              title: const Text('Testing'),
              subtitle: const Text('12-09-2024'),
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.secondary,
                child: SvgPicture.asset(AppVectors.arrowDown),
              ),
              trailing: Text(
                'Rp. 20.000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green.shade600,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
