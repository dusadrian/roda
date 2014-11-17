package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.File;

@RepositoryRestResource
public interface FileRepository extends PagingAndSortingRepository<File, Integer> {

}