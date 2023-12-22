import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '/models/servant.dart';
import '/utils/utils.dart';
import '/widgets/servant_list_tile.dart';

class ServantsScreen extends StatefulWidget {
  const ServantsScreen({Key? key}) : super(key: key);

  @override
  State<ServantsScreen> createState() => _ServantsScreenState();
}

class _ServantsScreenState extends State<ServantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fate Grand Order Servants'),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Servant>('servants').listenable(),
          builder: (context, box, child) {
            final servants = box.values;
            return ListView.builder(
              itemCount: servants.length,
              itemBuilder: (context, index) {
                final servant = servants.elementAt(index);
                return ServantListTile(
                  servant: servant,
                  onDelete: () {
                    Hive.box<Servant>('servants').delete(servant.id);
                  },
                  onEdit: () async {
                    final newServant = await openAddServantDialog(
                      context: context,
                      servant: servant,
                    );
                    if (newServant != null) {
                      Hive.box<Servant>('servants').put(servant.id, newServant);
                    }
                    //setState(() {});
                  },
                );
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final servant = await openAddServantDialog(context: context);
          if (servant != null) {
            Hive.box<Servant>('servants').put(servant.id, servant);
          }
          //setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}