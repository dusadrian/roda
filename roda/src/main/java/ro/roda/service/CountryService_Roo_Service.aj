// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.service;

import java.util.List;
import ro.roda.domain.Country;
import ro.roda.service.CountryService;

privileged aspect CountryService_Roo_Service {
    
    public abstract long CountryService.countAllCountrys();    
    public abstract void CountryService.deleteCountry(Country country);    
    public abstract Country CountryService.findCountry(String id);    
    public abstract List<Country> CountryService.findAllCountrys();    
    public abstract List<Country> CountryService.findCountryEntries(int firstResult, int maxResults);    
    public abstract void CountryService.saveCountry(Country country);    
    public abstract Country CountryService.updateCountry(Country country);    
}
