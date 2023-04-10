package bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="Share", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"UserID","VideoID"})
})
public class Share {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	@ManyToOne @JoinColumn(name="UserID")
	User user;
	@ManyToOne @JoinColumn(name="VideoID")
	Video video;
	String emails;
	Date share= new Date();
	public Share(Long id, User user, Video video, String emails, Date share) {
		super();
		this.id = id;
		this.user = user;
		this.video = video;
		this.emails = emails;
		this.share = share;
	}
	public Share() {
		super();
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
	public String getEmails() {
		return emails;
	}
	public void setEmails(String emails) {
		this.emails = emails;
	}
	public Date getShare() {
		return share;
	}
	public void setShare(Date share) {
		this.share = share;
	}
	
}
