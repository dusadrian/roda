// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ro.roda.City;
import ro.roda.CityDataOnDemand;
import ro.roda.Country;
import ro.roda.CountryDataOnDemand;
import ro.roda.service.CityService;

privileged aspect CityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CityDataOnDemand: @Component;
    
    private Random CityDataOnDemand.rnd = new SecureRandom();
    
    private List<City> CityDataOnDemand.data;
    
    @Autowired
    CountryDataOnDemand CityDataOnDemand.countryDataOnDemand;
    
    @Autowired
    CityService CityDataOnDemand.cityService;
    
    public City CityDataOnDemand.getNewTransientCity(int index) {
        City obj = new City();
        setCityCode(obj, index);
        setCityCodeName(obj, index);
        setCityCodeSup(obj, index);
        setCityType(obj, index);
        setCityTypeSystem(obj, index);
        setCountryId(obj, index);
        setName(obj, index);
        setPrefix(obj, index);
        return obj;
    }
    
    public void CityDataOnDemand.setCityCode(City obj, int index) {
        String cityCode = "cityCode_" + index;
        if (cityCode.length() > 50) {
            cityCode = cityCode.substring(0, 50);
        }
        obj.setCityCode(cityCode);
    }
    
    public void CityDataOnDemand.setCityCodeName(City obj, int index) {
        String cityCodeName = "cityCodeName_" + index;
        if (cityCodeName.length() > 100) {
            cityCodeName = cityCodeName.substring(0, 100);
        }
        obj.setCityCodeName(cityCodeName);
    }
    
    public void CityDataOnDemand.setCityCodeSup(City obj, int index) {
        String cityCodeSup = "cityCodeSup_" + index;
        if (cityCodeSup.length() > 100) {
            cityCodeSup = cityCodeSup.substring(0, 100);
        }
        obj.setCityCodeSup(cityCodeSup);
    }
    
    public void CityDataOnDemand.setCityType(City obj, int index) {
        String cityType = "cityType_" + index;
        if (cityType.length() > 50) {
            cityType = cityType.substring(0, 50);
        }
        obj.setCityType(cityType);
    }
    
    public void CityDataOnDemand.setCityTypeSystem(City obj, int index) {
        String cityTypeSystem = "cityTypeSystem_" + index;
        if (cityTypeSystem.length() > 50) {
            cityTypeSystem = cityTypeSystem.substring(0, 50);
        }
        obj.setCityTypeSystem(cityTypeSystem);
    }
    
    public void CityDataOnDemand.setCountryId(City obj, int index) {
        Country countryId = countryDataOnDemand.getRandomCountry();
        obj.setCountryId(countryId);
    }
    
    public void CityDataOnDemand.setName(City obj, int index) {
        String name = "name_" + index;
        if (name.length() > 100) {
            name = name.substring(0, 100);
        }
        obj.setName(name);
    }
    
    public void CityDataOnDemand.setPrefix(City obj, int index) {
        String prefix = "prefix_" + index;
        if (prefix.length() > 50) {
            prefix = prefix.substring(0, 50);
        }
        obj.setPrefix(prefix);
    }
    
    public City CityDataOnDemand.getSpecificCity(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        City obj = data.get(index);
        Integer id = obj.getId();
        return cityService.findCity(id);
    }
    
    public City CityDataOnDemand.getRandomCity() {
        init();
        City obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return cityService.findCity(id);
    }
    
    public boolean CityDataOnDemand.modifyCity(City obj) {
        return false;
    }
    
    public void CityDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = cityService.findCityEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'City' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<City>();
        for (int i = 0; i < 10; i++) {
            City obj = getNewTransientCity(i);
            try {
                cityService.saveCity(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
