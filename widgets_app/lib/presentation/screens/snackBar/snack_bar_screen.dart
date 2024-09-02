import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snack_bar_screen';

  const SnackBarScreen({super.key});

  void _showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'OK!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estás seguro?'),
        content: const Text(
            'Docenditale adolescens usu volutpat commodo menandri ei docendi consectetuer potenti penatibus quaestio no.  Offenditnecessitatibus duo ridens bibendum conclusionemque scripta quis reprehendunt repudiare detraxit per dolor reprimique rutrum quam neglegentur aperiri pro.  Ornatuselit aperiri sale adipisci harum utroque nibh intellegat nisi sed quod singulis tation sollicitudin veri legere.  Meliusmoderatius possit adipisci justo quaerendum natoque mea.  Dignissimvidisse dolorem dolor alterum dolore tempor orci scripta platonem augue commodo splendide efficiantur.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cacelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack bars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Verteremfacilis unum scripta tantas prodesset inciderint decore graecis aliquet.  Mandamusferri deterruisset blandit honestatis porttitor libris persequeris gloriatur adversarium habitant eros ridiculus iriure fabulas semper venenatis brute disputationi gloriatur.  Placerattota persius adhuc maximus leo nam pretium mucius dictas.  Epicureimassa cursus massa quisque suas eirmod inciderint conubia vituperata fusce facilis deterruisset saepe evertitur interesset placerat antiopam.  Maiorumnec evertitur mediocrem tritani habemus in fugit himenaeos reque dolores impetus maiestatis.'),
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => _openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snacBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => _showCustomSnackBar(context),
      ),
    );
  }
}
