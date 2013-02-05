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
import ro.roda.FormSelectionVar;
import ro.roda.FormSelectionVarDataOnDemand;
import ro.roda.FormSelectionVarIntegrationTest;
import ro.roda.FormSelectionVarPK;

privileged aspect FormSelectionVarIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FormSelectionVarIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FormSelectionVarIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FormSelectionVarIntegrationTest: @Transactional;
    
    @Autowired
    private FormSelectionVarDataOnDemand FormSelectionVarIntegrationTest.dod;
    
    @Test
    public void FormSelectionVarIntegrationTest.testCountFormSelectionVars() {
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to initialize correctly", dod.getRandomFormSelectionVar());
        long count = FormSelectionVar.countFormSelectionVars();
        Assert.assertTrue("Counter for 'FormSelectionVar' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FormSelectionVarIntegrationTest.testFindFormSelectionVar() {
        FormSelectionVar obj = dod.getRandomFormSelectionVar();
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to initialize correctly", obj);
        FormSelectionVarPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to provide an identifier", id);
        obj = FormSelectionVar.findFormSelectionVar(id);
        Assert.assertNotNull("Find method for 'FormSelectionVar' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'FormSelectionVar' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void FormSelectionVarIntegrationTest.testFindAllFormSelectionVars() {
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to initialize correctly", dod.getRandomFormSelectionVar());
        long count = FormSelectionVar.countFormSelectionVars();
        Assert.assertTrue("Too expensive to perform a find all test for 'FormSelectionVar', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<FormSelectionVar> result = FormSelectionVar.findAllFormSelectionVars();
        Assert.assertNotNull("Find all method for 'FormSelectionVar' illegally returned null", result);
        Assert.assertTrue("Find all method for 'FormSelectionVar' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FormSelectionVarIntegrationTest.testFindFormSelectionVarEntries() {
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to initialize correctly", dod.getRandomFormSelectionVar());
        long count = FormSelectionVar.countFormSelectionVars();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<FormSelectionVar> result = FormSelectionVar.findFormSelectionVarEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'FormSelectionVar' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'FormSelectionVar' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FormSelectionVarIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to initialize correctly", dod.getRandomFormSelectionVar());
        FormSelectionVar obj = dod.getNewTransientFormSelectionVar(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to provide a new transient entity", obj);
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'FormSelectionVar' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void FormSelectionVarIntegrationTest.testRemove() {
        FormSelectionVar obj = dod.getRandomFormSelectionVar();
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to initialize correctly", obj);
        FormSelectionVarPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FormSelectionVar' failed to provide an identifier", id);
        obj = FormSelectionVar.findFormSelectionVar(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'FormSelectionVar' with identifier '" + id + "'", FormSelectionVar.findFormSelectionVar(id));
    }
    
}
