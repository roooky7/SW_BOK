import java.util.Arrays;

public class RoadToBiodome05 {
    public static void main(String[] args) {
        int[] heights1 = {11, 69, 41, 3, 10, 65, 7, 8};
        int[] heights2 = {30, 5, 79, 57, 1, 13, 28, 88, 18, 24};

        if (!isValidHeightArray(heights1) || !isValidHeightArray(heights2)) {
            System.out.println("잘못된 사용자 입력입니다.");
            return;
        }

        int[] mergedArray = mergeAndSort(heights1, heights2);

        System.out.println(Arrays.toString(mergedArray));
    }

    public static int[] mergeAndSort(int[] arr1, int[] arr2) {
        int[] mergedArray = new int[arr1.length + arr2.length];
        int i = 0, j = 0, k = 0;

        while (i < arr1.length && j < arr2.length) {
            if (arr1[i] < arr2[j]) {
                mergedArray[k++] = arr1[i++];
            } else {
                mergedArray[k++] = arr2[j++];
            }
        }

        while (i < arr1.length) {
            mergedArray[k++] = arr1[i++];
        }

        while (j < arr2.length) {
            mergedArray[k++] = arr2[j++];
        }

        return mergedArray;
    }

    public static boolean isValidHeightArray(int[] arr) {
        for (int height : arr) {
            if (height < 0 || height > 1000) {
                return false;
            }
        }
        return true;
    }
}