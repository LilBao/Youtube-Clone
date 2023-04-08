package untils;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import bean.User;

public class UserDAO {
	EntityManager em = JpaUntils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	public User create(User entity) {
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

	public User update(User entity) {
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
	public User delete(String key) {
		try {
			User entity=this.findByMainKey(key);
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public User findByMainKey(String key) {
		User entity = em.find(User.class,key);
		return entity;
	}
	public List<User> findAll(){
		String jpql="Select o from User o";
		TypedQuery<User> query=em.createQuery(jpql,User.class);
		List<User> list = query.getResultList();
		return list;
	}

	public List<User> FavoriteUsers(String title){
		String jpql="Select o.user.id,o.user.fullname, o.user.email ,o.likeDate from Favorite o where o.video.title= :title";
		TypedQuery<User> query = em.createQuery(jpql,User.class);
		query.setParameter("title", title);
		List<User> list = query.getResultList();
		return list;


	}
}
