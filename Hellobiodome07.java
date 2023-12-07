import java.util.Scanner;

public class Hellobiodome07 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("DNA 염기서열을 입력하세요:");
        String input = scanner.nextLine();

        if (input.trim().isEmpty()) {
            System.out.println("염기서열이 입력되지 않았습니다.");
            return;
        }

        String compressed = compressDNA(input);
        System.out.println(compressed);
    }

    public static String compressDNA(String input) {
        input = input.replaceAll("\\s", "").toUpperCase();
        if (!input.matches("^[CYJEH]*$")) {
            System.out.println("염기서열은 C, Y, J, E, H 다섯가지로만 입력됩니다. 확인하고 다시 입력해주세요.");
            System.exit(0);
        }

        String result = "";
        char currentChar = input.charAt(0);
        int count = 1;

        for (int i = 1; i < input.length(); i++) {
            char charAtI = input.charAt(i);

            if (charAtI == currentChar) {
                count++;
            } else {
                result += currentChar;
                if (count > 1) {
                    result += count;
                }
                currentChar = charAtI;
                count = 1;
            }
        }

        result += currentChar;
        if (count > 1) {
            result += count;
        }

        return result;
    }
}