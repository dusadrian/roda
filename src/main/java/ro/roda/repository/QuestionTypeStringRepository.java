package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.QuestionTypeString;

@RepositoryRestResource
public interface QuestionTypeStringRepository extends PagingAndSortingRepository<QuestionTypeString, Integer> {

}