import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/bootstrap/bootstrap_store.dart';
import 'package:weather/presentation/home/home_screen.dart';

import '../../injection.dart';

class BootstrapScreen extends StatelessWidget {
  const BootstrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<BootstrapStore>(
      create: (_) => getIt<BootstrapStore>()..init(),
      child: Consumer<BootstrapStore>(
        builder: (context, bootstrapStore, child) => Scaffold(
          body: SafeArea(
            child: FutureBuilder(
              future: bootstrapStore.hasLocationPermission,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data!) {
                    return const HomeScreen();
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: AutoSizeText(
                            'Precisamos de sua localização para '
                            'exibir a previsão do tempo',
                            textAlign: TextAlign.center,
                            minFontSize: 20,
                            maxFontSize: 30,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await bootstrapStore.openAppSettings();
                          },
                          child: const Text('Tentar novamente'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            bootstrapStore.init();
                          },
                          child: const Text('Recarregar'),
                        ),
                      ],
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
