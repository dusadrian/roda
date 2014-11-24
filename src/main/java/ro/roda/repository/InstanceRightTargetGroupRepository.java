package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.InstanceRightTargetGroup;

@RepositoryRestResource
public interface InstanceRightTargetGroupRepository extends PagingAndSortingRepository<InstanceRightTargetGroup, Integer> {

}