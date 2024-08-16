import 'package:expense_tracker/config/config.dart';
import 'package:expense_tracker/models/expense_category.dart';
import 'package:expense_tracker/utils/field_validators_utils.dart';
import 'package:expense_tracker/widgets/new_expense/config/new_expense.config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _expenseController = TextEditingController();
  final _selectedDateController = TextEditingController();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final selectedDateFromDatePicker = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    if (selectedDateFromDatePicker == null) {
      return;
    }
    _selectedDateController.value = TextEditingValue(
        text: DateFormat(Config.dateFormat)
            .format(selectedDateFromDatePicker)
            .toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _expenseController.dispose();
    _selectedDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              key: const Key('TitleInput'),
              controller: _titleController,
              decoration: const InputDecoration(label: Text('Title')),
              keyboardType: TextInputType.text,
              validator: (value) =>
                  FieldValidatorsUtils.requiredField(value, fieldName: 'Title'),
              maxLength: 50,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    key: const Key('ValueInput'),
                    controller: _expenseController,
                    inputFormatters: inputFormatters,
                    decoration: const InputDecoration(
                        label: Text('Expense'), prefixText: '€ '),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) =>
                        FieldValidatorsUtils.priceAmountValidatorField(value,
                            fieldName: 'Expense'),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                      key: const Key('DateInput'),
                      controller: _selectedDateController,
                      canRequestFocus: false,
                      onTap: _presentDatePicker,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month),
                          label: Text('Date')),
                      validator: (value) => FieldValidatorsUtils.requiredField(
                          value,
                          fieldName: 'Date')),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              key: const Key('Category'),
              decoration: const InputDecoration(label: Text('Category')),
              validator:(value) => FieldValidatorsUtils.requiredField(value?.name, fieldName: 'Category'),
                items: ExpenseCategory.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {}),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: onCancelForm(context),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: onFormSubmit(formKey),
                    child: const Text('Save Expense'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
