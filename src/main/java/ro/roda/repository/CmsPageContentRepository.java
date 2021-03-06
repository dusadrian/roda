package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.CmsPageContent;

@RepositoryRestResource
public interface CmsPageContentRepository extends PagingAndSortingRepository<CmsPageContent, Integer> {

}