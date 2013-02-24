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
import ro.roda.CatalogAclDataOnDemand;
import ro.roda.CatalogAclIntegrationTest;
import ro.roda.CatalogAclPK;
import ro.roda.service.CatalogAclService;

privileged aspect CatalogAclIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CatalogAclIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CatalogAclIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CatalogAclIntegrationTest: @Transactional;
    
    @Autowired
    CatalogAclDataOnDemand CatalogAclIntegrationTest.dod;
    
    @Autowired
    CatalogAclService CatalogAclIntegrationTest.catalogAclService;
    
    @Test
    public void CatalogAclIntegrationTest.testCountAllCatalogAcls() {
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to initialize correctly", dod.getRandomCatalogAcl());
        long count = catalogAclService.countAllCatalogAcls();
        Assert.assertTrue("Counter for 'CatalogAcl' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CatalogAclIntegrationTest.testFindCatalogAcl() {
        CatalogAcl obj = dod.getRandomCatalogAcl();
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to initialize correctly", obj);
        CatalogAclPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to provide an identifier", id);
        obj = catalogAclService.findCatalogAcl(id);
        Assert.assertNotNull("Find method for 'CatalogAcl' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'CatalogAcl' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CatalogAclIntegrationTest.testFindAllCatalogAcls() {
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to initialize correctly", dod.getRandomCatalogAcl());
        long count = catalogAclService.countAllCatalogAcls();
        Assert.assertTrue("Too expensive to perform a find all test for 'CatalogAcl', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<CatalogAcl> result = catalogAclService.findAllCatalogAcls();
        Assert.assertNotNull("Find all method for 'CatalogAcl' illegally returned null", result);
        Assert.assertTrue("Find all method for 'CatalogAcl' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CatalogAclIntegrationTest.testFindCatalogAclEntries() {
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to initialize correctly", dod.getRandomCatalogAcl());
        long count = catalogAclService.countAllCatalogAcls();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<CatalogAcl> result = catalogAclService.findCatalogAclEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'CatalogAcl' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'CatalogAcl' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CatalogAclIntegrationTest.testSaveCatalogAcl() {
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to initialize correctly", dod.getRandomCatalogAcl());
        CatalogAcl obj = dod.getNewTransientCatalogAcl(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to provide a new transient entity", obj);
        catalogAclService.saveCatalogAcl(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'CatalogAcl' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CatalogAclIntegrationTest.testDeleteCatalogAcl() {
        CatalogAcl obj = dod.getRandomCatalogAcl();
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to initialize correctly", obj);
        CatalogAclPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'CatalogAcl' failed to provide an identifier", id);
        obj = catalogAclService.findCatalogAcl(id);
        catalogAclService.deleteCatalogAcl(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'CatalogAcl' with identifier '" + id + "'", catalogAclService.findCatalogAcl(id));
    }
    
}
