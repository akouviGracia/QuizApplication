import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiztg/providers/phase.dart';



class PhaseScreen extends StatefulWidget {
  const PhaseScreen({super.key});
  @override
  State<PhaseScreen> createState() => _PhaseScreenState();
} 
class _PhaseScreenState extends State<PhaseScreen> {
  @override
  void initState() {
    super.initState();
    final phaseProvider = Provider.of<PhaseProvider>(context, listen: false);
    print(phaseProvider.fetchPhases());
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<PhaseProvider>(
            builder: (context, provider, child) {
              if (provider.phases.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                  color: Colors.cyan,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: provider.phases.length,
                  itemBuilder: (context, index) {
                    final phase = provider.phases[index];
                    return ListTile(
                      title: Text(phase.titre),
                      subtitle: Text(phase.description),
                    );
                  },
                );
               }
            },
            
          ),
        ),
      ],
    );
  }
}
        
    
