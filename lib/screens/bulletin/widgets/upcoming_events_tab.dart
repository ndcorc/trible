import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trible/models/event.dart';
import 'package:trible/providers/events.dart';

class UpcomingEventsTab extends HookConsumerWidget {
  const UpcomingEventsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedEvents = useState<Set<String>>({});
    final asyncEvents = ref.watch(eventsProvider);

    return asyncEvents.when(
      data:
          (events) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children:
                  events.map((event) {
                    final isSaved = savedEvents.value.contains(event.id);

                    return _EventItem(
                      event: event,
                      isSaved: isSaved,
                      onSaveToggle: () {
                        final newSaved = Set<String>.from(savedEvents.value);
                        if (isSaved) {
                          newSaved.remove(event.id);
                        } else {
                          newSaved.add(event.id);
                        }
                        savedEvents.value = newSaved;
                      },
                    );
                  }).toList(),
            ),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

class _EventItem extends HookConsumerWidget {
  const _EventItem({
    required this.event,
    required this.isSaved,
    required this.onSaveToggle,
  });

  final Event event;
  final bool isSaved;
  final VoidCallback onSaveToggle;

  String _formatEventTime(Event event) {
    final startDate = event.startTime.toDate();
    final endDate = event.endTime.toDate();

    final dayFormatter = DateFormat('EEEE'); // Day of week
    final timeFormatter = DateFormat('h a'); // Hour + AM/PM

    final day = dayFormatter.format(startDate);
    final startTime = timeFormatter.format(startDate);
    final endTime = timeFormatter.format(endDate);

    return '$day, $startTime - $endTime';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider).asData?.value ?? [];
    final isLastEvent = events.isNotEmpty && event.id == events.last.id;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF7BA7B1).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF7BA7B1),
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),

              // Event details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF7BA7B1),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.location,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _formatEventTime(event),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // Action buttons
              Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 32,
                    child:
                        isSaved
                            ? Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                            : ElevatedButton(
                              onPressed: onSaveToggle,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF7BA7B1),
                                side: const BorderSide(
                                  color: Color(0xFF7BA7B1),
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                              ),
                              child: const Text(
                                'Save event',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 120,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF7BA7B1),
                        side: const BorderSide(
                          color: Color(0xFF7BA7B1),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: const Text(
                        'Get directions',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Dotted divider
          if (!isLastEvent)
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 1,
              child: CustomPaint(
                painter: _DottedLinePainter(),
                size: const Size(double.infinity, 1),
              ),
            ),
        ],
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.shade300
          ..strokeWidth = 1;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
