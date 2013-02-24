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
import ro.roda.ScaleDataOnDemand;
import ro.roda.ScaleIntegrationTest;
import ro.roda.service.ScaleService;

privileged aspect ScaleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ScaleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ScaleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ScaleIntegrationTest: @Transactional;
    
    @Autowired
    ScaleDataOnDemand ScaleIntegrationTest.dod;
    
    @Autowired
    ScaleService ScaleIntegrationTest.scaleService;
    
    @Test
    public void ScaleIntegrationTest.testCountAllScales() {
        Assert.assertNotNull("Data on demand for 'Scale' failed to initialize correctly", dod.getRandomScale());
        long count = scaleService.countAllScales();
        Assert.assertTrue("Counter for 'Scale' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ScaleIntegrationTest.testFindScale() {
        Scale obj = dod.getRandomScale();
        Assert.assertNotNull("Data on demand for 'Scale' failed to initialize correctly", obj);
        Long id = obj.getItemId();
        Assert.assertNotNull("Data on demand for 'Scale' failed to provide an identifier", id);
        obj = scaleService.findScale(id);
        Assert.assertNotNull("Find method for 'Scale' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Scale' returned the incorrect identifier", id, obj.getItemId());
    }
    
    @Test
    public void ScaleIntegrationTest.testFindAllScales() {
        Assert.assertNotNull("Data on demand for 'Scale' failed to initialize correctly", dod.getRandomScale());
        long count = scaleService.countAllScales();
        Assert.assertTrue("Too expensive to perform a find all test for 'Scale', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Scale> result = scaleService.findAllScales();
        Assert.assertNotNull("Find all method for 'Scale' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Scale' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ScaleIntegrationTest.testFindScaleEntries() {
        Assert.assertNotNull("Data on demand for 'Scale' failed to initialize correctly", dod.getRandomScale());
        long count = scaleService.countAllScales();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Scale> result = scaleService.findScaleEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Scale' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Scale' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ScaleIntegrationTest.testSaveScale() {
        Assert.assertNotNull("Data on demand for 'Scale' failed to initialize correctly", dod.getRandomScale());
        Scale obj = dod.getNewTransientScale(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Scale' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Scale' identifier to be null", obj.getItemId());
        scaleService.saveScale(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'Scale' identifier to no longer be null", obj.getItemId());
    }
    
    @Test
    public void ScaleIntegrationTest.testDeleteScale() {
        Scale obj = dod.getRandomScale();
        Assert.assertNotNull("Data on demand for 'Scale' failed to initialize correctly", obj);
        Long id = obj.getItemId();
        Assert.assertNotNull("Data on demand for 'Scale' failed to provide an identifier", id);
        obj = scaleService.findScale(id);
        scaleService.deleteScale(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Scale' with identifier '" + id + "'", scaleService.findScale(id));
    }
    
}
