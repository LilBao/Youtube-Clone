package untils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUntils {
	private static EntityManagerFactory factory;
	public static EntityManager getEntityManager() {
		if(factory==null || !factory.isOpen()) {
			factory=Persistence.createEntityManagerFactory("PolyOE");
		}
		return factory.createEntityManager();
	}
	static void shutdown() {
		if(factory!=null && factory.isOpen()) {
			factory.close();
		}
		factory=null;
	}
}
