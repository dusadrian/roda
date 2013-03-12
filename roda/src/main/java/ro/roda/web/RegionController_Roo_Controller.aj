// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import ro.roda.domain.Region;
import ro.roda.service.CityService;
import ro.roda.service.CountryService;
import ro.roda.service.RegionService;
import ro.roda.service.RegiontypeService;
import ro.roda.web.RegionController;

privileged aspect RegionController_Roo_Controller {
    
    @Autowired
    RegionService RegionController.regionService;
    
    @Autowired
    CityService RegionController.cityService;
    
    @Autowired
    CountryService RegionController.countryService;
    
    @Autowired
    RegiontypeService RegionController.regiontypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RegionController.create(@Valid Region region, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, region);
            return "regions/create";
        }
        uiModel.asMap().clear();
        regionService.saveRegion(region);
        return "redirect:/regions/" + encodeUrlPathSegment(region.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RegionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Region());
        return "regions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RegionController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("region", regionService.findRegion(id));
        uiModel.addAttribute("itemId", id);
        return "regions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RegionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("regions", regionService.findRegionEntries(firstResult, sizeNo));
            float nrOfPages = (float) regionService.countAllRegions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("regions", regionService.findAllRegions());
        }
        return "regions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RegionController.update(@Valid Region region, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, region);
            return "regions/update";
        }
        uiModel.asMap().clear();
        regionService.updateRegion(region);
        return "redirect:/regions/" + encodeUrlPathSegment(region.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RegionController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, regionService.findRegion(id));
        return "regions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RegionController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Region region = regionService.findRegion(id);
        regionService.deleteRegion(region);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/regions";
    }
    
    void RegionController.populateEditForm(Model uiModel, Region region) {
        uiModel.addAttribute("region", region);
        uiModel.addAttribute("citys", cityService.findAllCitys());
        uiModel.addAttribute("countrys", countryService.findAllCountrys());
        uiModel.addAttribute("regiontypes", regiontypeService.findAllRegiontypes());
    }
    
    String RegionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
