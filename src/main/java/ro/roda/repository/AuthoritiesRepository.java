package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.Authorities;

@RepositoryRestResource
public interface AuthoritiesRepository extends PagingAndSortingRepository<Authorities, Integer> {

}