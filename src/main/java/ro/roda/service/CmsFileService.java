package ro.roda.service;

import java.util.List;

import ro.roda.domain.CmsFile;

public interface CmsFileService {

	public abstract long countAllCmsFiles();

	public abstract void deleteCmsFile(CmsFile cmsFile);

	public abstract CmsFile findCmsFile(Integer id);

	public abstract CmsFile findCmsFile(String alias);

	public abstract List<CmsFile> findAllCmsFiles();

	public abstract List<CmsFile> findCmsFileEntries(int firstResult, int maxResults);

	public abstract void saveCmsFile(CmsFile cmsFile);

	public abstract CmsFile updateCmsFile(CmsFile cmsFile);

}
