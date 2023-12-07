import java.util.Scanner;

public class Hellobiodome06 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("두 개의 유전자 코드를 입력하세여.");
        String gene1 = sc.next();
        String gene2 = sc.next();

        if(checkGene(gene1,gene2)){
            System.out.println("유전자 일치");
        } else {
            System.out.println("유전자 불일치");
        }
    }
    public static boolean checkGene(String gene1,String gene2) {
     if(gene1.length() != gene2.length()){
         return false;
     }

     int i = 0;
     while (i < gene1.length()){
         if (gene1.charAt(i) != gene2.charAt(i)) {
             return false;
         }
         i++;
     }
     return true;
    }
}
