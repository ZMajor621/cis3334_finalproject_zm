import 'package:flutter/material.dart';

import '/models/servant.dart';

class AddServantDialog extends StatefulWidget {
  const AddServantDialog({
    Key? key,
    this.servant,
  }) : super(key: key);

  final Servant? servant;

  @override
  State<AddServantDialog> createState() => _AddServantDialogState();
}

class _AddServantDialogState extends State<AddServantDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _servantClassController;
  late final TextEditingController _hpController;
  late final TextEditingController _attackController;
  late final TextEditingController _noblePhantasmCardController;
  int npSelected = 1;
  int classSelected = 1;
  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _hpController = TextEditingController();
    _attackController = TextEditingController();


    //_noblePhantasmCardController = TextEditingController();
    //_servantClassController = TextEditingController();
    if (widget.servant != null) {
      _nameController.text = widget.servant!.name;
      //_servantClassController.text = widget.servant!.servantClass;
      _hpController.text = widget.servant!.hp;
      _attackController.text = widget.servant!.attack;
      //_noblePhantasmCardController.text = widget.servant!.noblePhantasmCard;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    //_servantClassController.dispose();
    _hpController.dispose();
    _attackController.dispose();
    //_noblePhantasmCardController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Servant'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _attackController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Attack',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _hpController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Health Points',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 5),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter dropDownState) {
                  return DropdownButton(
                      style: Theme.of(context).textTheme.headline4,
                      value: npSelected,
                      items: const [
                        DropdownMenuItem(value: 0, child: Text("Buster")),
                        DropdownMenuItem(value: 1, child: Text("Arts")),
                        DropdownMenuItem(value: 2, child: Text("Quick")),
                      ],
                      onChanged: (value) {
                        dropDownState(() {
                          npSelected = value!;
                        });
                      });
                }),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter dropDownState) {
                  return DropdownButton(
                      style: Theme.of(context).textTheme.headline4,
                      value: classSelected,
                      items: const [
                        DropdownMenuItem(value: 0, child: Text("Saber")),
                        DropdownMenuItem(value: 1, child: Text("Archer")),
                        DropdownMenuItem(value: 2, child: Text("Lancer")),
                        DropdownMenuItem(value: 3, child: Text("Rider")),
                        DropdownMenuItem(value: 4, child: Text("Caster")),
                        DropdownMenuItem(value: 5, child: Text("Assassin")),
                        DropdownMenuItem(value: 6, child: Text("Berserker")),
                        DropdownMenuItem(value: 7, child: Text("Ruler")),
                        DropdownMenuItem(value: 8, child: Text("Avenger")),
                        DropdownMenuItem(value: 9, child: Text("Moon Cancer")),
                        DropdownMenuItem(value: 10, child: Text("Alter Ego")),
                        DropdownMenuItem(value: 11, child: Text("Foreigner")),
                        DropdownMenuItem(value: 12, child: Text("Pretender")),
                        DropdownMenuItem(value: 13, child: Text("Shielder"))
                      ],
                      onChanged: (value) {
                        dropDownState(() {
                          classSelected = value!;
                        });
                      });
                }),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Servant servant = Servant(
              id: DateTime.now().toString(),
              name: _nameController.text,
              servantClass: classSelected,
              hp: _hpController.text,
              attack: _attackController.text,
              noblePhantasmCard: npSelected,
            );
            if (widget.servant != null) {
              servant = Servant(
                id: widget.servant!.id,
                name: _nameController.text,
                servantClass: classSelected,
                hp: _hpController.text,
                attack: _attackController.text,
                noblePhantasmCard: npSelected,
              );
            }
            Navigator.of(context).pop(servant);
          },
          child: const Text('Add Servant'),
        ),
      ],
    );
  }
}