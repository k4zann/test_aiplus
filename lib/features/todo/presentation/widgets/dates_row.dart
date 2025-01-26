import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aiplus/core/widgets/row_builder.dart';
import 'package:test_aiplus/features/todo/presentation/view_models/todo_view_model.dart';
import 'package:test_aiplus/features/todo/presentation/widgets/date_container.dart';

class DatesRow extends StatelessWidget {
  const DatesRow({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<TodoViewModel>(
        builder: (context, state, _) {
          return RowBuilder(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              itemCount: state.days.length,
              itemBuilder: (context, index) {
                return DateContainer(
                  day: state.days[index],
                  isSelected: context.read<TodoViewModel>().selectedDate.day == state.days[index].day,
                  onTap: () {
                    context.read<TodoViewModel>().setSelectedDate(state.days[index]);
                  },
                );
              });
        }
      ),
    );
  }
}
