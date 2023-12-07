import java.util.Scanner;

public class RoadToBiodome02 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("문장을 입력하세요:");
        String input = scanner.nextLine();

        if (input.trim().isEmpty()) {
            System.out.println("입력된 메시지가 올바르지 않습니다. 다시 한번 확인해주세요.");
        } else {
            String reversed = reverseString(input);
            System.out.println(">>> " + reversed);
        }
    }

    public static String reverseString(String input) {
        int length = input.length();
        char[] reversedChars = new char[length];

        for (int i = 0; i < length; i++) {
            reversedChars[i] = input.charAt(length - i - 1);
        }

        return new String(reversedChars);
    }
}





