import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/services/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:flutter_app_template/core/services/notifications/presentation/bloc/notifications_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _separator = ' — ';

class AppNotificationListener extends StatelessWidget {
  const AppNotificationListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsBloc, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsMessageReceived) {
          final message = [state.notification.title, state.notification.body]
              .where((s) => s.isNotEmpty)
              .join(_separator);
          if (message.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          }
        }
      },
      child: child,
    );
  }
}
