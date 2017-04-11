package dao;

import java.util.Collection;

import com.cfranc.UserManager.ConvertAdressCoord;
import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Preferences;
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
			bobby.setAddress("10 rue des bouchers");
			bobby.setPostCode(67000);
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
			johnny.setAddress("20 rue des bouchers");
			johnny.setPostCode(67000);
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
			steve.setAddress("30 rue des bouchers");
			steve.setPostCode(67000);
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
			bill.setAddress("35 rue des bouchers");
			bill.setPostCode(67000);
			bill.setCity("Strasbourg");
			bill.setCoord(ConvertAdressCoord.getCoordFromAdress(bill.getAddress() + " " + bill.getCity()));

			users.put(bill.getId(), bill);
			
			Utilisateur jago = new Utilisateur();
			jago.setId(5);
			jago.setFirstname("jago");
			jago.setLastname("Johnson");
			jago.setAge(59);
			jago.setEmail("jago@johnson.name");
			jago.setPassword("mdp");
			jago.setAddress("rue de Grenoble");
			jago.setPostCode(67000);
			jago.setCity("Strasbourg");
			jago.setCoord(ConvertAdressCoord.getCoordFromAdress(jago.getAddress() + " " + jago.getCity()));

			users.put(jago.getId(), jago);
			
			Utilisateur jacky = new Utilisateur();
			jacky.setId(6);
			jacky.setFirstname("jacky");
			jacky.setLastname("Johnson");
			jacky.setAge(59);
			jacky.setEmail("jackyl@johnson.name");
			jacky.setPassword("mdp");
			jacky.setAddress("rue de Hagenau");
			jacky.setPostCode(67000);
			jacky.setCity("Strasbourg");
			jacky.setCoord(ConvertAdressCoord.getCoordFromAdress(jacky.getAddress() + " " + jacky.getCity()));

			users.put(jacky.getId(), jacky);

			System.out.print(users.nextId());

		}
		return users;

	}

	public static Utilisateur addUser(String firstname, String lastname, int age, String email, String address,

			String city, int postalCode, String password, long id) {

		Utilisateur user = new Utilisateur();
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setAge(age);
		user.setEmail(email);
		user.setAddress(address);
		user.setCity(city);
		user.setPassword(password);
		user.setPostCode(postalCode);
		user.setCoord(ConvertAdressCoord.getCoordFromAdress(address + " " + city));
		user.setId(id);
		users.put(user.getId(), user);
		return user;
	}

	public static Utilisateur editUser(long userId, String firstname, String lastname, String ageString, String email,
			String address, String postalCodeString, String city) {
		Utilisateur user = users.get(userId);

		if (firstname != "") {
			user.setFirstname(firstname);
		}
		if (lastname != "") {
			user.setLastname(lastname);
		}
		if (ageString != "") {
			int age = Integer.parseInt(ageString);
			user.setAge(age);
		}
		if (email != "") {
			user.setEmail(email);
		}
		if (address != "") {
			user.setAddress(address);
		}
		if (postalCodeString != "") {
			int postalCode = Integer.parseInt(postalCodeString);
			user.setPostCode(postalCode);
		}
		if (city != "") {
			user.setCity(city);
		}

		if (address != "" || city != "") {
			user.setCoord(ConvertAdressCoord.getCoordFromAdress(address + " " + city));
		}

		return user;

	}

	public static Utilisateur editPassword(long userId, String previousPassword, String newPassword) {
		Utilisateur user = users.get(userId);

		user.setPassword(newPassword);
		return user;

	}

	public static Utilisateur editPreferences(long userId, String conducteur, String music, String fumeur,
			String blabla, String detourString) {
		Utilisateur user = users.get(userId);

		Preferences preference = new Preferences();

		if ("oui".equals(conducteur)) {
			preference.setConducteur("oui");
		} else if ("non".equals(conducteur)) {
			preference.setConducteur("non");
		}
		preference.setConducteur(conducteur);

		if ("oui".equals(music)) {
			preference.setMusic("oui");
		} else if ("non".equals(music)) {
			preference.setMusic("non");
		}

		if ("oui".equals(fumeur)) {
			preference.setFumeur("oui");
		} else if ("non".equals(fumeur)) {
			preference.setFumeur("non");
		}

		if ("oui".equals(blabla)) {
			preference.setBlabla("beaucoup");
		} else if ("non".equals(blabla)) {
			preference.setBlabla("pas du tout");
		}

		long detour = Long.parseLong(detourString);
		preference.setDetour(detour);

		user.setPreference(preference);
		return user;
	}

}