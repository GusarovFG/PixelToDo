import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:todolist/presentation/pixel_decoration/pixel_decoration.dart';

class DetailAlert extends StatelessWidget {
  const DetailAlert({super.key});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen = MediaQuery.sizeOf(context).width;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 250,
        width: widthOfScreen / 1.5,
        decoration: PixelDecoration.shapeDecoration(context),
        child: ColoredBox(
          color: Theme.of(context).colorScheme.onPrimary,
          child: Stack(
            children: [
              Positioned(
                top: 1,
                right: 1,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Please enter the title',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15,
                          fontFamily: 'pixel'),
                    ),
                    Container(
                      height: 50,
                      width: widthOfScreen / 4,
                      decoration: ShapeDecoration(
                        shape: PixelBorder.solid(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                            pixelSize: 2),
                      ),
                      child: MaterialButton(
                        enableFeedback: true,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Okey',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
