import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../rust/api.dart';
import '../../rust/wormhole/types/error_types.dart';
import '../../navigation/navigation_provider.dart';
import '../receive_page.dart';

class TransferError extends StatelessWidget {
  const TransferError({super.key, required this.error, this.message});

  final ErrorType error;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(AppLocalizations.of(context)!.transfer_error_base),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              genErrorMessage(error, message),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<NavigationProvider>(context, listen: false)
                          .setActivePage(const ReceivePage());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.transfer_error_retry,
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    )),
              ),
            ),
          ]),
    );
  }

  String genErrorMessage(ErrorType error, String? message) {
    // todo error translations
    switch (error) {
      case ErrorType.invalidFilename:
        return 'Sender did not specify a filename';
      case ErrorType.noFilePathFound:
        return 'No valid filepath could be found';
      case ErrorType.connectionError:
        return message ?? 'Connection Failed';
      case ErrorType.fileRequestError:
      case ErrorType.fileOpen:
      case ErrorType.transferError:
      case ErrorType.transferConnectionError:
      case ErrorType.zipFileError:
        return message ?? 'Invalid Message';
    }
  }
}
