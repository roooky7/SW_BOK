package D0615_3;

import java.util.*;

public class TreeSetEx {
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		TreeSet<Integer> scores = new TreeSet<>();
		
		scores.add(87);
		scores.add(98);
		scores.add(75);
		scores.add(59);
		scores.add(80);
		scores.add(74);
		
		for(Integer s:scores) {
			System.out.println(s);
		}
		System.out.println("\n");
		
		System.out.println(scores.first());
		System.out.println(scores.last());
		System.out.println(scores.lower(95));
		System.out.println(scores.higher(95));
		System.out.println(scores.floor(95));
		System.out.println(scores.ceiling(85));
		
		NavigableSet<Integer> DS = scores.descendingSet();
		for(Integer s : DS) {
			System.out.println(s);
		}
		System.out.println("\n");
		
		
		NavigableSet<Integer> rangeSet = scores.tailSet(80,true);
		for(Integer s : rangeSet) {
			System.out.println(s);
		}
		System.out.println("\n");
		
		
		
		rangeSet = scores.subSet(80, true, 90, false);
		for(Integer s : rangeSet) {
			System.out.println(s);
		}

	}

}
