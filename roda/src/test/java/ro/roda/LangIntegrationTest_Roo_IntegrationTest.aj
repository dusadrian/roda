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
import ro.roda.LangDataOnDemand;
import ro.roda.LangIntegrationTest;
import ro.roda.service.LangService;

privileged aspect LangIntegrationTest_Roo_IntegrationTest {
    
    declare @type: LangIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: LangIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: LangIntegrationTest: @Transactional;
    
    @Autowired
    LangDataOnDemand LangIntegrationTest.dod;
    
    @Autowired
    LangService LangIntegrationTest.langService;
    
    @Test
    public void LangIntegrationTest.testCountAllLangs() {
        Assert.assertNotNull("Data on demand for 'Lang' failed to initialize correctly", dod.getRandomLang());
        long count = langService.countAllLangs();
        Assert.assertTrue("Counter for 'Lang' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void LangIntegrationTest.testFindLang() {
        Lang obj = dod.getRandomLang();
        Assert.assertNotNull("Data on demand for 'Lang' failed to initialize correctly", obj);
        String id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Lang' failed to provide an identifier", id);
        obj = langService.findLang(id);
        Assert.assertNotNull("Find method for 'Lang' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Lang' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void LangIntegrationTest.testFindAllLangs() {
        Assert.assertNotNull("Data on demand for 'Lang' failed to initialize correctly", dod.getRandomLang());
        long count = langService.countAllLangs();
        Assert.assertTrue("Too expensive to perform a find all test for 'Lang', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Lang> result = langService.findAllLangs();
        Assert.assertNotNull("Find all method for 'Lang' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Lang' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void LangIntegrationTest.testFindLangEntries() {
        Assert.assertNotNull("Data on demand for 'Lang' failed to initialize correctly", dod.getRandomLang());
        long count = langService.countAllLangs();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Lang> result = langService.findLangEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Lang' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Lang' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void LangIntegrationTest.testSaveLang() {
        Assert.assertNotNull("Data on demand for 'Lang' failed to initialize correctly", dod.getRandomLang());
        Lang obj = dod.getNewTransientLang(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Lang' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Lang' identifier to be null", obj.getId());
        langService.saveLang(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'Lang' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void LangIntegrationTest.testDeleteLang() {
        Lang obj = dod.getRandomLang();
        Assert.assertNotNull("Data on demand for 'Lang' failed to initialize correctly", obj);
        String id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Lang' failed to provide an identifier", id);
        obj = langService.findLang(id);
        langService.deleteLang(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Lang' with identifier '" + id + "'", langService.findLang(id));
    }
    
}
