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
import ro.roda.StudyDocumentsDataOnDemand;
import ro.roda.StudyDocumentsIntegrationTest;
import ro.roda.StudyDocumentsPK;
import ro.roda.service.StudyDocumentsService;

privileged aspect StudyDocumentsIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StudyDocumentsIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StudyDocumentsIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StudyDocumentsIntegrationTest: @Transactional;
    
    @Autowired
    StudyDocumentsDataOnDemand StudyDocumentsIntegrationTest.dod;
    
    @Autowired
    StudyDocumentsService StudyDocumentsIntegrationTest.studyDocumentsService;
    
    @Test
    public void StudyDocumentsIntegrationTest.testCountAllStudyDocumentses() {
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to initialize correctly", dod.getRandomStudyDocuments());
        long count = studyDocumentsService.countAllStudyDocumentses();
        Assert.assertTrue("Counter for 'StudyDocuments' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StudyDocumentsIntegrationTest.testFindStudyDocuments() {
        StudyDocuments obj = dod.getRandomStudyDocuments();
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to initialize correctly", obj);
        StudyDocumentsPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to provide an identifier", id);
        obj = studyDocumentsService.findStudyDocuments(id);
        Assert.assertNotNull("Find method for 'StudyDocuments' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'StudyDocuments' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void StudyDocumentsIntegrationTest.testFindAllStudyDocumentses() {
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to initialize correctly", dod.getRandomStudyDocuments());
        long count = studyDocumentsService.countAllStudyDocumentses();
        Assert.assertTrue("Too expensive to perform a find all test for 'StudyDocuments', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<StudyDocuments> result = studyDocumentsService.findAllStudyDocumentses();
        Assert.assertNotNull("Find all method for 'StudyDocuments' illegally returned null", result);
        Assert.assertTrue("Find all method for 'StudyDocuments' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StudyDocumentsIntegrationTest.testFindStudyDocumentsEntries() {
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to initialize correctly", dod.getRandomStudyDocuments());
        long count = studyDocumentsService.countAllStudyDocumentses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<StudyDocuments> result = studyDocumentsService.findStudyDocumentsEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'StudyDocuments' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'StudyDocuments' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StudyDocumentsIntegrationTest.testSaveStudyDocuments() {
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to initialize correctly", dod.getRandomStudyDocuments());
        StudyDocuments obj = dod.getNewTransientStudyDocuments(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to provide a new transient entity", obj);
        studyDocumentsService.saveStudyDocuments(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'StudyDocuments' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void StudyDocumentsIntegrationTest.testDeleteStudyDocuments() {
        StudyDocuments obj = dod.getRandomStudyDocuments();
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to initialize correctly", obj);
        StudyDocumentsPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'StudyDocuments' failed to provide an identifier", id);
        obj = studyDocumentsService.findStudyDocuments(id);
        studyDocumentsService.deleteStudyDocuments(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'StudyDocuments' with identifier '" + id + "'", studyDocumentsService.findStudyDocuments(id));
    }
    
}
