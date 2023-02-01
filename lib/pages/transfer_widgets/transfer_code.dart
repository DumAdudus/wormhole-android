import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../gen/ffi.dart';
import '../toasts/info_toast.dart';
import '../type_helpers.dart';

class TransferCode extends StatefulWidget {
  const TransferCode({Key? key, required this.data}) : super(key: key);

  final TUpdate data;

  @override
  State<TransferCode> createState() => _TransferCodeState();
}

class _TransferCodeState extends State<TransferCode> {
  bool qrcodevisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (qrcodevisible) ...[
            FutureBuilder<String>(
                future:
                    api.getPassphraseUri(passphrase: widget.data.getValue()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BarcodeWidget(
                      data: snapshot.data!,
                      barcode: Barcode.qrCode(),
                      color: theme.iconTheme.color ?? Colors.black,
                      height: 200.0,
                      width: 200.0,
                    );
                  } else {
                    return Container();
                  }
                }),
            const SizedBox(
              height: 30,
            )
          ],
          Text(AppLocalizations.of(context).transfer_code_label),
          SelectableText(
            widget.data.getValue(),
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: widget.data.getValue()));
                    if (mounted) {
                      InfoToast(
                        message: AppLocalizations.of(context)
                            .toast_info_passphrase_copy,
                      ).show(context);
                    }
                  },
                  icon: const Icon(Icons.copy)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      qrcodevisible = !qrcodevisible;
                    });
                  },
                  icon: const Icon(Icons.qr_code))
            ],
          )
        ],
      ),
    );
  }
}
