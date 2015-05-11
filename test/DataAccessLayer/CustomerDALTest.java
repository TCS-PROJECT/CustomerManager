/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessLayer;

import Model.Customer;
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
public class CustomerDALTest {
    
    public CustomerDALTest() {
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
     * Test of SearchbyName method, of class CustomerDAL.
     */
    @Test
    public void testSearchbyName() {
        System.out.println("SearchbyName");
        String userName = "erwrwerwerrwrwr";
        CustomerDAL instance = new CustomerDAL();
        ArrayList<Customer> result = instance.SearchbyName(userName);
        assertTrue(result.isEmpty());
    }

    /**
     * Test of SearchbyPrice method, of class CustomerDAL.
     */
    @Test
    public void testSearchbyDOB() {
        System.out.println("SearchbyDOB");
        String dob = "erwrwerwerrwrwr";
        CustomerDAL instance = new CustomerDAL();
        ArrayList<Customer> result = instance.SearchbyDob(dob);
        assertTrue(result.isEmpty());
    }

    /**
     * Test of SearchbyBoth method, of class CustomerDAL.
     */
    @Test
    public void testSearchbyBoth() {
        System.out.println("SearchbyBoth");
        String userName = "eweqeqeqweqe";
        String dob = "ewqeqeqweqeqewqe";
        CustomerDAL instance = new CustomerDAL();
        ArrayList<Customer> result = instance.SearchbyBoth(userName, dob);
        assertTrue(result.isEmpty());
    
    }

    /**
     * Test of Select method, of class CustomerDAL.
     */
    @Test
    public void testSelect() {
        System.out.println("Select");
        String Id = "";
        CustomerDAL instance = new CustomerDAL();
        Customer result = instance.Select(Id);
        assertNull(result);
        
        result = instance.Select("2");
        assertEquals("2", result.getId());
        
        
    }


   
}
