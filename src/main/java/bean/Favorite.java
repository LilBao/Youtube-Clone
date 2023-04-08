package bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
@NamedStoredProcedureQueries({
	@NamedStoredProcedureQuery(name = "Favorite.favoriteUser", procedureName = "sp_FavoritesUser", parameters = {
			@StoredProcedureParameter(name = "Id", type = String.class) }, resultClasses = { Favorite.class }),
	
})
@Entity
@Table(name="Favorites", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"UserID","VideoID"})
})
public class Favorite {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne @JoinColumn(name="UserID")
	User user;
	@ManyToOne @JoinColumn(name="VideoID")
	Video video;
	Date likeDate= new Date();

	public Favorite() {
		super();
	}

	public Favorite(Long id, User user, Video video, Date likeDate) {
		super();
		this.id = id;
		this.user = user;
		this.video = video;
		this.likeDate = likeDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

}
