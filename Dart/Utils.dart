void showList(List<Object> l, [int size = 2, int level = 0]) {
  final indent = " "*size;
  int index = 0;
  for (final i in l) {
    final key = indent*level + "$index : ";
    if (i is List<Object>) {
      print(key);
      showList(i, size, level+1);
    }
    else print(key + i.toString());
    index++;
  }
}
