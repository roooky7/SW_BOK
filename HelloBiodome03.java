public class HelloBiodome03 {
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("입력된 값이 올바르지 않습니다. [온도][습도][산소농도] 순서대로 숫자 값을 입력해주세요.");
            return;
        }

        try {
            // 온도
            double temperature = Double.parseDouble(args[0]);
            // 습도
            double humidity = Double.parseDouble(args[1]);
            // 산소
            double oxygenLevel = Double.parseDouble(args[2]);

            // 건강지수 H 계산
            double H = calculateHealthIndex(temperature, humidity, oxygenLevel);

            // H 값을 소수점 셋째 자리에서 반올림하여 출력
//            H = roundTo3DecimalPlaces(H);

            System.out.println("생명지수 H = " + H);
        } catch (NumberFormatException e) {
            System.out.println("입력된 값이 올바르지 않습니다. [온도][습도][산소농도] 순서대로 숫자 값을 입력해주세요.");
        }
    }

    public static double calculateHealthIndex(double temperature, double humidity, double oxygenLevel) {
        // 제곱근
        double squareRootHumidity = squareRoot(humidity);
        double absoluteValue = absoluteValue(squareRootHumidity, temperature);
        double H = 0.415 * absoluteValue + (oxygenLevel / Math.pow(Math.PI, 2));
        return H;
    }

    public static double squareRoot(double value) {
        return Math.sqrt(value);
    }

    public static double absoluteValue(double a, double b) {
        double result = a - b;
        return Math.abs(result);
    }

    // 반올림
    public static double roundTo3DecimalPlaces(double value) {
        int scale = (int) Math.pow(10, 3);
        return (double) Math.round(value * scale) / scale;
    }

}