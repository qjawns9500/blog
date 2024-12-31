import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbTest {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/test1";
    private static final String USER = "root";  // DB 사용자명
    private static final String PASSWORD = "182074"; //DB 사용자 비밀번호

    @Test
    public void testConnection() throws Exception {
        Class.forName(DRIVER);


        try(Connection con = DriverManager.getConnection(URL,USER,PASSWORD)) {
            System.out.println("DB커넥션 성공");
            System.out.println(con);
        }catch (Exception e){
            System.out.println("에러발생");
            e.printStackTrace();
        }
    }

}
