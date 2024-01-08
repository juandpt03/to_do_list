import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(),
                _Stack(),
                _ToDoList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.bold,
        );

    const iconsSize = 35.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello.',
                style: titleTextStyle,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: iconsSize,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      size: iconsSize,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _Stack extends StatefulWidget {
  const _Stack();

  @override
  State<_Stack> createState() => __StackState();
}

class __StackState extends State<_Stack> {
  final List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'Task 1',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'task 2',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'task 3',
      subtitle: 'We believe in the power of mobile computing.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final subtitleTextStyle =
        Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            );
    return Column(
      children: [
        StackedNotificationCards(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2.0,
            )
          ],
          notificationCardTitle: 'Message',
          notificationCards: [..._listOfNotification],
          cardColor: Color(0xFFF1F1F1),
          padding: 16,
          actionTitle: Text(
            'Projects',
            style: subtitleTextStyle,
          ),
          showLessAction: Text(
            'Show less',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          onTapClearAll: () {
            setState(() {
              _listOfNotification.clear();
            });
          },
          clearAllNotificationsAction: Icon(Icons.close),
          clearAllStacked: Text('Clear All'),
          cardClearButton: Text('clear'),
          cardViewButton: Text('view'),
          onTapClearCallback: (index) {
            print(index);
            setState(() {
              _listOfNotification.removeAt(index);
            });
          },
          onTapViewCallback: (index) {
            print(index);
          },
        ),
      ],
    );
  }
}

class _ToDoList extends StatelessWidget {
  const _ToDoList();
  static const List<String> task = [
    'Task 1',
    'Task 2',
    'Task 3',
  ];

  @override
  Widget build(BuildContext context) {
    final subtitleTextStyle =
        Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            );
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "To Do List",
            style: subtitleTextStyle,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                  child: ListTile(
                    title: Text(task[index]),
                  ),
                ),
              );
            },
            itemCount: task.length,
          ),
        ],
      ),
    );
  }
}
