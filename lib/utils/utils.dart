import 'package:flutter/material.dart';

import '/models/servant.dart';
import '/widgets/add_servant_dialog.dart';

Future<Servant?> openAddServantDialog({
  required BuildContext context,
  Servant? servant,
}) {
  return showDialog<Servant?>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AddServantDialog(
        servant: servant,
      );
    },
  );
}