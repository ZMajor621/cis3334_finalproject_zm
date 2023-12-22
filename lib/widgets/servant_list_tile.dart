import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/models/servant.dart';

class ServantListTile extends StatefulWidget {
  const ServantListTile({
    super.key,
    required this.servant,
    required this.onEdit,
    required this.onDelete,
  });

  final Servant servant;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  State<ServantListTile> createState() => _ServantListTileState();
}

class _ServantListTileState extends State<ServantListTile> {
  final NOBLE_PHANTASM_CARD = ["Buster", "Arts", "Quick"];

  final SERVANT_CLASS = ["Saber", "Archer", "Lancer", "Rider", "Caster", "Assassin", "Berserker", "Ruler", "Avenger", "Moon Cancer", "Alter Ego", "Foreigner", "Pretender", "Shielder"];

  Image nobleImage(int noblePhantasm) {
    final imageMap ={
      0: 'graphics/buster.png',
      1: 'graphics/arts.png',
      2: 'graphics/quick.png',
    };
    String imageFile = imageMap[noblePhantasm] ?? 'graphics/buster.png';
    return Image(image: AssetImage(imageFile));
  }

  Image classImage(int servantClass) {
    final imageMap ={
      0: 'graphics/Class-Saber-Gold.png',
      1: 'graphics/Class-Archer-Gold.png',
      2: 'graphics/Class-Lancer-Gold.png',
      3: 'graphics/Class-Rider-Gold.png',
      4: 'graphics/Class-Caster-Gold.png',
      5: 'graphics/Class-Assassin-Gold.png',
      6: 'graphics/Class-Berserker-Gold.png',
      7: 'graphics/Class-Ruler-Gold.png',
      8: 'graphics/Class-Avenger-Gold.png',
      9: 'graphics/Class-MoonCancer-Gold.png',
      10: 'graphics/Class-Alterego-Gold.png',
      11: 'graphics/Class-Foreigner-Gold.png',
      12: 'graphics/Class-Pretender-Gold.png',
      13: 'graphics/Class-Shielder-Gold.png',
    };
    String imageFile = imageMap[servantClass] ?? 'graphics/Class-Saber-Gold.png';
    return Image(image: AssetImage(imageFile));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          border: Border.all(
            width: 5,
            color: Colors.black,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    SERVANT_CLASS[widget.servant.servantClass],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.servant.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  classImage(widget.servant.servantClass),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Attack',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        widget.servant.attack,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Noble Phantasm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.amber,
                        ),
                      ),
                      nobleImage(widget.servant.noblePhantasmCard),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Health Points',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        widget.servant.hp,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  IconButton(
                    onPressed: widget.onDelete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onEdit,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}