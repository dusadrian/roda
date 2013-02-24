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
import ro.roda.AuditDataOnDemand;
import ro.roda.AuditIntegrationTest;
import ro.roda.service.AuditService;

privileged aspect AuditIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AuditIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AuditIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AuditIntegrationTest: @Transactional;
    
    @Autowired
    AuditDataOnDemand AuditIntegrationTest.dod;
    
    @Autowired
    AuditService AuditIntegrationTest.auditService;
    
    @Test
    public void AuditIntegrationTest.testCountAllAudits() {
        Assert.assertNotNull("Data on demand for 'Audit' failed to initialize correctly", dod.getRandomAudit());
        long count = auditService.countAllAudits();
        Assert.assertTrue("Counter for 'Audit' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AuditIntegrationTest.testFindAudit() {
        Audit obj = dod.getRandomAudit();
        Assert.assertNotNull("Data on demand for 'Audit' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Audit' failed to provide an identifier", id);
        obj = auditService.findAudit(id);
        Assert.assertNotNull("Find method for 'Audit' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Audit' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AuditIntegrationTest.testFindAllAudits() {
        Assert.assertNotNull("Data on demand for 'Audit' failed to initialize correctly", dod.getRandomAudit());
        long count = auditService.countAllAudits();
        Assert.assertTrue("Too expensive to perform a find all test for 'Audit', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Audit> result = auditService.findAllAudits();
        Assert.assertNotNull("Find all method for 'Audit' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Audit' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AuditIntegrationTest.testFindAuditEntries() {
        Assert.assertNotNull("Data on demand for 'Audit' failed to initialize correctly", dod.getRandomAudit());
        long count = auditService.countAllAudits();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Audit> result = auditService.findAuditEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Audit' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Audit' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AuditIntegrationTest.testSaveAudit() {
        Assert.assertNotNull("Data on demand for 'Audit' failed to initialize correctly", dod.getRandomAudit());
        Audit obj = dod.getNewTransientAudit(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Audit' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Audit' identifier to be null", obj.getId());
        auditService.saveAudit(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'Audit' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AuditIntegrationTest.testDeleteAudit() {
        Audit obj = dod.getRandomAudit();
        Assert.assertNotNull("Data on demand for 'Audit' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Audit' failed to provide an identifier", id);
        obj = auditService.findAudit(id);
        auditService.deleteAudit(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Audit' with identifier '" + id + "'", auditService.findAudit(id));
    }
    
}
