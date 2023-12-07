public class Hellobiodome01 {
    public static void main(String[] args) {
        String name = args[0];

        if(name.length() <= 1) {
            System.out.println("한 글자 이상 입력해주세요.");
            System.exit(0);
        }
        else{
                System.out.println(name + "안녕하세요");
        }
    }
}
