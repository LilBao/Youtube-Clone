package untils;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import bean.Favorite;
import bean.User;


public class FavoriteDAO {
	EntityManager em = JpaUntils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	public Favorite create(Favorite entity) {
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
	public Favorite delete(String id,String key) {
		try {
			Favorite entity=this.findByMainKey(id,key);
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public Favorite findByMainKey(String id,String key) {
		String jpql = "Select o from Favorite o where o.video.id=:key and o.user.id=:id";
		TypedQuery<Favorite> query = em.createQuery(jpql,Favorite.class);
		query.setParameter("key", key);
		query.setParameter("id", id);
		try {
			Favorite entity = query.getSingleResult();
			return entity;
		} catch (NoResultException ex) {
		    return null;
		}
	}
}
