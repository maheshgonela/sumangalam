

import 'package:flutter/material.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class RejectReasonDialog extends StatefulWidget {
  const RejectReasonDialog({super.key});

  @override
  State<RejectReasonDialog> createState() => _RejectReasonDialogState();
}

class _RejectReasonDialogState extends State<RejectReasonDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        // constraints: BoxConstraints(maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              textAlign: TextAlign.left,
              'Reason For Rejection',
              style: TextStyle(
                color: AppColors.catalineBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: AppColors.catalineBlue,),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your reason here...',
                border: OutlineInputBorder(),
              ),
              maxLength: 200,
              minLines: 3,
              maxLines: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(_controller.text);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
