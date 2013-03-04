// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.roda.domain.OtherStatistic;
import ro.roda.service.OtherStatisticServiceImpl;

privileged aspect OtherStatisticServiceImpl_Roo_Service {
    
    declare @type: OtherStatisticServiceImpl: @Service;
    
    declare @type: OtherStatisticServiceImpl: @Transactional;
    
    public long OtherStatisticServiceImpl.countAllOtherStatistics() {
        return OtherStatistic.countOtherStatistics();
    }
    
    public void OtherStatisticServiceImpl.deleteOtherStatistic(OtherStatistic otherStatistic) {
        otherStatistic.remove();
    }
    
    public OtherStatistic OtherStatisticServiceImpl.findOtherStatistic(Long id) {
        return OtherStatistic.findOtherStatistic(id);
    }
    
    public List<OtherStatistic> OtherStatisticServiceImpl.findAllOtherStatistics() {
        return OtherStatistic.findAllOtherStatistics();
    }
    
    public List<OtherStatistic> OtherStatisticServiceImpl.findOtherStatisticEntries(int firstResult, int maxResults) {
        return OtherStatistic.findOtherStatisticEntries(firstResult, maxResults);
    }
    
    public void OtherStatisticServiceImpl.saveOtherStatistic(OtherStatistic otherStatistic) {
        otherStatistic.persist();
    }
    
    public OtherStatistic OtherStatisticServiceImpl.updateOtherStatistic(OtherStatistic otherStatistic) {
        return otherStatistic.merge();
    }
    
}
