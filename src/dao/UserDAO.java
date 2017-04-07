package dao;

import java.util.Collection;

import com.cfranc.UserManager.ConvertAdressCoord;
import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Utilisateur;

public class UserDAO {

	static ListeUtilisateur users = null;

	public static ListeUtilisateur getStaticUsers() {

		if (users == null) {
			users = new ListeUtilisateur();
			Utilisateur bobby = new Utilisateur();
			bobby.setId(1);
			bobby.setFirstname("Bobby");
			bobby.setLastname("Johnson");
			bobby.setAge(36);
			bobby.setEmail("robert@johnson.name");
			bobby.setPassword("mdp");
			bobby.setAddress("5 rue des bouchers");
			bobby.setCity("Strasbourg");
			bobby.setCoord(ConvertAdressCoord.getCoordFromAdress(bobby.getAddress() + " " + bobby.getCity()));
			users.put(bobby.getId(), bobby);

			Utilisateur johnny = new Utilisateur();
			johnny.setId(2);
			johnny.setFirstname("Johnny");
			johnny.setLastname("Johnson");
			johnny.setAge(42);
			johnny.setEmail("johnny@johnson.name");
			johnny.setPassword("mdp");
			johnny.setAddress("5 rue des bouchers");
			johnny.setCity("Strasbourg");
			johnny.setCoord(ConvertAdressCoord.getCoordFromAdress(johnny.getAddress() + " " + johnny.getCity()));

			users.put(johnny.getId(), johnny);

			Utilisateur steve = new Utilisateur();
			steve.setId(3);
			steve.setFirstname("Steve");
			steve.setLastname("Johnson");
			steve.setAge(47);
			steve.setEmail("steve@johnson.name");
			steve.setPassword("mdp");
			steve.setAddress("5 rue des bouchers");
			steve.setCity("Strasbourg");
			steve.setCoord(ConvertAdressCoord.getCoordFromAdress(steve.getAddress() + " " + steve.getCity()));

			users.put(steve.getId(), steve);

			Utilisateur bill = new Utilisateur();
			bill.setId(4);
			bill.setFirstname("Bill");
			bill.setLastname("Johnson");
			bill.setAge(59);
			bill.setEmail("bill@johnson.name");
			bill.setPassword("mdp");
			bill.setAddress("5 rue des bouchers");
			bill.setCity("Strasbourg");
			bill.setCoord(ConvertAdressCoord.getCoordFromAdress(bill.getAddress() + " " + bill.getCity()));

			users.put(bill.getId(), bill);

			System.out.print(users.nextId());

		}
		return users;

	}

	public static Utilisateur addUser(String firstname, String lastname, int age, String email, String address,
			String city, int postalCode, String password) {

		Utilisateur user = new Utilisateur();
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setAge(age);
		user.setEmail(email);
		user.setAddress(address);
		user.setCity(city);
		user.setId(users.nextId());
		user.setPassword(password);
		user.setPostCode(postalCode);
		user.setCoord(ConvertAdressCoord.getCoordFromAdress(address + " " + city));
		users.put(user.getId(), user);
		return user;
	}

//	public static boolean isEmailNotUsed(String email){
//		Collection<Utilisateur> userList = users.values();
//		boolean isEmailGood = true;
//		for (Utilisateur utilisateur : userList) {
//
//			if (email.equals(utilisateur.getEmail())) {
//				isEmailGood = false;
//				return isEmailGood;
//				
//			}
//		} if (isEmailGood){
//			return true;
//		}
//	}
	
	
	
}