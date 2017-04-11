package com.cfranc.UserManger.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigInteger;

/**
 * The persistent class for the utilisateur database table.
 * 
 */
@Entity
@NamedQuery(name = "Utilisateur.findAll", query = "SELECT u FROM Utilisateur u")
public class Utilisateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	

	private String firstname;

	private String lastname;

	private int age;

	private String email;

	private String address;

	private int postCode;

	private String city;

	private double[] coord;

	private String password;

	private BigInteger score;

	@OneToOne
	private Preferences preference;

	public Utilisateur() {
	}

	public long getId() {
		return this.id;
	}


	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public double[] getCoord() {
		return this.coord;
	}

	public void setCoord(double[] ds) {
		this.coord = ds;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPostCode() {
		return this.postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public BigInteger getScore() {
		return this.score;
	}

	public void setScore(BigInteger score) {
		this.score = score;
	}

	public Preferences getPreferences() {
		return this.preference;
	}

	public void setPreferences(Preferences preference) {
		this.preference = preference;
	}

}