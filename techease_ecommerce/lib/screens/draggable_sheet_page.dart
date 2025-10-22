import 'package:flutter/material.dart';

class DraggableSheetPage extends StatelessWidget {
  const DraggableSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(20, (i) => 'Gadget ${i + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Scrollable Sheet')),
      body: Stack(
        children: [
          // Background section (ignore pointer so drag works)
          IgnorePointer(
            child: Container(
              color: Colors.blue[100],
              child: const Center(
                child: Text(
                  '⬆️ Drag the white sheet upward',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Draggable Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.1,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Small handle bar at the top
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    // Scrollable list inside the sheet
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            leading: const Icon(Icons.devices_other),
                            title: Text(items[i]),
                            subtitle: const Text('Gadget details here'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
