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
import ro.roda.InstanceKeyword;
import ro.roda.InstanceKeywordDataOnDemand;
import ro.roda.InstanceKeywordIntegrationTest;
import ro.roda.InstanceKeywordPK;

privileged aspect InstanceKeywordIntegrationTest_Roo_IntegrationTest {
    
    declare @type: InstanceKeywordIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: InstanceKeywordIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: InstanceKeywordIntegrationTest: @Transactional;
    
    @Autowired
    private InstanceKeywordDataOnDemand InstanceKeywordIntegrationTest.dod;
    
    @Test
    public void InstanceKeywordIntegrationTest.testCountInstanceKeywords() {
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to initialize correctly", dod.getRandomInstanceKeyword());
        long count = InstanceKeyword.countInstanceKeywords();
        Assert.assertTrue("Counter for 'InstanceKeyword' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void InstanceKeywordIntegrationTest.testFindInstanceKeyword() {
        InstanceKeyword obj = dod.getRandomInstanceKeyword();
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to initialize correctly", obj);
        InstanceKeywordPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to provide an identifier", id);
        obj = InstanceKeyword.findInstanceKeyword(id);
        Assert.assertNotNull("Find method for 'InstanceKeyword' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'InstanceKeyword' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void InstanceKeywordIntegrationTest.testFindAllInstanceKeywords() {
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to initialize correctly", dod.getRandomInstanceKeyword());
        long count = InstanceKeyword.countInstanceKeywords();
        Assert.assertTrue("Too expensive to perform a find all test for 'InstanceKeyword', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<InstanceKeyword> result = InstanceKeyword.findAllInstanceKeywords();
        Assert.assertNotNull("Find all method for 'InstanceKeyword' illegally returned null", result);
        Assert.assertTrue("Find all method for 'InstanceKeyword' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void InstanceKeywordIntegrationTest.testFindInstanceKeywordEntries() {
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to initialize correctly", dod.getRandomInstanceKeyword());
        long count = InstanceKeyword.countInstanceKeywords();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<InstanceKeyword> result = InstanceKeyword.findInstanceKeywordEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'InstanceKeyword' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'InstanceKeyword' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void InstanceKeywordIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to initialize correctly", dod.getRandomInstanceKeyword());
        InstanceKeyword obj = dod.getNewTransientInstanceKeyword(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to provide a new transient entity", obj);
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'InstanceKeyword' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void InstanceKeywordIntegrationTest.testRemove() {
        InstanceKeyword obj = dod.getRandomInstanceKeyword();
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to initialize correctly", obj);
        InstanceKeywordPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'InstanceKeyword' failed to provide an identifier", id);
        obj = InstanceKeyword.findInstanceKeyword(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'InstanceKeyword' with identifier '" + id + "'", InstanceKeyword.findInstanceKeyword(id));
    }
    
}
