package bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class LikedVideo {
	@Id
	String id;
	String title;
	String poster;
	Long views;
	Date likedDate;
	public LikedVideo(String id, String title, String poster, Long views, Date likedDate) {
		super();
		this.id = id;
		this.title = title;
		this.poster = poster;
		this.views = views;
		this.likedDate = likedDate;
	}
	public LikedVideo() {
		super();
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
	public Long getViews() {
		return views;
	}
	public void setViews(Long views) {
		this.views = views;
	}
	public Date getLikedDate() {
		return likedDate;
	}
	public void setLikedDate(Date likedDate) {
		this.likedDate = likedDate;
	}
	
	
}
