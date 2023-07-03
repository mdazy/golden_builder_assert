import 'dart:math';

import 'package:flutter/material.dart';

class _InformationItem extends StatelessWidget {
  const _InformationItem({
    this.icon,
    required this.title,
    required this.value,
  });
  final IconData? icon;
  final String title;
  final String value;

  @override
  build(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(icon, size: 24, color: const Color(0xff0465da)),
                )
              : const SizedBox.shrink(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({super.key, this.date, this.size, this.version});
  final String? date;
  final String? size;
  final String? version;

  @override
  build(context) {
    final items = <Widget>[];
    if (date != null) {
      items.add(
        _InformationItem(
          icon: Icons.timelapse,
          title: 'Last updated',
          value: date!,
        ),
      );
    }
    if (version != null) {
      items.add(
        _InformationItem(
          icon: Icons.list,
          title: 'Version',
          value: version!,
        ),
      );
    }
    if (size != null) {
      items.add(
        _InformationItem(
          icon: Icons.cases,
          title: 'Size',
          value: size!,
        ),
      );
    }

    final rowItems = <List<Widget>>[];
    for (int i = 0; i < items.length; i += 2) {
      rowItems.add(items.sublist(i, min(items.length, i + 2)));
    }
    if (rowItems.last.length < 2) {
      rowItems.last.add(const TableCell(child: SizedBox.shrink()));
    }

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Table(
          children: rowItems
              .map(
                (row) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16,
                        bottom: 16,
                      ),
                      child: row.first,
                    ),
                    row.last,
                  ],
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
