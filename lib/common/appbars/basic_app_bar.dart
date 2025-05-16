import 'package:expense_tracker_pro/common/dialogs/dialog_widget.dart';
import 'package:expense_tracker_pro/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool? logout;
  const BasicAppBar({super.key, required this.title, this.logout});

  @override
  State<BasicAppBar> createState() => _BasicAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BasicAppBarState extends State<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: widget.logout == true ? Colors.white : Colors.black,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      actions:
          widget.logout == true
              ? [
                GestureDetector(
                  onTap: () async {
                    warningDialog(context, 'Are you sure?', () async {
                      await authService.clearToken();
                      if (mounted) {
                        context.go('/login');
                      }
                    }).show();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.logout, color: Colors.white),
                  ),
                ),
              ]
              : null,
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: widget.logout == true ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
