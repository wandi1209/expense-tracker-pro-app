import 'package:expense_tracker_pro/core/configs/assets/app_images.dart';
import 'package:expense_tracker_pro/features/dashboard/data/models/dashboard_model.dart';
import 'package:expense_tracker_pro/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:expense_tracker_pro/features/dashboard/presentation/widgets/card_widget.dart';
import 'package:expense_tracker_pro/features/dashboard/presentation/widgets/history_widget.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';
import 'package:expense_tracker_pro/features/user/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    context.read<DashboardBloc>().add(DashboardEventGetDashboard());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardStateGetDashboardSuccess) {
            DashboardModel data = state.data;
            UserModel user = data.user;
            List<TransactionModel> transactions = data.transactions;
      
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset(AppImages.dashboardBg),
                  Image.asset(AppImages.dashboardParticle),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome back,',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
      
                          Text(
                            user.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CardWidget(
                            income: user.balance,
                            expense: user.balance,
                            balance: user.balance,
                          ),
                          HistoryWidget(lisData: transactions),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is DashboardStateFailure) {
            return Text(state.error);
          }
          return const Text("EROR");
        },
      ),
    );
  }
}
