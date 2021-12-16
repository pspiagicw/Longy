import 'dart:math';

class StepObject {
  final String header;
  final String description;

  StepObject({required this.header, required this.description});
}

List<StepObject> getSteps(text1, text2) {
  var result = compute_lcs_steps(text1, text2);
  result.addAll(find_lcs_string(text1, text2));
  return result;
}

List<StepObject> compute_lcs_steps(text1, text2) {
  // """Computes a table of f(i, j) results."""
  print(text1);
  print(text2);
  int n = text1.length;
  int m = text2.length;

  // We store the results in a (n + 1) x (m + 1) matrix. The +1s are to
  // allocate space for the empty strings. Cell [i][j] will cache the
  //result of f(i, j).
  // lcs = [[None for _ in range(m + 1)]
  //              for _ in range(n + 1)]

  List<List<int>> lcs =
      List.generate(n + 1, (_) => List.generate(m + 1, (_) => -1));
  List<StepObject> steps = [];
  // We then fill the matrix by going through all rows, using the fact
  // that each call only needs results from the previous (i - 1) or
  // same (i) row, and from the previous (j - 1) or same (j) column.
  for (int i = 0; i < n + 1; i++) {
    for (int j = 0; j < m + 1; j++) {
      //  The remaining code is exactly the same recursion as before, but
      //  we do not make recursive calls and instead use the results cached
      //  in the matrix.
      if (i == 0 || j == 0) {
        lcs[i][j] = 0;
        // steps.add(StepObject(
        //   header: "Strings are empty!",
        //   description:
        //       "The given strings must be empty as the given argument to the compute function is empty",
        // ));
      } else if (text1[i - 1] == text2[j - 1]) {
        lcs[i][j] = 1 + lcs[i - 1][j - 1];
        steps.add(StepObject(
            header: "Character Matched!",
            description:
            "The character '${text1[i - 1]}' matched at position ${i-1} (String1) and ${j-1} (String2). Thus value of matrix[$i][$j] was set to ${lcs[i][j]}"));
      } else {
        lcs[i][j] = max(lcs[i - 1][j], lcs[i][j - 1]);
        steps.add(StepObject(
            header: "Character not-matched",
            description:
            "The character '${text1[i - 1]}'  at position ${i - 1} (String1) did not match character ${text2[j - 1]} at position ${j - 1} (String2). Thus we are finding LCS between their substrings"));
      }
    }
  }
  print(lcs);
  print(steps);
  return steps;
}

List<List<int>> compute_lcs_len(text1, text2) {
  // """Computes a table of f(i, j) results."""
  int n = text1.length;
  int m = text2.length;

  // We store the results in a (n + 1) x (m + 1) matrix. The +1s are to
  // allocate space for the empty strings. Cell [i][j] will cache the
  //result of f(i, j).
  // lcs = [[None for _ in range(m + 1)]
  //              for _ in range(n + 1)]

  List<List<int>> lcs =
      List.generate(n + 1, (_) => List.generate(m + 1, (_) => -1));
  // We then fill the matrix by going through all rows, using the fact
  // that each call only needs results from the previous (i - 1) or
  // same (i) row, and from the previous (j - 1) or same (j) column.
  for (int i = 0; i < n + 1; i++) {
    for (int j = 0; j < m + 1; j++) {
      //  The remaining code is exactly the same recursion as before, but
      //  we do not make recursive calls and instead use the results cached
      //  in the matrix.
      if (i == 0 || j == 0) {
        lcs[i][j] = 0;
      } else if (text1[i - 1] == text2[j - 1]) {
        lcs[i][j] = 1 + lcs[i - 1][j - 1];
      } else {
        lcs[i][j] = max(lcs[i - 1][j], lcs[i][j - 1]);
      }
    }
  }
  return lcs;
}

List<StepObject> find_lcs_string(text1, text2) {
  // """Finds the longest common subsequence of the given texts."""
  var result = "";
  var lcs = compute_lcs_len(text1, text2);

  int i = text1.length;
  int j = text2.length;

  List<StepObject> steps = [];
  // # We iterate until we reach the end of text1 (i == 0) or text2 (j == 0)
  while (i != 0 && j != 0) {
    // # If the parts of text1 and text2 that we consider are equal, then we
    // # can record this as part of the LCS, and move to i-1, j-1 since this
    // # is also how compute_lcs_len traversed.
    // # Otherwise, compute_lcs_len went into the max direction, which is
    // # also what we do here.
    if (text1[i - 1] == text2[j - 1]) {
      result += text1[i - 1];
      i -= 1;
      j -= 1;
      steps.add(StepObject(
          header: "Character included!",
          description:
          "The character '${text1[i]}' was included in the LCS"));
    } else if (lcs[i - 1][j] <= lcs[i][j - 1]) {
      j -= 1;
    } else {
      i -= 1;
    }

    // # Reverse results because we iterated over the texts from the end but
    // # want the results to be in forward order.
  }
  result = result.split('').reversed.join('');
  steps.add(StepObject(
      header: "The LCS: $result",
      description: "The final LCS between the two strings was calculated! The LCS is '${result}'"));
  return steps;
}
