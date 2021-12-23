import 'package:longy/controller/lcscontroller.dart';
import 'package:flutter/material.dart';

List<String> calculateDiff(String string1 , String string2) {
  return diff(string1 , string2);
}

List<String> diff(text1, text2) {
  // """Computes the optimal diff of the two given inputs.

  // The result is a list where all elements are Removals, Additions or
  // Unchanged elements.
  // """
  var lcs = compute_lcs_len(text1, text2);
  var results = <String>[];

  var i = text1.length;
  var j = text2.length;

  // # We iterate until we reach the end of both texts.
  while (i != 0 ||  j != 0) {
    // # If we reached the end of one of text1 (i == 0) or text2 (j == 0),
    // # then we just need to print the remaining additions and removals.
    if (i == 0) {
      results.add("+ ${text2[j - 1]}".replaceAll('\n' , '\\n'));
      j -= 1;
    } else if (j== 0) {
      results.add("- ${text1[i - 1]}".replaceAll('\n' , '\\n'));
      i -= 1;
    }
    // # Otherwise there's still parts of text1 and text2 left. If the
    // # currently considered parts are equal, then we found an unchanged
    // # part which belongs to the longest common subsequence.
    else if (text1[i - 1] == text2[j - 1]) {
      results.add("= ${text1[i - 1]}".replaceAll('\n','\\n'));
      i -= 1;
      j -= 1;
    }
    // # In any other case, we go in the direction of the longest common
    // # subsequence.
    else if (lcs[i - 1][j] <= lcs[i][j - 1] ) {
      results.add("+ ${text2[j - 1]}".replaceAll('\n' , '\\n'));
      j -= 1;
    } else {
      results.add("- ${text1[i - 1]}".replaceAll('\n' , '\\n'));
      i -= 1;
    }

    // # Reverse results because we iterated over the texts from the end but
    // # want the results to be in forward order.
    // return results.split('').reversed;
  }
  
  return combineLetters(results.reversed.toList());
}

List<String> combineLetters(List<String> letterdiff) {
  List<String> newDiff = [];
  var previous = "=";
  var element="";
  for(int i=0; i< letterdiff.length ; i++) {
    debugPrint(letterdiff[i]);
    debugPrint(previous);
    debugPrint(element);
    if (letterdiff[i][0] == previous[0]) {
      element = element + letterdiff[i].substring(2);
    } else {
      newDiff.add(element);
      element = "";
    }
    previous = letterdiff[i];
    if (element == "") {
      element = previous;
    } 
  }
  newDiff.add(element);
  debugPrint(newDiff.join(''));
  return newDiff;
}
