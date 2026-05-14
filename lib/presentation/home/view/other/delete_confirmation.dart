import 'package:flutter/material.dart';

Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
  final result = await showAdaptiveDialog<bool>(
	context: context,
	builder: (context) {
	  return Dialog(
		backgroundColor: Colors.white,
		insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
		shape: RoundedRectangleBorder(
		  borderRadius: BorderRadius.circular(24),
		),
		child: Padding(
		  padding: const EdgeInsets.all(24),
		  child: Column(
			mainAxisSize: MainAxisSize.min,
			children: [
			  const Icon(
				Icons.delete_outline_rounded,
				size: 48,
				color: Color(0xFFDC2626),
			  ),
			  const SizedBox(height: 16),
			  const Text(
				'Are you sure you want to delete this goal?',
				textAlign: TextAlign.center,
				style: TextStyle(
				  fontSize: 18,
				  fontWeight: FontWeight.w700,
				  color: Color(0xFF111827),
				  height: 1.35,
				),
			  ),
			  const SizedBox(height: 24),
			  Row(
				children: [
				  Expanded(
					child: OutlinedButton(
					  onPressed: () => Navigator.of(context).pop(false),
					  style: OutlinedButton.styleFrom(
						foregroundColor: const Color(0xFF374151),
						side: const BorderSide(color: Color(0xFFD1D5DB)),
						shape: RoundedRectangleBorder(
						  borderRadius: BorderRadius.circular(16),
						),
						padding: const EdgeInsets.symmetric(vertical: 14),
					  ),
					  child: const Text(
						'Cancel',
						style: TextStyle(fontWeight: FontWeight.w600),
					  ),
					),
				  ),
				  const SizedBox(width: 12),
				  Expanded(
					child: ElevatedButton(
					  onPressed: () => Navigator.of(context).pop(true),
					  style: ElevatedButton.styleFrom(
						backgroundColor: const Color(0xFFDC2626),
						foregroundColor: Colors.white,
						elevation: 0,
						shape: RoundedRectangleBorder(
						  borderRadius: BorderRadius.circular(16),
						),
						padding: const EdgeInsets.symmetric(vertical: 14),
					  ),
					  child: const Text(
						'Delete',
						style: TextStyle(fontWeight: FontWeight.w600),
					  ),
					),
				  ),
				],
			  ),
			],
		  ),
		),
	  );
	},
  );

  return result ?? false;
}

