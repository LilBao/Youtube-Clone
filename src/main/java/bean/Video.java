package bean;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name="Videos")
public class Video {
	@Id
	private String id;
	private String title;
	private String poster;
	private String description;
	private boolean active;
	private long views;
	@OneToMany(mappedBy="video")
	List<Favorite> favorite;


	public Video() {
		super();
	}


	public Video(String id, String title, String poster, String description, boolean active, long views,
			List<Favorite> favorite) {
		super();
		this.id = id;
		this.title = title;
		this.poster = poster;
		this.description = description;
		this.active = active;
		this.views = views;
		this.favorite = favorite;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPoster() {
		return poster;
	}


	public void setPoster(String poster) {
		this.poster = poster;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public long getViews() {
		return views;
	}


	public void setViews(long views) {
		this.views = views;
	}


	public List<Favorite> getFavorite() {
		return favorite;
	}


	public void setFavorite(List<Favorite> favorite) {
		this.favorite = favorite;
	}


}
