import java.util.*;
import java.util.stream.Stream;

public class Day4x2 {
    public static void main(String[] args) {
        Stream<String> x = Stream.of(Input.INPUT.split("\n")).filter(s -> {
            String[] split = s.split(" ");
            Set<String> set = new HashSet<>();
            Collections.addAll(set, split);
            Set<String> sorted = new HashSet<>();
            set.forEach(s1 -> sorted.add(sortString(s1)));
            return split.length == set.size() && sorted.size() == split.length;
        });
        System.out.println(x.count());
    }

    public static String sortString(String s) {
        char[] chars = s.toCharArray();
        Arrays.sort(chars);
        return new String(chars);
    }
}
