// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import ro.roda.domain.City;
import ro.roda.domain.Country;
import ro.roda.domain.Region;

privileged aspect Country_Roo_DbManaged {
    
    @OneToMany(mappedBy = "countryId")
    private Set<City> Country.cities;
    
    @OneToMany(mappedBy = "countryId")
    private Set<Region> Country.regions;
    
    @Column(name = "name_ro", columnDefinition = "text")
    private String Country.nameRo;
    
    @Column(name = "name_self", columnDefinition = "text")
    private String Country.nameSelf;
    
    @Column(name = "name_en", columnDefinition = "text")
    private String Country.nameEn;
    
    @Column(name = "iso3166", columnDefinition = "bpchar", length = 2, unique = true)
    @NotNull
    private String Country.iso3166;
    
    @Column(name = "iso3166_alpha3", columnDefinition = "bpchar", length = 3)
    private String Country.iso3166Alpha3;
    
    public Set<City> Country.getCities() {
        return cities;
    }
    
    public void Country.setCities(Set<City> cities) {
        this.cities = cities;
    }
    
    public Set<Region> Country.getRegions() {
        return regions;
    }
    
    public void Country.setRegions(Set<Region> regions) {
        this.regions = regions;
    }
    
    public String Country.getNameRo() {
        return nameRo;
    }
    
    public void Country.setNameRo(String nameRo) {
        this.nameRo = nameRo;
    }
    
    public String Country.getNameSelf() {
        return nameSelf;
    }
    
    public void Country.setNameSelf(String nameSelf) {
        this.nameSelf = nameSelf;
    }
    
    public String Country.getNameEn() {
        return nameEn;
    }
    
    public void Country.setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }
    
    public String Country.getIso3166() {
        return iso3166;
    }
    
    public void Country.setIso3166(String iso3166) {
        this.iso3166 = iso3166;
    }
    
    public String Country.getIso3166Alpha3() {
        return iso3166Alpha3;
    }
    
    public void Country.setIso3166Alpha3(String iso3166Alpha3) {
        this.iso3166Alpha3 = iso3166Alpha3;
    }
    
}
