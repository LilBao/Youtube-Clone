package untils;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import bean.LikedVideo;


public class likedVideoDAO {
	EntityManager em = JpaUntils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	public List<LikedVideo> likedVideo(String id){
		String jpql="select new LikedVideo(o.video.id,o.video.title,o.video.poster, o.video.views, o.likeDate) from Favorite o where o.user.id =:id and o.video.active=1";
		TypedQuery<LikedVideo> query = em.createQuery(jpql,LikedVideo.class);
		query.setParameter("id", id);
		List<LikedVideo> list =query.getResultList();
		return list;
	}
}
