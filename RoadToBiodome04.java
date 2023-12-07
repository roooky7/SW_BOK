import java.util.Arrays;

public class RoadToBiodome04 {
    public static void main(String[] args) {
        int[] energyConsumption = {5, 3, 8, 9, 4};
        Arrays.sort(energyConsumption);

        double average = calculateAverage(energyConsumption);
        double median = calculateMedian(energyConsumption);

        System.out.println("평균값 : " + average + ", 중앙값 : " + median);
    }

    public static double calculateAverage(int[] arr) {
        int sum = 0;
        for (int value : arr) {
            sum += value;
        }
        return (double) sum / arr.length;
    }

    public static double calculateMedian(int[] arr) {
        int length = arr.length;
        if (length % 2 == 0) {
            int middle1 = arr[length / 2 - 1];
            int middle2 = arr[length / 2];
            return (double) (middle1 + middle2) / 2;
        } else {
            return arr[length / 2];
        }
    }
}