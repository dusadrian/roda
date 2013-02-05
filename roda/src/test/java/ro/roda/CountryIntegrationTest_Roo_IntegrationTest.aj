// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.Country;
import ro.roda.CountryDataOnDemand;
import ro.roda.CountryIntegrationTest;

privileged aspect CountryIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CountryIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CountryIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CountryIntegrationTest: @Transactional;
    
    @Autowired
    private CountryDataOnDemand CountryIntegrationTest.dod;
    
    @Test
    public void CountryIntegrationTest.testCountCountrys() {
        Assert.assertNotNull("Data on demand for 'Country' failed to initialize correctly", dod.getRandomCountry());
        long count = Country.countCountrys();
        Assert.assertTrue("Counter for 'Country' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CountryIntegrationTest.testFindCountry() {
        Country obj = dod.getRandomCountry();
        Assert.assertNotNull("Data on demand for 'Country' failed to initialize correctly", obj);
        String id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Country' failed to provide an identifier", id);
        obj = Country.findCountry(id);
        Assert.assertNotNull("Find method for 'Country' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Country' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CountryIntegrationTest.testFindAllCountrys() {
        Assert.assertNotNull("Data on demand for 'Country' failed to initialize correctly", dod.getRandomCountry());
        long count = Country.countCountrys();
        Assert.assertTrue("Too expensive to perform a find all test for 'Country', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Country> result = Country.findAllCountrys();
        Assert.assertNotNull("Find all method for 'Country' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Country' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CountryIntegrationTest.testFindCountryEntries() {
        Assert.assertNotNull("Data on demand for 'Country' failed to initialize correctly", dod.getRandomCountry());
        long count = Country.countCountrys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Country> result = Country.findCountryEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Country' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Country' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CountryIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Country' failed to initialize correctly", dod.getRandomCountry());
        Country obj = dod.getNewTransientCountry(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Country' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Country' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Country' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CountryIntegrationTest.testRemove() {
        Country obj = dod.getRandomCountry();
        Assert.assertNotNull("Data on demand for 'Country' failed to initialize correctly", obj);
        String id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Country' failed to provide an identifier", id);
        obj = Country.findCountry(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Country' with identifier '" + id + "'", Country.findCountry(id));
    }
    
}
