package untils;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import bean.Report;

public class ReportDAO {
	EntityManager em = JpaUntils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	public List<Report> report(){
		String jpql="Select new Report(o.video.title,count(o), max(o.likeDate), min(o.likeDate)) from Favorite o group by o.video.title";
		TypedQuery<Report> query = em.createQuery(jpql,Report.class);
		List<Report> list =query.getResultList();
		return list;
	}
	public List<Object[]> favoriteUser(String id){
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.favoritesUser");
		query.setParameter("id",id);
		List<Object[]> list = query.getResultList();	
		return list;
	}
}
