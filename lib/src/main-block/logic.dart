import 'dart:collection';

List<int> calc(List<int> nominals, int sum) {
    nominals.sort();

    if (nominals.isEmpty)
    	return null;

    if (nominals[0] <= 0)
      return null;

    List<int> D = List.filled(sum + 1, 0);
    Map<int, List<int>> map = new Map();
    int res;

    int C(int w, int ind) {
      int cur_ind = w - nominals[ind];

      if (!map.containsKey(cur_ind))
        map[cur_ind] = [];

      int flag = map[cur_ind].indexOf(nominals[ind]) == -1 ? 1 : 0;
      int val = flag * nominals[ind];

      return val;
    };

    void swap(int w, int i) {
      int c_val = C(w, i);
      int cur_ind = w - nominals[i];
      List<int> nw;
      HashSet<int> a, b;

      nw = (map.containsKey(cur_ind) ? map[cur_ind] : new List<int>(0)) + [nominals[i]];
      a = HashSet.from(nw);
      b = HashSet.from(map.containsKey(w) ? map[w] : new List<int>(0));

      if (b.length > 0 && a.length < b.length) return;

      D[w] = D[cur_ind] + c_val;
      // if (flag)
      map[w] = nw;
    };

    for(int w = 1; w <= sum; w++) {
      for(int i = 0; i < nominals.length; i++) {
        if (nominals[i] <= w) {
          int c_val = C(w, i);
          if (D[w] <= D[w - nominals[i]] + c_val) {
            swap(w, i);
          }
        }
      }
    }

    try {
      map[sum].sort();
      res = map[sum].reduce((a, b) {return a+b;});
      if (res == sum) 
        return map[sum];
    } catch (e) {
      return null;
    }

    return null;
  }