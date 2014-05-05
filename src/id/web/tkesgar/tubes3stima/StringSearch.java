package id.web.tkesgar.tubes3stima;

import java.util.HashMap;
import java.util.Map;

public class StringSearch {
	
	public enum Algorithm {
		BoyerMoore,
		JavaIndexOf,
		KMP,
		Naive
	}

	public static int searchJavaBoyerMoore(CharSequence word, CharSequence text) {
		// TODO implement
		return searchJavaIndexOf(word, text);
	}
	
	public static int searchJavaIndexOf(CharSequence word, CharSequence text) {
		return text.toString().indexOf(word.toString());
	}

	public static int searchJavaKMP(CharSequence word, CharSequence text) {
		// TODO implement
		return searchJavaIndexOf(word, text);
	}
	
	public static int searchJavaNaive(CharSequence word, CharSequence text) {
		String wordString = word.toString();
		String textString = text.toString();
		for (int i = 0; i < textString.length(); i++) {
			for (int j = i; j < textString.length(); j++) {
				if (wordString.equals(textString.substring(i, j))) {
					return i;
				}
			}
		}
		return -1;
	}
	
	public static int search(Algorithm algorithm, CharSequence word, CharSequence text) {
		switch (algorithm) {
		case BoyerMoore:
			return searchJavaBoyerMoore(word, text);
		case JavaIndexOf:
			return searchJavaIndexOf(word, text);
		case KMP:
			return searchJavaKMP(word, text);
		case Naive:
			return searchJavaNaive(word, text);
		default:
			return searchJavaIndexOf(word, text);
		}
	}
	
	public static int searchIgnoreCase(Algorithm algorithm, CharSequence word, CharSequence text) {
		String wordString = word.toString().toLowerCase();
		String textString = text.toString().toLowerCase();
		return search(algorithm, wordString, textString);
	}
	
	public static void main(String[] args) {
		Map<String, String> testcases = new HashMap<String, String>();
		testcases.put("fox", "The quick brown fox jumps over the lazy dog.");
		testcases.put("atgc", "gcatcatgggagtcggatgcgacat");
		testcases.put("atgc", "GcAtCaTgGgAgTcGgAtGcGaCaT");
		for (Map.Entry<String, String> testcase : testcases.entrySet()) {
			String word = testcase.getKey();
			String text = testcase.getValue();
			System.out.printf("Testing with word=%s, text=%s:\n", word, text);
			for (Algorithm algorithm : Algorithm.values()) {
				int trueValue = search(algorithm, word, text);
				int testValue = search(algorithm, word, text);
				if (trueValue == testValue) {
					System.out.printf("Using %s, true=%d, test=%d, success\n", algorithm, trueValue, testValue);
				} else {
					System.out.printf("Using %s, true=%d, test=%d, failed\n", algorithm, trueValue, testValue);
					return;
				}
			}
			System.out.printf("Testing ignoring case with word=%s, text=%s:\n", word, text);
			for (Algorithm algorithm : Algorithm.values()) {
				int trueValue = searchIgnoreCase(Algorithm.JavaIndexOf, word, text);
				int testValue = searchIgnoreCase(algorithm, word, text);
				if (trueValue == testValue) {
					System.out.printf("Using %s, true=%d, test=%d, success\n", algorithm, trueValue, testValue);
				} else {
					System.out.printf("Using %s, true=%d, test=%d, failed\n", algorithm, trueValue, testValue);
					return;
				}
			}
		}
	}

}
