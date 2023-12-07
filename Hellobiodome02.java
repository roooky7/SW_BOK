import java.util.Scanner;

public class Hellobiodome02 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int solarEnergy, windEnergy, geothermalEnergy;


        System.out.print("태양광 에너지 생산량을 입력하세요: ");
        String solarInput = scanner.nextLine();


        System.out.print("풍력 에너지 생산량을 입력하세요: ");
        String windInput = scanner.nextLine();


        System.out.print("지열 에너지 생산량을 입력하세요: ");
        String geothermalInput = scanner.nextLine();

        try {
            solarEnergy = Integer.parseInt(solarInput);
            windEnergy = Integer.parseInt(windInput);
            geothermalEnergy = Integer.parseInt(geothermalInput);

            if (solarEnergy < 0 || windEnergy < 0 || geothermalEnergy < 0 ||
                    solarEnergy > 30000 || windEnergy > 30000 || geothermalEnergy > 30000) {
                System.out.println("각 에너지 생산량은 0 이상 30,000 이하이어야 합니다.");
            } else {
                int totalEnergy = solarEnergy + windEnergy + geothermalEnergy;
                System.out.println("총 에너지 생산량: " + totalEnergy);
            }
        } catch (NumberFormatException e) {
            System.out.println("올바른 숫자를 입력하세요.");
        }

        scanner.close();
    }
}
