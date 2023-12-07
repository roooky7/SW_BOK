import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class RoadToBiodome01 {
    public static void main(String[] args) {
        List<Integer> waveNum = getUserInput();

        if (waveNum == null) {
            System.out.println("입력값이 올바르지 않습니다. 0에서 1000까지의 값을 입력해주세요.");
            return;
        }

        int uniqueNum = findUniqueNum(waveNum);

        if (uniqueNum != -1) {
            System.out.println(">>> " + uniqueNum);
        } else {
            System.out.println(">>> 반복되지 않는 숫자가 없습니다.");
        }
    }

    public static List<Integer> getUserInput() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("여러 나무의 파동 숫자를 입력하세요 (0에서 1000까지의 값을 공백으로 구분하여 입력):");
        String input = scanner.nextLine();
        String[] parts = input.split(" ");
        List<Integer> nums = new ArrayList<>();

        for (String part : parts) {
            try {
                int num = Integer.parseInt(part);
                if (num >= 0 && num <= 1000) {
                    nums.add(num);
                } else {
                    return null;
                }
            } catch (NumberFormatException e) {
                return null;
            }
        }

        return nums;
    }

    public static int findUniqueNum(List<Integer> waveNum) {
        for (int i = 0; i < waveNum.size(); i++) {
            int currentNum = waveNum.get(i);
            boolean isUnique = true;

            for (int j = 0; j < waveNum.size(); j++) {
                if (i != j && currentNum == waveNum.get(j)) {
                    isUnique = false;
                    break;
                }
            }

            if (isUnique) {
                return currentNum;
            }
        }

        return -1;
    }
}