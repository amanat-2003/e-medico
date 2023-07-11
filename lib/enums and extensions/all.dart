extension ToStr<T> on Iterable<T> {
  String toStr() {
    String ans = '';
    for (final element in this) {
      if (element != last) {
        ans = '$ans$element | ';
      } else {
        ans = '$ans$element';
      }
    }
    return ans;
  }
}
