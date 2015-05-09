/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessLayer;

import Model.User;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Win8.1 VS10 X64
 */
public class UserDALTest {
    
    public UserDALTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of Select method, of class UserDAL.
     */
    @Test
    public void testSelect() {
        System.out.println("Select");
        String userName = "wingadium1";
        UserDAL instance = new UserDAL();
        User expResult = new User(userName, "longnhung");
        User result = instance.Select(userName);
        assertEquals(expResult.getName(), result.getName());
        assertEquals(expResult.getPassword(), result.getPassword());
        result = instance.Select("");
        assertNull(result);
        result = instance.Select("         ");
        assertNull(result);
        
        
    }

    /**
     * Test of Insert method, of class UserDAL.
     */
    @Test
    public void testInsert() {
        System.out.println("Insert");
        String name = "wingadium1";
        String password = "123123123";
        UserDAL instance = new UserDAL();
        User expResult = new User(name+"2", password);
        User result = instance.Insert(name, password);
        assertNull(result);
        
        result = instance.Insert(name+"2", password);
        assertEquals(expResult.getName(), result.getName());
        assertEquals(expResult.getPassword(), result.getPassword());
        
        instance.Delete_User(name+"2");
    }

   
    /**
     * Test of Update_User method, of class UserDAL.
     */
    @Test
    public void testUpdate_User() {
        System.out.println("Update_User");
        String name = "wingadium1";
        String password = "longnhung";
        UserDAL instance = new UserDAL();
        User result = instance.Update_User(name, password);
        assertEquals(password, result.getPassword());
        
        result = instance.Update_User("xxxxxxxxxxxx", password);
        assertNull(result);
    }

    /**
     * Test of Select_Search_User method, of class UserDAL.
     */
    @Test
    public void testSelect_Search_User() {
        System.out.println("Select_Search_User");
        String name = "!@#$%^&*(";
        UserDAL instance = new UserDAL();
        ArrayList<User> result = instance.Select_Search_User(name);
        assertTrue(result.isEmpty());
        
        
    }

    /**
     * Test of Delete_User method, of class UserDAL.
     */
    @Test
    public void testDelete_User() {
        System.out.println("Delete_User");
        String name = "BCK";
        UserDAL instance = new UserDAL();
        User expResult = null;
        int result = instance.Delete_User("");
        assertEquals(0, result);
        
        result = instance.Delete_User(name);
        assertEquals(1, result);
        
        instance.Insert(name, name);
    }

    /**
     * Test of SelectLogIn method, of class UserDAL.
     */
    @Test
    public void testSelectLogIn() {
        System.out.println("SelectLogIn");
        String userName = "wingadium";
        String passWord = "longnhung";
        UserDAL instance = new UserDAL();
        User result = instance.SelectLogIn(userName, passWord);
        assertNotNull(result);
        
        result = instance.SelectLogIn("", passWord);
        assertNull(result);
    }

    /**
     * Test of isValid method, of class UserDAL.
     */
    @Test
    public void testIsValid() {
        System.out.println("isValid");
        User user = new User("wingadium", "longnhung");
        UserDAL instance = new UserDAL();
        boolean result = instance.isValid(user);
        assertTrue(result);
        
        user.setName("");
        result = instance.isValid(user);
        assertTrue(!result);
    }
    
}
