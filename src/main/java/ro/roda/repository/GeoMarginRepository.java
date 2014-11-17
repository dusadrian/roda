package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.GeoMargin;

@RepositoryRestResource
public interface GeoMarginRepository extends PagingAndSortingRepository<GeoMargin, Integer> {

}