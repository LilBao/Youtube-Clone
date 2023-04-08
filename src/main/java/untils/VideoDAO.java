package untils;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import bean.Video;
public class VideoDAO {
	EntityManager em = JpaUntils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		em.close();
		super.finalize();
	}
	public Video create(Video entity) {
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

	public Video delete(String key) {
		try {
			Video entity=this.findByMainKey(key);
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public Video update(Video entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public Video findByMainKey(String key) {
		Video entity = em.find(Video.class,key);
		return entity;
	}

	public List<Video> findAll(){
		String jpql ="Select o from Video o";
		TypedQuery<Video> query = em.createQuery(jpql,Video.class);
		List<Video> list = query.getResultList();
		return list;
	}
	
	public List<Video> orderByViews(){
		try {
			em.getTransaction().begin();
			String jpql = "select o from Video o where o.active=true order by o.views desc";
			TypedQuery<Video> query= em.createQuery(jpql, Video.class);
			List<Video> list = query.getResultList();
			em.getTransaction().commit();
			return list;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public List<Video> randomVideo(){
		try {
			em.getTransaction().begin();
			String jpql = "select o from Video o where o.active=true order by newid()";
			TypedQuery<Video> query= em.createQuery(jpql, Video.class);
			List<Video> list = query.getResultList();
			em.getTransaction().commit();
			return list;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	
	
}
