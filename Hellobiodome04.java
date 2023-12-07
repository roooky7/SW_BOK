public class Hellobiodome04 {
    public static void main(String[] args) {
        double temp = 0;
        double humidity = 0;
        double oxLevel = 0;

        if (args.length != 3) {
            System.out.println("입력된 값이 올바르지 않습니다. [온도][습도][산소농도] 순서대로 숫자 값을 입력해주세요.");
            return;
        }

        try {
            temp = Double.parseDouble(args[0]);
            humidity = Double.parseDouble(args[1]);
            oxLevel = Double.parseDouble(args[2]);

            if (isStable(temp, humidity, oxLevel)) {
                System.out.println("생명의 나무는 안정적인 상태입니다 :)");
            } else {
                if (temp < 10 || temp >= 27.5) {
                    System.out.println("온도값이 정상 범위를 벗어났습니다. 확인이 필요합니다.");
                }
                if (humidity <= 40 || humidity >= 60) {
                    System.out.println("습도값이 정상 범위를 벗어났습니다. 확인이 필요합니다.");
                }
                if (oxLevel < 19.5 || oxLevel > 23.5) {
                    System.out.println("산소 농도가 정상 범위를 벗어났습니다. 확인이 필요합니다.");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("입력된 값이 올바르지 않습니다. [온도][습도][산소농도] 순서대로 숫자 값을 입력해주세요.");
        }
    }

    public static boolean isStable(double temp, double humidity, double oxLevel) {
        return (temp >= 10 && temp < 27.5) &&
                (humidity > 40 && humidity < 60) &&
                (oxLevel >= 19.5 && oxLevel <= 23.5);
    }
}