package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.InstanceRight;

@RepositoryRestResource
public interface InstanceRightRepository extends PagingAndSortingRepository<InstanceRight, Integer> {

}