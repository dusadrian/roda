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
import ro.roda.CmsPageType;
import ro.roda.CmsPageTypeDataOnDemand;
import ro.roda.CmsPageTypeIntegrationTest;

privileged aspect CmsPageTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CmsPageTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CmsPageTypeIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CmsPageTypeIntegrationTest: @Transactional;
    
    @Autowired
    private CmsPageTypeDataOnDemand CmsPageTypeIntegrationTest.dod;
    
    @Test
    public void CmsPageTypeIntegrationTest.testCountCmsPageTypes() {
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to initialize correctly", dod.getRandomCmsPageType());
        long count = CmsPageType.countCmsPageTypes();
        Assert.assertTrue("Counter for 'CmsPageType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CmsPageTypeIntegrationTest.testFindCmsPageType() {
        CmsPageType obj = dod.getRandomCmsPageType();
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to provide an identifier", id);
        obj = CmsPageType.findCmsPageType(id);
        Assert.assertNotNull("Find method for 'CmsPageType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'CmsPageType' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CmsPageTypeIntegrationTest.testFindAllCmsPageTypes() {
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to initialize correctly", dod.getRandomCmsPageType());
        long count = CmsPageType.countCmsPageTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'CmsPageType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<CmsPageType> result = CmsPageType.findAllCmsPageTypes();
        Assert.assertNotNull("Find all method for 'CmsPageType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'CmsPageType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CmsPageTypeIntegrationTest.testFindCmsPageTypeEntries() {
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to initialize correctly", dod.getRandomCmsPageType());
        long count = CmsPageType.countCmsPageTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<CmsPageType> result = CmsPageType.findCmsPageTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'CmsPageType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'CmsPageType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CmsPageTypeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to initialize correctly", dod.getRandomCmsPageType());
        CmsPageType obj = dod.getNewTransientCmsPageType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'CmsPageType' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'CmsPageType' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CmsPageTypeIntegrationTest.testRemove() {
        CmsPageType obj = dod.getRandomCmsPageType();
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CmsPageType' failed to provide an identifier", id);
        obj = CmsPageType.findCmsPageType(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'CmsPageType' with identifier '" + id + "'", CmsPageType.findCmsPageType(id));
    }
    
}