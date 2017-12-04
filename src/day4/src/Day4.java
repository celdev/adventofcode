import java.math.BigInteger;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Day4 {

    public static void main(String[] args) {
        Stream<String> x = Stream.of(Input.INPUT.split("\n")).filter(s -> {
            String[] split = s.split(" ");
            Set<String> set = new HashSet<>();
            Collections.addAll(set, split);
            return split.length == set.size();
        });
        System.out.println(x.count());
    }

}
