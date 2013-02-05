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
import ro.roda.Suffix;
import ro.roda.SuffixDataOnDemand;
import ro.roda.SuffixIntegrationTest;

privileged aspect SuffixIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SuffixIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SuffixIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SuffixIntegrationTest: @Transactional;
    
    @Autowired
    private SuffixDataOnDemand SuffixIntegrationTest.dod;
    
    @Test
    public void SuffixIntegrationTest.testCountSuffixes() {
        Assert.assertNotNull("Data on demand for 'Suffix' failed to initialize correctly", dod.getRandomSuffix());
        long count = Suffix.countSuffixes();
        Assert.assertTrue("Counter for 'Suffix' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SuffixIntegrationTest.testFindSuffix() {
        Suffix obj = dod.getRandomSuffix();
        Assert.assertNotNull("Data on demand for 'Suffix' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Suffix' failed to provide an identifier", id);
        obj = Suffix.findSuffix(id);
        Assert.assertNotNull("Find method for 'Suffix' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Suffix' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SuffixIntegrationTest.testFindAllSuffixes() {
        Assert.assertNotNull("Data on demand for 'Suffix' failed to initialize correctly", dod.getRandomSuffix());
        long count = Suffix.countSuffixes();
        Assert.assertTrue("Too expensive to perform a find all test for 'Suffix', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Suffix> result = Suffix.findAllSuffixes();
        Assert.assertNotNull("Find all method for 'Suffix' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Suffix' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SuffixIntegrationTest.testFindSuffixEntries() {
        Assert.assertNotNull("Data on demand for 'Suffix' failed to initialize correctly", dod.getRandomSuffix());
        long count = Suffix.countSuffixes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Suffix> result = Suffix.findSuffixEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Suffix' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Suffix' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SuffixIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Suffix' failed to initialize correctly", dod.getRandomSuffix());
        Suffix obj = dod.getNewTransientSuffix(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Suffix' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Suffix' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Suffix' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SuffixIntegrationTest.testRemove() {
        Suffix obj = dod.getRandomSuffix();
        Assert.assertNotNull("Data on demand for 'Suffix' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Suffix' failed to provide an identifier", id);
        obj = Suffix.findSuffix(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Suffix' with identifier '" + id + "'", Suffix.findSuffix(id));
    }
    
}
