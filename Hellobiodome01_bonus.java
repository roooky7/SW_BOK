import java.lang.reflect.Array;
import java.util.Arrays;

public class Hellobiodome01_bonus {
    public static void main(String[] args) {
        String input = "아돌프 찰스 데이나 로망.";
        splitAndPrint(input, 10);
    }

    public static void splitAndPrint(String input, int chunkSize) {
        splitAndPrintHelper(input, chunkSize);
    }

    public static void splitAndPrintHelper(String input, int chunkSize) {
        if (!input.isEmpty()) {
            String chunk = input;
            if (input.length() > chunkSize) {
                chunk = input.substring(0, chunkSize);
            }
            System.out.println(chunk);
            if (input.length() > chunkSize) {
                input = input.substring(chunkSize);
                splitAndPrintHelper(input, chunkSize);
            }
        }
    }
}











