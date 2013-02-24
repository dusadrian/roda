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
import ro.roda.Address;
import ro.roda.AddressDataOnDemand;
import ro.roda.City;
import ro.roda.CityDataOnDemand;
import ro.roda.service.AddressService;

privileged aspect AddressDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AddressDataOnDemand: @Component;
    
    private Random AddressDataOnDemand.rnd = new SecureRandom();
    
    private List<Address> AddressDataOnDemand.data;
    
    @Autowired
    CityDataOnDemand AddressDataOnDemand.cityDataOnDemand;
    
    @Autowired
    AddressService AddressDataOnDemand.addressService;
    
    public Address AddressDataOnDemand.getNewTransientAddress(int index) {
        Address obj = new Address();
        setAddress1(obj, index);
        setAddress2(obj, index);
        setCityId(obj, index);
        setCountryId(obj, index);
        setPostalCode(obj, index);
        setSubdivCode(obj, index);
        setSubdivName(obj, index);
        return obj;
    }
    
    public void AddressDataOnDemand.setAddress1(Address obj, int index) {
        String address1 = "address1_" + index;
        obj.setAddress1(address1);
    }
    
    public void AddressDataOnDemand.setAddress2(Address obj, int index) {
        String address2 = "address2_" + index;
        obj.setAddress2(address2);
    }
    
    public void AddressDataOnDemand.setCityId(Address obj, int index) {
        City cityId = cityDataOnDemand.getRandomCity();
        obj.setCityId(cityId);
    }
    
    public void AddressDataOnDemand.setCountryId(Address obj, int index) {
        String countryId = "c" + index;
        if (countryId.length() > 2) {
            countryId = countryId.substring(0, 2);
        }
        obj.setCountryId(countryId);
    }
    
    public void AddressDataOnDemand.setPostalCode(Address obj, int index) {
        String postalCode = "postalCode_" + index;
        if (postalCode.length() > 30) {
            postalCode = postalCode.substring(0, 30);
        }
        obj.setPostalCode(postalCode);
    }
    
    public void AddressDataOnDemand.setSubdivCode(Address obj, int index) {
        String subdivCode = "subdivCode_" + index;
        if (subdivCode.length() > 50) {
            subdivCode = subdivCode.substring(0, 50);
        }
        obj.setSubdivCode(subdivCode);
    }
    
    public void AddressDataOnDemand.setSubdivName(Address obj, int index) {
        String subdivName = "subdivName_" + index;
        if (subdivName.length() > 200) {
            subdivName = subdivName.substring(0, 200);
        }
        obj.setSubdivName(subdivName);
    }
    
    public Address AddressDataOnDemand.getSpecificAddress(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Address obj = data.get(index);
        Integer id = obj.getId();
        return addressService.findAddress(id);
    }
    
    public Address AddressDataOnDemand.getRandomAddress() {
        init();
        Address obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return addressService.findAddress(id);
    }
    
    public boolean AddressDataOnDemand.modifyAddress(Address obj) {
        return false;
    }
    
    public void AddressDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = addressService.findAddressEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Address' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Address>();
        for (int i = 0; i < 10; i++) {
            Address obj = getNewTransientAddress(i);
            try {
                addressService.saveAddress(obj);
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
