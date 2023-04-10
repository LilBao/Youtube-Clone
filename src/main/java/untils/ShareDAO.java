package untils;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import bean.Share;

public class ShareDAO {
	EntityManager em = JpaUntils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	public Share create(Share entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public List<Share> reportShare(String id) {
		String jpql = "select o.user.fullname, o.user.id, o.emails, o.share from Share o where o.video.id=id";
		TypedQuery<Share> query = em.createQuery(jpql,Share.class);
		List<Share> list = query.getResultList();
		return list;
	}
}
