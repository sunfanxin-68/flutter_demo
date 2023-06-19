import 'package:flutter/material.dart';
import './Button_demo.dart';
import './Floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './checkbox_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './datetime_demo.dart';
import './simple_dialog_demo.dart';
import './alert_dialog_demo.dart';
import './bottom_sheet_demo.dart';
import './snack_bar_demo.dart';
import './expansion_panel_demo.dart';
import './chip_demo.dart';
import './data_table.dart';
import './paginated_data_table_demo.dart';
import './card_demo.dart';
import './steeper_demo.dart';


class MaterialComponents extends StatelessWidget {
  const MaterialComponents({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: const <Widget>[
          ListItem(title: 'Stepper', page: StepperDemo()),
           ListItem(title: 'Card', page: CardDemo()),
           ListItem(title: 'PaginatedDataTable', page: PaginatedDataTableDemo()),
           ListItem(title: 'DataTable', page: DataTableDemo()),
           ListItem(title: 'Chip', page: ChipDemo()),
          ListItem(title: 'ExpansionPanel', page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBar', page: SnackBarDemo()),
           ListItem(title: 'BottomSheet', page: BottomSheetDemo()),
           ListItem(title: 'AlertDialog', page: AlertDialogDemo()),
           ListItem(title: 'SimpleDialog', page: SimpleDialogDemo()),
          ListItem(title: 'Date & Time', page: DateTimeDemo()),
           ListItem(title: 'Slider', page: SliderDemo()),
          ListItem(title: 'Switch', page: SwitchDemo()),
          ListItem(title: 'Radio', page: RadioDemo()),
           ListItem(title: 'Checkbox',page: CheckboxDemo(),),
           ListItem(title: 'Form',page: FormDemo(),),
          ListItem(title: 'PopupMenuButton',page: PopupMenuButtonDemo(),),
          ListItem(title: 'Button',page: ButtonDemo(), ),
          ListItem(title: 'FloatingActionButton',page: FloatingActionButtonDemo(),
          ),
        ],
      ),
    );
  }
}



class _WidgetDemo extends StatelessWidget {
  const _WidgetDemo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              )
            ]),
      ),
    );
  }
}



class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.title, required this.page});
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
