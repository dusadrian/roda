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
import ro.roda.SettingValueDataOnDemand;
import ro.roda.SettingValueIntegrationTest;
import ro.roda.service.SettingValueService;

privileged aspect SettingValueIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SettingValueIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SettingValueIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SettingValueIntegrationTest: @Transactional;
    
    @Autowired
    SettingValueDataOnDemand SettingValueIntegrationTest.dod;
    
    @Autowired
    SettingValueService SettingValueIntegrationTest.settingValueService;
    
    @Test
    public void SettingValueIntegrationTest.testCountAllSettingValues() {
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to initialize correctly", dod.getRandomSettingValue());
        long count = settingValueService.countAllSettingValues();
        Assert.assertTrue("Counter for 'SettingValue' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SettingValueIntegrationTest.testFindSettingValue() {
        SettingValue obj = dod.getRandomSettingValue();
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to initialize correctly", obj);
        Integer id = obj.getSettingId();
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to provide an identifier", id);
        obj = settingValueService.findSettingValue(id);
        Assert.assertNotNull("Find method for 'SettingValue' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'SettingValue' returned the incorrect identifier", id, obj.getSettingId());
    }
    
    @Test
    public void SettingValueIntegrationTest.testFindAllSettingValues() {
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to initialize correctly", dod.getRandomSettingValue());
        long count = settingValueService.countAllSettingValues();
        Assert.assertTrue("Too expensive to perform a find all test for 'SettingValue', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<SettingValue> result = settingValueService.findAllSettingValues();
        Assert.assertNotNull("Find all method for 'SettingValue' illegally returned null", result);
        Assert.assertTrue("Find all method for 'SettingValue' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SettingValueIntegrationTest.testFindSettingValueEntries() {
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to initialize correctly", dod.getRandomSettingValue());
        long count = settingValueService.countAllSettingValues();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<SettingValue> result = settingValueService.findSettingValueEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'SettingValue' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'SettingValue' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SettingValueIntegrationTest.testSaveSettingValue() {
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to initialize correctly", dod.getRandomSettingValue());
        SettingValue obj = dod.getNewTransientSettingValue(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'SettingValue' identifier to be null", obj.getSettingId());
        settingValueService.saveSettingValue(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'SettingValue' identifier to no longer be null", obj.getSettingId());
    }
    
    @Test
    public void SettingValueIntegrationTest.testDeleteSettingValue() {
        SettingValue obj = dod.getRandomSettingValue();
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to initialize correctly", obj);
        Integer id = obj.getSettingId();
        Assert.assertNotNull("Data on demand for 'SettingValue' failed to provide an identifier", id);
        obj = settingValueService.findSettingValue(id);
        settingValueService.deleteSettingValue(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'SettingValue' with identifier '" + id + "'", settingValueService.findSettingValue(id));
    }
    
}
