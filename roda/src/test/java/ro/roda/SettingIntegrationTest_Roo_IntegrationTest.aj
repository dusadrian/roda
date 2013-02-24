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
import ro.roda.SettingDataOnDemand;
import ro.roda.SettingIntegrationTest;
import ro.roda.service.SettingService;

privileged aspect SettingIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SettingIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SettingIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SettingIntegrationTest: @Transactional;
    
    @Autowired
    SettingDataOnDemand SettingIntegrationTest.dod;
    
    @Autowired
    SettingService SettingIntegrationTest.settingService;
    
    @Test
    public void SettingIntegrationTest.testCountAllSettings() {
        Assert.assertNotNull("Data on demand for 'Setting' failed to initialize correctly", dod.getRandomSetting());
        long count = settingService.countAllSettings();
        Assert.assertTrue("Counter for 'Setting' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SettingIntegrationTest.testFindSetting() {
        Setting obj = dod.getRandomSetting();
        Assert.assertNotNull("Data on demand for 'Setting' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Setting' failed to provide an identifier", id);
        obj = settingService.findSetting(id);
        Assert.assertNotNull("Find method for 'Setting' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Setting' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SettingIntegrationTest.testFindAllSettings() {
        Assert.assertNotNull("Data on demand for 'Setting' failed to initialize correctly", dod.getRandomSetting());
        long count = settingService.countAllSettings();
        Assert.assertTrue("Too expensive to perform a find all test for 'Setting', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Setting> result = settingService.findAllSettings();
        Assert.assertNotNull("Find all method for 'Setting' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Setting' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SettingIntegrationTest.testFindSettingEntries() {
        Assert.assertNotNull("Data on demand for 'Setting' failed to initialize correctly", dod.getRandomSetting());
        long count = settingService.countAllSettings();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Setting> result = settingService.findSettingEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Setting' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Setting' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SettingIntegrationTest.testSaveSetting() {
        Assert.assertNotNull("Data on demand for 'Setting' failed to initialize correctly", dod.getRandomSetting());
        Setting obj = dod.getNewTransientSetting(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Setting' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Setting' identifier to be null", obj.getId());
        settingService.saveSetting(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'Setting' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SettingIntegrationTest.testDeleteSetting() {
        Setting obj = dod.getRandomSetting();
        Assert.assertNotNull("Data on demand for 'Setting' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Setting' failed to provide an identifier", id);
        obj = settingService.findSetting(id);
        settingService.deleteSetting(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Setting' with identifier '" + id + "'", settingService.findSetting(id));
    }
    
}
