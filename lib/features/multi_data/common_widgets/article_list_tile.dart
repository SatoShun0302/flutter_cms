import 'package:flutter/material.dart';
import 'package:flutter_cms/features/multi_data/common_widgets/article_list_tile_child.dart';
import 'package:flutter_cms/utils/screen_env.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({Key? key, required this.valueKey, required this.documentId, required this.formattedDocMap}) : super(key: key);

  final int valueKey;
  final String documentId;
  final Map<String, dynamic> formattedDocMap;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(valueKey),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (_) {
              print("delete: $documentId");
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (_) {
              print("edit: $documentId");
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Edit',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (_) {
              print("archive: $documentId");
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (_) {
              print("save: $documentId");
            },
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ArticleListTileChild(
        title: formattedDocMap["title"],
        insertDate: '2022/05/20 demo',
        updateDate: '2022/05/29 demo',
      ),
    );
  }
}
