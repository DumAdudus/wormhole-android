import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../gen/meta.dart';
import '../settings/settings.dart';
import '../utils/numerical_range_formatter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _controllerWordLength = TextEditingController();

  @override
  void initState() {
    super.initState();
    Settings.getWordLength().then((value) {
      _controllerWordLength.text = value?.toString() ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child:
                    Text(AppLocalizations.of(context).settings_page_wordlength),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _controllerWordLength,
                  onChanged: (value) {
                    Settings.setWordLength(
                        value == '' ? null : int.parse(value));
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelStyle: theme.textTheme.bodyMedium,
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: theme.focusColor, width: 2)),
                    hintStyle: theme.textTheme.bodyMedium?.apply(
                        color:
                            theme.textTheme.bodyMedium?.color?.withOpacity(.4)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: Defaults.wordlength.toString(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    NumericalRangeFormatter(min: 2, max: 8)
                  ], // Only numbers can be entered
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Version: ${Meta.version}'),
              if (Meta.devBuild)
                Text(AppLocalizations.of(context).dev_build_warning),
              const SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
