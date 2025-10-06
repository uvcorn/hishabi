import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/statistics_provider.dart';
import '../widgets/statistics_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatisticsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
        actions: const [Icon(Icons.share)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Filter Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceChip(label: Text("Day"), selected: true),
              ChoiceChip(label: Text("Week"), selected: false),
              ChoiceChip(label: Text("Month"), selected: false),
              ChoiceChip(label: Text("Year"), selected: false),
            ],
          ),
          const SizedBox(height: 16),

          // 🔹 Chart placeholder
          const StatisticsChart(),
          const SizedBox(height: 16),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Top Spending",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // 🔹 Transaction List
          Expanded(
            child: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.transactions.length,
                    itemBuilder: (context, index) {
                      final tx = provider.transactions[index];
                      return ListTile(
                        // leading: CircleAvatar(
                        //   backgroundColor: Colors.grey.shade200,
                        //   child: Image.asset(tx.icon, height: 24),
                        // ),
                        title: Text(tx.title),
                        subtitle: Text(tx.date),
                        trailing: Text(
                          "${tx.isExpense ? "- " : "+ "}\$${tx.amount}",
                          style: TextStyle(
                            color: tx.isExpense ? Colors.red : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
