import 'package:flutter/material.dart';

class TopSpendingWidget extends StatelessWidget {
  const TopSpendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Spending',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.swap_vert),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade400,
                        child: Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.green.shade50,
                        ),
                      ),
                      title: const Text(
                        'Testing',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text('12-06-2013'),
                      trailing: Text(
                        'Rp. 20.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green.shade600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
