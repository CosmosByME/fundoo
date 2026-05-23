import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <({String question, String answer})>[
      (
        question: 'Fundoo nima?',
        answer:
            'Fundoo daromad va xarajatlarni kuzatish, maqsadlar qo\'yish va moliyaviy odatlarni yaxshilashga yordam beradi.',
      ),
      (
        question: 'Balansni qanday qo\'shaman?',
        answer:
            'Asosiy sahifadagi qo\'shish tugmasi orqali yangi balans yoki tranzaksiyani kiritishingiz mumkin.',
      ),
      (
        question: 'Ma\'lumotlarim xavfsizmi?',
        answer:
            'Ha. Hisob ma\'lumotlari ilova ichida saqlanadi va faqat sizning profilingiz orqali boshqariladi.',
      ),
      (
        question: 'Ilovani qanday o\'chirish mumkin?',
        answer:
            'Telefon sozlamalaridan ilovalar ro\'yxatiga kirib Fundoo ilovasini olib tashlashingiz mumkin.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE8ECF4)),
            ),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              title: Text(
                item.question,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              children: [
                Text(
                  item.answer,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
