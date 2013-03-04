// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.Sourcestudy;
import ro.roda.service.SourcestudyServiceImpl;

privileged aspect SourcestudyServiceImpl_Roo_Service {
    
    declare @type: SourcestudyServiceImpl: @Service;
    
    declare @type: SourcestudyServiceImpl: @Transactional;
    
    public long SourcestudyServiceImpl.countAllSourcestudys() {
        return Sourcestudy.countSourcestudys();
    }
    
    public void SourcestudyServiceImpl.deleteSourcestudy(Sourcestudy sourcestudy) {
        sourcestudy.remove();
    }
    
    public Sourcestudy SourcestudyServiceImpl.findSourcestudy(Integer id) {
        return Sourcestudy.findSourcestudy(id);
    }
    
    public List<Sourcestudy> SourcestudyServiceImpl.findAllSourcestudys() {
        return Sourcestudy.findAllSourcestudys();
    }
    
    public List<Sourcestudy> SourcestudyServiceImpl.findSourcestudyEntries(int firstResult, int maxResults) {
        return Sourcestudy.findSourcestudyEntries(firstResult, maxResults);
    }
    
    public void SourcestudyServiceImpl.saveSourcestudy(Sourcestudy sourcestudy) {
        sourcestudy.persist();
    }
    
    public Sourcestudy SourcestudyServiceImpl.updateSourcestudy(Sourcestudy sourcestudy) {
        return sourcestudy.merge();
    }
    
}