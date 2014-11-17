package ro.roda.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import ro.roda.domain.Question;

@RepositoryRestResource
public interface QuestionRepository extends PagingAndSortingRepository<Question, Integer> {

}