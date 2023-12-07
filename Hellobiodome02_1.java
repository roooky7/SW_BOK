public class Hellobiodome02_1 {
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("태양광, 풍력, 지열 에너지 생산량을 각각 입력하세요.");
            return;
        }

        try {
            int solarEnergy = Integer.parseInt(args[0]);
            int windEnergy = Integer.parseInt(args[1]);
            int geothermalEnergy = Integer.parseInt(args[2]);

            if (solarEnergy < 0 || windEnergy < 0 || geothermalEnergy < 0 ||
                    solarEnergy > 30000 || windEnergy > 30000 || geothermalEnergy > 30000) {
                System.out.println("에너지 생산량은 0 이상 30,000 이하이어야 합니다.");
            } else {
                int totalEnergy = solarEnergy + windEnergy + geothermalEnergy;
                System.out.println("총 에너지 생산량: " + totalEnergy);
            }
        } catch (NumberFormatException e) {
            System.out.println("올바른 숫자를 입력하세요.");
        }
    }
}