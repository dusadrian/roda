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
import ro.roda.AuthData;
import ro.roda.AuthDataDataOnDemand;
import ro.roda.UserDataOnDemand;

privileged aspect AuthDataDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AuthDataDataOnDemand: @Component;
    
    private Random AuthDataDataOnDemand.rnd = new SecureRandom();
    
    private List<AuthData> AuthDataDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand AuthDataDataOnDemand.userDataOnDemand;
    
    public AuthData AuthDataDataOnDemand.getNewTransientAuthData(int index) {
        AuthData obj = new AuthData();
        setCredentialProvider(obj, index);
        setFieldName(obj, index);
        setFieldValue(obj, index);
        return obj;
    }
    
    public void AuthDataDataOnDemand.setCredentialProvider(AuthData obj, int index) {
        String credentialProvider = "credentialProvider_" + index;
        obj.setCredentialProvider(credentialProvider);
    }
    
    public void AuthDataDataOnDemand.setFieldName(AuthData obj, int index) {
        String fieldName = "fieldName_" + index;
        obj.setFieldName(fieldName);
    }
    
    public void AuthDataDataOnDemand.setFieldValue(AuthData obj, int index) {
        String fieldValue = "fieldValue_" + index;
        obj.setFieldValue(fieldValue);
    }
    
    public AuthData AuthDataDataOnDemand.getSpecificAuthData(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AuthData obj = data.get(index);
        Integer id = obj.getUserId();
        return AuthData.findAuthData(id);
    }
    
    public AuthData AuthDataDataOnDemand.getRandomAuthData() {
        init();
        AuthData obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getUserId();
        return AuthData.findAuthData(id);
    }
    
    public boolean AuthDataDataOnDemand.modifyAuthData(AuthData obj) {
        return false;
    }
    
    public void AuthDataDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AuthData.findAuthDataEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AuthData' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AuthData>();
        for (int i = 0; i < 10; i++) {
            AuthData obj = getNewTransientAuthData(i);
            try {
                obj.persist();
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
