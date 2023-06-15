package D0615_2;

import java.util.*;

public class HashSetEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Set<Member> set = new HashSet<Member>();
		
		set.add(new Member("길동", 30));
		set.add(new Member("길동", 30));
		
		System.out.println(set.size());

	}

}
