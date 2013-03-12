// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import ro.roda.domain.AuthData;
import ro.roda.domain.Rodauser;

privileged aspect AuthData_Roo_DbManaged {
    
    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
    private Rodauser AuthData.rodauser;
    
    @Column(name = "credential_provider", columnDefinition = "text")
    @NotNull
    private String AuthData.credentialProvider;
    
    @Column(name = "field_name", columnDefinition = "text")
    @NotNull
    private String AuthData.fieldName;
    
    @Column(name = "field_value", columnDefinition = "text")
    @NotNull
    private String AuthData.fieldValue;
    
    public Rodauser AuthData.getRodauser() {
        return rodauser;
    }
    
    public void AuthData.setRodauser(Rodauser rodauser) {
        this.rodauser = rodauser;
    }
    
    public String AuthData.getCredentialProvider() {
        return credentialProvider;
    }
    
    public void AuthData.setCredentialProvider(String credentialProvider) {
        this.credentialProvider = credentialProvider;
    }
    
    public String AuthData.getFieldName() {
        return fieldName;
    }
    
    public void AuthData.setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }
    
    public String AuthData.getFieldValue() {
        return fieldValue;
    }
    
    public void AuthData.setFieldValue(String fieldValue) {
        this.fieldValue = fieldValue;
    }
    
}