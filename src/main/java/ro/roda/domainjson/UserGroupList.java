package ro.roda.domainjson;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Configurable;

import ro.roda.domain.UserGroup;
import flexjson.JSONSerializer;

@Configurable
public class UserGroupList extends JsonInfo {

	public static String toJsonArr(Collection<UserGroupList> collection) {
		JSONSerializer serializer = new JSONSerializer();

		serializer.exclude("*.class", "type");
		serializer.include("id", "name", "description", "enabled", "nrusers");

		return "{\"data\":" + serializer.serialize(collection) + "}";
	}

	public static List<UserGroupList> findAllUserGroupLists() {
		List<UserGroupList> result = new ArrayList<UserGroupList>();

		List<UserGroup> userGroups = UserGroup.findAllUserGroups();

		if (userGroups != null && userGroups.size() > 0) {

			Iterator<UserGroup> userGroupsIterator = userGroups.iterator();
			while (userGroupsIterator.hasNext()) {
				UserGroup userGroup = (UserGroup) userGroupsIterator.next();
				result.add(new UserGroupList(userGroup));
			}
		}

		return result;
	}

	public static UserGroupList findUserGroupInfo(Integer id) {
		UserGroup userGroup = UserGroup.findUserGroup(id);

		if (userGroup != null) {
			return new UserGroupList(userGroup);
		}
		return null;
	}

	private String description;

	private Integer nrusers;

	private boolean enabled;

	public UserGroupList(Integer id, String name, String description, boolean enabled, Integer nrusers) {
		super(id, name);
		this.description = description;
		this.enabled = enabled;
		this.nrusers = nrusers;
	}

	public UserGroupList(UserGroup userGroup) {
		this(userGroup.getId(), userGroup.getGroupname(), userGroup.getDescription(), userGroup.isEnabled(), userGroup
				.getAuthorities() != null ? userGroup.getAuthorities().size() : 0);
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getDescription() {
		return description;
	}

	public Integer getNrusers() {
		return nrusers;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setNrusers(Integer nrusers) {
		this.nrusers = nrusers;
	}

	public String toJson() {
		JSONSerializer serializer = new JSONSerializer();

		serializer.exclude("*.class", "type");
		serializer.include("id", "name", "description", "enabled", "nrusers");

		return "{\"data\":" + serializer.serialize(this) + "}";
	}

}
