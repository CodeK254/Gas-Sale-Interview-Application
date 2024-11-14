String formatName(String name){
  List<String> strings = name.split(" ");
  strings.removeAt(strings.length - 1);
  return strings.join(' ');
}