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
import ro.roda.SourcestudyType;
import ro.roda.SourcestudyTypeDataOnDemand;
import ro.roda.SourcestudyTypeIntegrationTest;

privileged aspect SourcestudyTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SourcestudyTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SourcestudyTypeIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SourcestudyTypeIntegrationTest: @Transactional;
    
    @Autowired
    private SourcestudyTypeDataOnDemand SourcestudyTypeIntegrationTest.dod;
    
    @Test
    public void SourcestudyTypeIntegrationTest.testCountSourcestudyTypes() {
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to initialize correctly", dod.getRandomSourcestudyType());
        long count = SourcestudyType.countSourcestudyTypes();
        Assert.assertTrue("Counter for 'SourcestudyType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SourcestudyTypeIntegrationTest.testFindSourcestudyType() {
        SourcestudyType obj = dod.getRandomSourcestudyType();
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to provide an identifier", id);
        obj = SourcestudyType.findSourcestudyType(id);
        Assert.assertNotNull("Find method for 'SourcestudyType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SourcestudyType' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SourcestudyTypeIntegrationTest.testFindAllSourcestudyTypes() {
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to initialize correctly", dod.getRandomSourcestudyType());
        long count = SourcestudyType.countSourcestudyTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'SourcestudyType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SourcestudyType> result = SourcestudyType.findAllSourcestudyTypes();
        Assert.assertNotNull("Find all method for 'SourcestudyType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SourcestudyType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SourcestudyTypeIntegrationTest.testFindSourcestudyTypeEntries() {
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to initialize correctly", dod.getRandomSourcestudyType());
        long count = SourcestudyType.countSourcestudyTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SourcestudyType> result = SourcestudyType.findSourcestudyTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SourcestudyType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SourcestudyType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SourcestudyTypeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to initialize correctly", dod.getRandomSourcestudyType());
        SourcestudyType obj = dod.getNewTransientSourcestudyType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SourcestudyType' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'SourcestudyType' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SourcestudyTypeIntegrationTest.testRemove() {
        SourcestudyType obj = dod.getRandomSourcestudyType();
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'SourcestudyType' failed to provide an identifier", id);
        obj = SourcestudyType.findSourcestudyType(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'SourcestudyType' with identifier '" + id + "'", SourcestudyType.findSourcestudyType(id));
    }
    
}