import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool _isDeveloper = true;
  Transportation _selectedTransportation = Transportation.car;
  bool _wantsBreakfast = false;
  bool _wantsLunch = false;
  bool _wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: _isDeveloper,
          onChanged: (value) => setState(() {
            _isDeveloper = !_isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehículo trasnporte'),
          subtitle: Text('$_selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: _selectedTransportation,
              onChanged: (value) => setState(() {
                _selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: _selectedTransportation,
              onChanged: (value) => setState(() {
                _selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por bote'),
              value: Transportation.boat,
              groupValue: _selectedTransportation,
              onChanged: (value) => setState(() {
                _selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: _selectedTransportation,
              onChanged: (value) => setState(() {
                _selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Desayuno?'),
          value: _wantsBreakfast,
          onChanged: (vlaue) => setState(() {
            _wantsBreakfast = !_wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: _wantsLunch,
          onChanged: (vlaue) => setState(() {
            _wantsLunch = !_wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena?'),
          value: _wantsDinner,
          onChanged: (vlaue) => setState(() {
            _wantsDinner = !_wantsDinner;
          }),
        ),
      ],
    );
  }
}
