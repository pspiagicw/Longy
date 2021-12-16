String calculateDiff(String string1 , String string2) {
  return '''This is the string diff
  ''';
}
  
// List<List<int>> compute_lcs_len(text1, text2){
//   // """Computes a table of f(i, j) results."""
//   n = text1.length;
//   m = text2.length;

//   // We store the results in a (n + 1) x (m + 1) matrix. The +1s are to
//   // allocate space for the empty strings. Cell [i][j] will cache the
//   //result of f(i, j).
//   // lcs = [[None for _ in range(m + 1)]
//   //              for _ in range(n + 1)]


//   lcs = List.generate(m , (_) => List(n));
//   // We then fill the matrix by going through all rows, using the fact
//   // that each call only needs results from the previous (i - 1) or
//   // same (i) row, and from the previous (j - 1) or same (j) column.
//   for (int i=0 ; i< n+1 , i++) {
//     for (int j =0 ; i< m+1 ; i++) {
//       //  The remaining code is exactly the same recursion as before, but
//       //  we do not make recursive calls and instead use the results cached
//       //  in the matrix.
//       if (i == 0 || j == 0) {
//         lcs[i][j] = 0;
//       } else if (text1[i - 1] == text2[j - 1]) {
//         lcs[i][j] = 1 + lcs[i - 1][j - 1];
//       } else {
//         lcs[i][j] = max(lcs[i - 1][j], lcs[i][j - 1]);
//       }
//     }
//   }
//   return lcs;
// }
// String find_lcs_string(text1, text2) {
//   // """Finds the longest common subsequence of the given texts."""
//   result = "";
//   lcs = compute_lcs_len(text1, text2);

//   i = text1.length;
//   j = text2.length;

//   // # We iterate until we reach the end of text1 (i == 0) or text2 (j == 0)
//   while (i != 0 && j != 0 ) {
//     // # If the parts of text1 and text2 that we consider are equal, then we
//     // # can record this as part of the LCS, and move to i-1, j-1 since this
//     // # is also how compute_lcs_len traversed.
//     // # Otherwise, compute_lcs_len went into the max direction, which is
//     // # also what we do here.
//     if text1[i - 1] == text2[j - 1] {
//       result += text1[i - 1]);
//       i -= 1;
//       j -= 1;
//     } else if (lcs[i - 1][j] <= lcs[i][j - 1]){
//       j -= 1;
//     } else {
//       i -= 1;
//     }

//   // # Reverse results because we iterated over the texts from the end but
//   // # want the results to be in forward order.
//   return result.split('').reversed.join('');
// }

// List<String> diff(text1, text2) {
//   // """Computes the optimal diff of the two given inputs.

//   // The result is a list where all elements are Removals, Additions or
//   // Unchanged elements.
//   // """
//   lcs = compute_lcs_len(text1, text2);
//   results = <String>[];

//   i = text1.length;
//   j = text2.length;

//   // # We iterate until we reach the end of both texts.
//   while (i != 0 ||  j != 0) {
//     // # If we reached the end of one of text1 (i == 0) or text2 (j == 0),
//     // # then we just need to print the remaining additions and removals.
//     if (i == 0) {
//       results.add(Addition(text2[j - 1]));
//       j -= 1;
//     } else if (j== 0) {
//       results.add(Removal(text1[i - 1]));
//       i -= 1;
//     }
//     // # Otherwise there's still parts of text1 and text2 left. If the
//     // # currently considered parts are equal, then we found an unchanged
//     // # part which belongs to the longest common subsequence.
//     else if (text1[i - 1] == text2[j - 1]) {
//       results.add(Unchanged(text1[i - 1]));
//       i -= 1;
//       j -= 1;
//     }
//     // # In any other case, we go in the direction of the longest common
//     // # subsequence.
//     else if (lcs[i - 1][j] <= lcs[i][j - 1] ) {
//       results.add(Addition(text2[j - 1]));
//       j -= 1;
//     } else {
//       results.add(Removal(text1[i - 1]));
//       i -= 1;
//     }

//   // # Reverse results because we iterated over the texts from the end but
//   // # want the results to be in forward order.
//   return results.split('').reversed;
