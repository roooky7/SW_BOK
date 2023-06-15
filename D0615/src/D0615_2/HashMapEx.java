package D0615_2;

import java.util.*;
import java.util.Map.Entry;

public class HashMapEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Map<String, Integer> map = new HashMap<>();
		Map<String, Integer> map2 = new Hashtable<>();
		
		
		map.put("신용권", 85);
		map.put("홍길동", 90);
		map.put("남상원", 80);
		map.put("동장군", 75);
		map.put("홍길동", 95);
		System.out.println(map.size());
		System.out.println();
		
		
		String key = "홍길동";
		int value = map.get(key);
		System.out.println(key+value);
		System.out.println();
		
		Set<String> keySet = map.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()) {
			String k = keyIterator.next();
			Integer v = map.get(k);
			System.out.println(k+v);
		}
		System.out.println();
		
		Set<Entry<String, Integer>> entrySet = map.entrySet();
		Iterator<Entry<String, Integer>> entryIterator = entrySet.iterator();
		while(entryIterator.hasNext()) {
			Entry<String, Integer> entry = entryIterator.next();
			String k = entry.getKey();
			Integer v = entry.getValue();
			System.out.println(v+v);
		}
		System.out.println();
		
		
		map.remove("홍길동");
		System.out.println(map.size());
		System.out.println();
		for(Entry<String, Integer>e:map.entrySet()) {
			System.out.println(e.getKey()+e.getValue());
			
		}
	

	}

}
