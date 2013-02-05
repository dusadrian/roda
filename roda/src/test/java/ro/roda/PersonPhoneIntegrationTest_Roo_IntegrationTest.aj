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
import ro.roda.PersonPhone;
import ro.roda.PersonPhoneDataOnDemand;
import ro.roda.PersonPhoneIntegrationTest;
import ro.roda.PersonPhonePK;

privileged aspect PersonPhoneIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PersonPhoneIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PersonPhoneIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PersonPhoneIntegrationTest: @Transactional;
    
    @Autowired
    private PersonPhoneDataOnDemand PersonPhoneIntegrationTest.dod;
    
    @Test
    public void PersonPhoneIntegrationTest.testCountPersonPhones() {
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to initialize correctly", dod.getRandomPersonPhone());
        long count = PersonPhone.countPersonPhones();
        Assert.assertTrue("Counter for 'PersonPhone' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PersonPhoneIntegrationTest.testFindPersonPhone() {
        PersonPhone obj = dod.getRandomPersonPhone();
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to initialize correctly", obj);
        PersonPhonePK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to provide an identifier", id);
        obj = PersonPhone.findPersonPhone(id);
        Assert.assertNotNull("Find method for 'PersonPhone' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PersonPhone' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PersonPhoneIntegrationTest.testFindAllPersonPhones() {
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to initialize correctly", dod.getRandomPersonPhone());
        long count = PersonPhone.countPersonPhones();
        Assert.assertTrue("Too expensive to perform a find all test for 'PersonPhone', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PersonPhone> result = PersonPhone.findAllPersonPhones();
        Assert.assertNotNull("Find all method for 'PersonPhone' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PersonPhone' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PersonPhoneIntegrationTest.testFindPersonPhoneEntries() {
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to initialize correctly", dod.getRandomPersonPhone());
        long count = PersonPhone.countPersonPhones();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PersonPhone> result = PersonPhone.findPersonPhoneEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PersonPhone' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PersonPhone' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PersonPhoneIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to initialize correctly", dod.getRandomPersonPhone());
        PersonPhone obj = dod.getNewTransientPersonPhone(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to provide a new transient entity", obj);
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'PersonPhone' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PersonPhoneIntegrationTest.testRemove() {
        PersonPhone obj = dod.getRandomPersonPhone();
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to initialize correctly", obj);
        PersonPhonePK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PersonPhone' failed to provide an identifier", id);
        obj = PersonPhone.findPersonPhone(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'PersonPhone' with identifier '" + id + "'", PersonPhone.findPersonPhone(id));
    }
    
}