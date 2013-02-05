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
import ro.roda.Org;
import ro.roda.OrgDataOnDemand;
import ro.roda.OrgIntegrationTest;

privileged aspect OrgIntegrationTest_Roo_IntegrationTest {
    
    declare @type: OrgIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: OrgIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: OrgIntegrationTest: @Transactional;
    
    @Autowired
    private OrgDataOnDemand OrgIntegrationTest.dod;
    
    @Test
    public void OrgIntegrationTest.testCountOrgs() {
        Assert.assertNotNull("Data on demand for 'Org' failed to initialize correctly", dod.getRandomOrg());
        long count = Org.countOrgs();
        Assert.assertTrue("Counter for 'Org' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void OrgIntegrationTest.testFindOrg() {
        Org obj = dod.getRandomOrg();
        Assert.assertNotNull("Data on demand for 'Org' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Org' failed to provide an identifier", id);
        obj = Org.findOrg(id);
        Assert.assertNotNull("Find method for 'Org' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Org' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void OrgIntegrationTest.testFindAllOrgs() {
        Assert.assertNotNull("Data on demand for 'Org' failed to initialize correctly", dod.getRandomOrg());
        long count = Org.countOrgs();
        Assert.assertTrue("Too expensive to perform a find all test for 'Org', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Org> result = Org.findAllOrgs();
        Assert.assertNotNull("Find all method for 'Org' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Org' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void OrgIntegrationTest.testFindOrgEntries() {
        Assert.assertNotNull("Data on demand for 'Org' failed to initialize correctly", dod.getRandomOrg());
        long count = Org.countOrgs();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Org> result = Org.findOrgEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Org' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Org' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void OrgIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Org' failed to initialize correctly", dod.getRandomOrg());
        Org obj = dod.getNewTransientOrg(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Org' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Org' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Org' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void OrgIntegrationTest.testRemove() {
        Org obj = dod.getRandomOrg();
        Assert.assertNotNull("Data on demand for 'Org' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Org' failed to provide an identifier", id);
        obj = Org.findOrg(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Org' with identifier '" + id + "'", Org.findOrg(id));
    }
    
}
