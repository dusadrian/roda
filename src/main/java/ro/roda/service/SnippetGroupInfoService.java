package ro.roda.service;

import java.util.List;

import ro.roda.transformer.SnippetGroupInfo;

public interface SnippetGroupInfoService {

	public abstract List<SnippetGroupInfo> findAllSnippetGroupInfos();

	public abstract SnippetGroupInfo findSnippetGroupInfo(Integer id);

}
