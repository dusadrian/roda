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
import ro.roda.OrgAddressDataOnDemand;
import ro.roda.OrgAddressIntegrationTest;
import ro.roda.OrgAddressPK;
import ro.roda.service.OrgAddressService;

privileged aspect OrgAddressIntegrationTest_Roo_IntegrationTest {
    
    declare @type: OrgAddressIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: OrgAddressIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: OrgAddressIntegrationTest: @Transactional;
    
    @Autowired
    OrgAddressDataOnDemand OrgAddressIntegrationTest.dod;
    
    @Autowired
    OrgAddressService OrgAddressIntegrationTest.orgAddressService;
    
    @Test
    public void OrgAddressIntegrationTest.testCountAllOrgAddresses() {
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to initialize correctly", dod.getRandomOrgAddress());
        long count = orgAddressService.countAllOrgAddresses();
        Assert.assertTrue("Counter for 'OrgAddress' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void OrgAddressIntegrationTest.testFindOrgAddress() {
        OrgAddress obj = dod.getRandomOrgAddress();
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to initialize correctly", obj);
        OrgAddressPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to provide an identifier", id);
        obj = orgAddressService.findOrgAddress(id);
        Assert.assertNotNull("Find method for 'OrgAddress' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'OrgAddress' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void OrgAddressIntegrationTest.testFindAllOrgAddresses() {
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to initialize correctly", dod.getRandomOrgAddress());
        long count = orgAddressService.countAllOrgAddresses();
        Assert.assertTrue("Too expensive to perform a find all test for 'OrgAddress', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<OrgAddress> result = orgAddressService.findAllOrgAddresses();
        Assert.assertNotNull("Find all method for 'OrgAddress' illegally returned null", result);
        Assert.assertTrue("Find all method for 'OrgAddress' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void OrgAddressIntegrationTest.testFindOrgAddressEntries() {
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to initialize correctly", dod.getRandomOrgAddress());
        long count = orgAddressService.countAllOrgAddresses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<OrgAddress> result = orgAddressService.findOrgAddressEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'OrgAddress' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'OrgAddress' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void OrgAddressIntegrationTest.testSaveOrgAddress() {
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to initialize correctly", dod.getRandomOrgAddress());
        OrgAddress obj = dod.getNewTransientOrgAddress(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to provide a new transient entity", obj);
        orgAddressService.saveOrgAddress(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'OrgAddress' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void OrgAddressIntegrationTest.testDeleteOrgAddress() {
        OrgAddress obj = dod.getRandomOrgAddress();
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to initialize correctly", obj);
        OrgAddressPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'OrgAddress' failed to provide an identifier", id);
        obj = orgAddressService.findOrgAddress(id);
        orgAddressService.deleteOrgAddress(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'OrgAddress' with identifier '" + id + "'", orgAddressService.findOrgAddress(id));
    }
    
}
