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
import ro.roda.StudyOrgAssoc;
import ro.roda.StudyOrgAssocDataOnDemand;
import ro.roda.StudyOrgAssocIntegrationTest;

privileged aspect StudyOrgAssocIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StudyOrgAssocIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StudyOrgAssocIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StudyOrgAssocIntegrationTest: @Transactional;
    
    @Autowired
    private StudyOrgAssocDataOnDemand StudyOrgAssocIntegrationTest.dod;
    
    @Test
    public void StudyOrgAssocIntegrationTest.testCountStudyOrgAssocs() {
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to initialize correctly", dod.getRandomStudyOrgAssoc());
        long count = StudyOrgAssoc.countStudyOrgAssocs();
        Assert.assertTrue("Counter for 'StudyOrgAssoc' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StudyOrgAssocIntegrationTest.testFindStudyOrgAssoc() {
        StudyOrgAssoc obj = dod.getRandomStudyOrgAssoc();
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to provide an identifier", id);
        obj = StudyOrgAssoc.findStudyOrgAssoc(id);
        Assert.assertNotNull("Find method for 'StudyOrgAssoc' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'StudyOrgAssoc' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void StudyOrgAssocIntegrationTest.testFindAllStudyOrgAssocs() {
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to initialize correctly", dod.getRandomStudyOrgAssoc());
        long count = StudyOrgAssoc.countStudyOrgAssocs();
        Assert.assertTrue("Too expensive to perform a find all test for 'StudyOrgAssoc', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<StudyOrgAssoc> result = StudyOrgAssoc.findAllStudyOrgAssocs();
        Assert.assertNotNull("Find all method for 'StudyOrgAssoc' illegally returned null", result);
        Assert.assertTrue("Find all method for 'StudyOrgAssoc' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StudyOrgAssocIntegrationTest.testFindStudyOrgAssocEntries() {
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to initialize correctly", dod.getRandomStudyOrgAssoc());
        long count = StudyOrgAssoc.countStudyOrgAssocs();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<StudyOrgAssoc> result = StudyOrgAssoc.findStudyOrgAssocEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'StudyOrgAssoc' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'StudyOrgAssoc' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StudyOrgAssocIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to initialize correctly", dod.getRandomStudyOrgAssoc());
        StudyOrgAssoc obj = dod.getNewTransientStudyOrgAssoc(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'StudyOrgAssoc' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'StudyOrgAssoc' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void StudyOrgAssocIntegrationTest.testRemove() {
        StudyOrgAssoc obj = dod.getRandomStudyOrgAssoc();
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StudyOrgAssoc' failed to provide an identifier", id);
        obj = StudyOrgAssoc.findStudyOrgAssoc(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'StudyOrgAssoc' with identifier '" + id + "'", StudyOrgAssoc.findStudyOrgAssoc(id));
    }
    
}
