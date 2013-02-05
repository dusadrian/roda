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
import ro.roda.Form;
import ro.roda.FormDataOnDemand;
import ro.roda.FormIntegrationTest;

privileged aspect FormIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FormIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FormIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FormIntegrationTest: @Transactional;
    
    @Autowired
    private FormDataOnDemand FormIntegrationTest.dod;
    
    @Test
    public void FormIntegrationTest.testCountForms() {
        Assert.assertNotNull("Data on demand for 'Form' failed to initialize correctly", dod.getRandomForm());
        long count = Form.countForms();
        Assert.assertTrue("Counter for 'Form' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FormIntegrationTest.testFindForm() {
        Form obj = dod.getRandomForm();
        Assert.assertNotNull("Data on demand for 'Form' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Form' failed to provide an identifier", id);
        obj = Form.findForm(id);
        Assert.assertNotNull("Find method for 'Form' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Form' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void FormIntegrationTest.testFindAllForms() {
        Assert.assertNotNull("Data on demand for 'Form' failed to initialize correctly", dod.getRandomForm());
        long count = Form.countForms();
        Assert.assertTrue("Too expensive to perform a find all test for 'Form', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Form> result = Form.findAllForms();
        Assert.assertNotNull("Find all method for 'Form' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Form' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FormIntegrationTest.testFindFormEntries() {
        Assert.assertNotNull("Data on demand for 'Form' failed to initialize correctly", dod.getRandomForm());
        long count = Form.countForms();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Form> result = Form.findFormEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Form' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Form' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FormIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Form' failed to initialize correctly", dod.getRandomForm());
        Form obj = dod.getNewTransientForm(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Form' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Form' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Form' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void FormIntegrationTest.testRemove() {
        Form obj = dod.getRandomForm();
        Assert.assertNotNull("Data on demand for 'Form' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Form' failed to provide an identifier", id);
        obj = Form.findForm(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Form' with identifier '" + id + "'", Form.findForm(id));
    }
    
}
