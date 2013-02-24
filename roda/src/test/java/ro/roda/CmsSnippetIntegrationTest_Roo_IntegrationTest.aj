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
import ro.roda.CmsSnippetDataOnDemand;
import ro.roda.CmsSnippetIntegrationTest;
import ro.roda.service.CmsSnippetService;

privileged aspect CmsSnippetIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CmsSnippetIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CmsSnippetIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CmsSnippetIntegrationTest: @Transactional;
    
    @Autowired
    CmsSnippetDataOnDemand CmsSnippetIntegrationTest.dod;
    
    @Autowired
    CmsSnippetService CmsSnippetIntegrationTest.cmsSnippetService;
    
    @Test
    public void CmsSnippetIntegrationTest.testCountAllCmsSnippets() {
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to initialize correctly", dod.getRandomCmsSnippet());
        long count = cmsSnippetService.countAllCmsSnippets();
        Assert.assertTrue("Counter for 'CmsSnippet' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CmsSnippetIntegrationTest.testFindCmsSnippet() {
        CmsSnippet obj = dod.getRandomCmsSnippet();
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to provide an identifier", id);
        obj = cmsSnippetService.findCmsSnippet(id);
        Assert.assertNotNull("Find method for 'CmsSnippet' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'CmsSnippet' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CmsSnippetIntegrationTest.testFindAllCmsSnippets() {
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to initialize correctly", dod.getRandomCmsSnippet());
        long count = cmsSnippetService.countAllCmsSnippets();
        Assert.assertTrue("Too expensive to perform a find all test for 'CmsSnippet', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<CmsSnippet> result = cmsSnippetService.findAllCmsSnippets();
        Assert.assertNotNull("Find all method for 'CmsSnippet' illegally returned null", result);
        Assert.assertTrue("Find all method for 'CmsSnippet' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CmsSnippetIntegrationTest.testFindCmsSnippetEntries() {
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to initialize correctly", dod.getRandomCmsSnippet());
        long count = cmsSnippetService.countAllCmsSnippets();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<CmsSnippet> result = cmsSnippetService.findCmsSnippetEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'CmsSnippet' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'CmsSnippet' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CmsSnippetIntegrationTest.testSaveCmsSnippet() {
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to initialize correctly", dod.getRandomCmsSnippet());
        CmsSnippet obj = dod.getNewTransientCmsSnippet(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'CmsSnippet' identifier to be null", obj.getId());
        cmsSnippetService.saveCmsSnippet(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'CmsSnippet' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CmsSnippetIntegrationTest.testDeleteCmsSnippet() {
        CmsSnippet obj = dod.getRandomCmsSnippet();
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CmsSnippet' failed to provide an identifier", id);
        obj = cmsSnippetService.findCmsSnippet(id);
        cmsSnippetService.deleteCmsSnippet(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'CmsSnippet' with identifier '" + id + "'", cmsSnippetService.findCmsSnippet(id));
    }
    
}
