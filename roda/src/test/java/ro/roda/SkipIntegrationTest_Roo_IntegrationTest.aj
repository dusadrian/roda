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
import ro.roda.SkipDataOnDemand;
import ro.roda.SkipIntegrationTest;
import ro.roda.service.SkipService;

privileged aspect SkipIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SkipIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SkipIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SkipIntegrationTest: @Transactional;
    
    @Autowired
    SkipDataOnDemand SkipIntegrationTest.dod;
    
    @Autowired
    SkipService SkipIntegrationTest.skipService;
    
    @Test
    public void SkipIntegrationTest.testCountAllSkips() {
        Assert.assertNotNull("Data on demand for 'Skip' failed to initialize correctly", dod.getRandomSkip());
        long count = skipService.countAllSkips();
        Assert.assertTrue("Counter for 'Skip' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SkipIntegrationTest.testFindSkip() {
        Skip obj = dod.getRandomSkip();
        Assert.assertNotNull("Data on demand for 'Skip' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Skip' failed to provide an identifier", id);
        obj = skipService.findSkip(id);
        Assert.assertNotNull("Find method for 'Skip' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Skip' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SkipIntegrationTest.testFindAllSkips() {
        Assert.assertNotNull("Data on demand for 'Skip' failed to initialize correctly", dod.getRandomSkip());
        long count = skipService.countAllSkips();
        Assert.assertTrue("Too expensive to perform a find all test for 'Skip', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Skip> result = skipService.findAllSkips();
        Assert.assertNotNull("Find all method for 'Skip' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Skip' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SkipIntegrationTest.testFindSkipEntries() {
        Assert.assertNotNull("Data on demand for 'Skip' failed to initialize correctly", dod.getRandomSkip());
        long count = skipService.countAllSkips();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Skip> result = skipService.findSkipEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Skip' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Skip' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SkipIntegrationTest.testSaveSkip() {
        Assert.assertNotNull("Data on demand for 'Skip' failed to initialize correctly", dod.getRandomSkip());
        Skip obj = dod.getNewTransientSkip(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Skip' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Skip' identifier to be null", obj.getId());
        skipService.saveSkip(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'Skip' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SkipIntegrationTest.testDeleteSkip() {
        Skip obj = dod.getRandomSkip();
        Assert.assertNotNull("Data on demand for 'Skip' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Skip' failed to provide an identifier", id);
        obj = skipService.findSkip(id);
        skipService.deleteSkip(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Skip' with identifier '" + id + "'", skipService.findSkip(id));
    }
    
}
