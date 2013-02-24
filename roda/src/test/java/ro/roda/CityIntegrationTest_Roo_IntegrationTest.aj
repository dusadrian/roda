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
import ro.roda.CityDataOnDemand;
import ro.roda.CityIntegrationTest;
import ro.roda.service.CityService;

privileged aspect CityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CityIntegrationTest: @Transactional;
    
    @Autowired
    CityDataOnDemand CityIntegrationTest.dod;
    
    @Autowired
    CityService CityIntegrationTest.cityService;
    
    @Test
    public void CityIntegrationTest.testCountAllCitys() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        long count = cityService.countAllCitys();
        Assert.assertTrue("Counter for 'City' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CityIntegrationTest.testFindCity() {
        City obj = dod.getRandomCity();
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'City' failed to provide an identifier", id);
        obj = cityService.findCity(id);
        Assert.assertNotNull("Find method for 'City' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'City' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CityIntegrationTest.testFindAllCitys() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        long count = cityService.countAllCitys();
        Assert.assertTrue("Too expensive to perform a find all test for 'City', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<City> result = cityService.findAllCitys();
        Assert.assertNotNull("Find all method for 'City' illegally returned null", result);
        Assert.assertTrue("Find all method for 'City' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CityIntegrationTest.testFindCityEntries() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        long count = cityService.countAllCitys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<City> result = cityService.findCityEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'City' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'City' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CityIntegrationTest.testSaveCity() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        City obj = dod.getNewTransientCity(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'City' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'City' identifier to be null", obj.getId());
        cityService.saveCity(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'City' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CityIntegrationTest.testDeleteCity() {
        City obj = dod.getRandomCity();
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'City' failed to provide an identifier", id);
        obj = cityService.findCity(id);
        cityService.deleteCity(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'City' with identifier '" + id + "'", cityService.findCity(id));
    }
    
}
