package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.cfranc.UserManager.ConvertAdressCoord;
import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Preferences;
import com.cfranc.UserManger.model.Utilisateur;

public class UserDAO {

	@PersistenceContext
	private static EntityManager em;
	private static UserDAO instance=null;

	private UserDAO(EntityManager em) {
		super();
		UserDAO.em = em;
	}


	public static UserDAO getInstance() {
		if (instance == null) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("CovoitMania");
			em = factory.createEntityManager();
			instance = new UserDAO(em);
		}
		return instance;
	}

//	public static List<Utilisateur> findAll() {
//		Query q = em.createQuery("SELECT t FROM Utilisateur t");
//		List<Utilisateur> listeUtilisateur = q.getResultList();
//	
//		return listeUtilisateur;
//	}
	

	public static ListeUtilisateur findAll2() {
		ListeUtilisateur users = new ListeUtilisateur();
		Query q = em.createQuery("SELECT t FROM Utilisateur t");
		List<Utilisateur> listeUtilisateur = q.getResultList();
		for(Utilisateur user : listeUtilisateur){
			users.put(user.getId(), user);
		}
		return users;
	}
	
//	public static Utilisateur getUtilisateur(long id){
//		Query q = em.createQuery("SELECT t FROM Utilisateur t WHERE ID =" + id);
//		Utilisateur user = (Utilisateur) q.getSingleResult();
//		return user;
//	}
	

	public static ListeUtilisateur getStaticUsers() {


		
		
		Preferences preference = new Preferences("non", "non", "non", "pas du tout", 0);
		Preferences preference2 = new Preferences("oui", "oui", "oui", "beaucoup", 2);
		
		UserDAO.getInstance();

		
		em.getTransaction().begin();
		Utilisateur bobby = new Utilisateur();
		bobby.setFirstname("Bobby");
		bobby.setLastname("Johnson");
		bobby.setAge(36);
		bobby.setEmail("robert@johnson.name");
		bobby.setPassword("mdp");
		bobby.setAddress("10 rue des bouchers");
		bobby.setPostCode(67000);
		bobby.setCity("Strasbourg");
		bobby.setCoord(ConvertAdressCoord.getCoordFromAdress(bobby.getAddress() + " " + bobby.getCity()));
		bobby.setPreferences(preference2);
		em.persist(bobby);
		em.getTransaction().commit();


		em.getTransaction().begin();
		Utilisateur johnny = new Utilisateur();
		johnny.setFirstname("Johnny");
		johnny.setLastname("Johnson");
		johnny.setAge(42);
		johnny.setEmail("johnny@johnson.name");
		johnny.setPassword("mdp");
		johnny.setAddress("20 rue des bouchers");
		johnny.setPostCode(67000);
		johnny.setCity("Strasbourg");
		johnny.setCoord(ConvertAdressCoord.getCoordFromAdress(johnny.getAddress() + " " + johnny.getCity()));
		johnny.setPreferences(preference);
		em.persist(johnny);
		em.getTransaction().commit();


		em.getTransaction().begin();
		Utilisateur steve = new Utilisateur();
		steve.setFirstname("Steve");
		steve.setLastname("Johnson");
		steve.setAge(47);
		steve.setEmail("steve@johnson.name");
		steve.setPassword("mdp");
		steve.setAddress("30 rue des bouchers");
		steve.setPostCode(67000);
		steve.setCity("Strasbourg");
		steve.setCoord(ConvertAdressCoord.getCoordFromAdress(steve.getAddress() + " " + steve.getCity()));
		steve.setPreferences(preference2);
		em.persist(steve);
		em.getTransaction().commit();


		em.getTransaction().begin();
		Utilisateur bill = new Utilisateur();
		bill.setFirstname("Bill");
		bill.setLastname("Johnson");
		bill.setAge(59);
		bill.setEmail("bill@johnson.name");
		bill.setPassword("mdp");
		bill.setAddress("35 rue des bouchers");
		bill.setPostCode(67000);
		bill.setCity("Strasbourg");
		bill.setCoord(ConvertAdressCoord.getCoordFromAdress(bill.getAddress() + " " + bill.getCity()));
		bill.setPreferences(preference);
		em.persist(bill);
		em.getTransaction().commit();

		em.getTransaction().begin();
		Utilisateur jago = new Utilisateur();
		jago.setFirstname("jago");
		jago.setLastname("Johnson");
		jago.setAge(59);
		jago.setEmail("jago@johnson.name");
		jago.setPassword("mdp");
		jago.setAddress("rue de Grenoble");
		jago.setPostCode(67000);
		jago.setCity("Strasbourg");
		jago.setCoord(ConvertAdressCoord.getCoordFromAdress(jago.getAddress() + " " + jago.getCity()));
		jago.setPreferences(preference);
		em.persist(jago);
		em.getTransaction().commit();

		em.getTransaction().begin();
		Utilisateur jacky = new Utilisateur();
		jacky.setFirstname("jacky");
		jacky.setLastname("Johnson");
		jacky.setAge(59);
		jacky.setEmail("jackyl@johnson.name");
		jacky.setPassword("mdp");
		jacky.setAddress("rue de Hagenau");
		jacky.setPostCode(67000);
		jacky.setCity("Strasbourg");
		jacky.setCoord(ConvertAdressCoord.getCoordFromAdress(jacky.getAddress() + " " + jacky.getCity()));
		jacky.setPreferences(preference);
		em.persist(jacky);
		em.getTransaction().commit();


		ListeUtilisateur users = UserDAO.findAll2();

		return users;
	}


	public static Utilisateur addUser(Utilisateur user) {
		
		UserDAO.getInstance();
		Preferences preference = new Preferences("non", "non", "non", "pas du tout", 0);
		em.getTransaction().begin();
		user.setPreferences(preference);
		
		em.persist(user);
		em.getTransaction().commit();

		return user;
	}

	public static Utilisateur editUser(Utilisateur user) {
		UserDAO.getInstance();
		em.getTransaction().begin();
		em.merge(user);
		em.getTransaction().commit();

		return user;

	}

	public static Utilisateur editPassword(Utilisateur user) {

		UserDAO.getInstance();
		em.getTransaction().begin();
		em.merge(user);
		em.getTransaction().commit();
		return user;

	}

	public static Utilisateur editPreferences(Utilisateur user) {

		UserDAO.getInstance();
		em.getTransaction().begin();
		em.merge(user);
		em.getTransaction().commit();
		return user;
	}


	

}