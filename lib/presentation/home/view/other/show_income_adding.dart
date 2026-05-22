import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundoo/core/l10n/l10n.dart';
import 'package:fundoo/core/services/initialize_everything.dart';
import 'package:fundoo/core/widget/custom_button.dart';
import 'package:fundoo/core/widget/custom_text_field.dart';
import 'package:fundoo/data/models/category.dart';
import 'package:fundoo/domain/use_case/category_use_case.dart';
import 'package:fundoo/presentation/home/bloc/home_bloc/home_bloc.dart';

void openIncomeAddDialog(BuildContext context, String goalId) async {
  TextEditingController sum = TextEditingController();
  TextEditingController purpose = TextEditingController();
  int? categoryId;
  TextEditingController category = TextEditingController();
  bool isOther = false;
  List<Category> categories = await CategoryUseCase().getIncomeCategories();
  if (context.mounted) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            category.addListener(() => setState(() {}));
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 28,
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 60,
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.addIncome,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 10),
                  Text(
                    context.l10n.addIncomeBody,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    controller: sum,
                    keyboardType: TextInputType.number,
                    label: context.l10n.incomeAmount,
                  ),
                  SizedBox(height: 16),
                  Text(
                    context.l10n.incomeCategory,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categories.map((cat) {
                      return ChoiceChip(
                        disabledColor: Color(0xFFF1F5F9),
                        selectedColor: Color(0xFFEFF6FF),
                        label: Text(cat.name),
                        selected: categoryId == cat.id,
                        onSelected: (selected) {
                          setState(() {
                            if (cat.isOther) {
                              isOther = true;
                              categoryId = null;
                            } else {
                              isOther = false;
                              categoryId = cat.id;
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  if (isOther)
                    CustomTextField(
                      controller: category,
                      label: context.l10n.incomeCategory,
                    ),
                  SizedBox(height: 16),
                  CustomTextField(
                    controller: purpose,
                    label: context.l10n.incomeNotes,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: Color(0xFFF1F5F9),
                          child: Text(
                            context.l10n.cancel,
                            style: TextStyle(color: Color(0xFF334155)),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          onPressed:
                              (sum.text.isNotEmpty &&
                                  (categoryId != null ||
                                      category.text.isNotEmpty))
                              ? () {
                                  context.read<HomeBloc>().add(
                                    AddIncomeToGoal(
                                      goalId: goalId,
                                      amount: double.tryParse(sum.text) ?? 0,
                                      categoryId: categoryId,
                                      customCategoryName: isOther
                                          ? category.text
                                          : null,
                                      description: purpose.text.isEmpty
                                          ? null
                                          : purpose.text,
                                    ),
                                  );
                                  initializeEverything(context);
                                  Navigator.pop(context);
                                }
                              : null,
                          backgroundColor: Color(0xFF22C55E),
                          child: Text(
                            context.l10n.save,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
