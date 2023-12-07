import java.util.*;

public class Hellobiodome09 {
    public static void main(String[] args) {
        int height = getUserInput();

        if (height == -1) {
            return;
        }

        drawTree(height);
    }

    public static int getUserInput() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("나무의 높이를 입력하세요 (3~100): ");
        if (scanner.hasNextInt()) {
            int height = scanner.nextInt();
            if (height >= 3 && height <= 100) {
                return height;
            }
        }

        System.out.println("잘못된 입력입니다. 3~100 사이의 숫자를 입력하세요.");
        return -1;
    }

    public static void drawTree(int height) {
        for (int i = 1; i <= height; i += 2) {
            int spaceCount = (height - i) / 2;
            int starCount = i;

            for (int j = 0; j < spaceCount; j++) {
                System.out.print(" ");
            }
            for (int j = 0; j < starCount; j++) {
                System.out.print("*");
            }
            System.out.println();
        }

        int trunkSpace = (height - 1) / 2;
        for (int i = 0; i < trunkSpace; i++) {
            System.out.print(" ");
        }
        System.out.println("|");
    }
}