package com.cfranc.UserManger.model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Preferences implements Serializable {


	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long prefid;

	
	private String conducteur;
	private String music;
	private String fumeur;
	private String blabla;
	private long detour;
	
	public String getConducteur() {
		return conducteur;
	}
	public void setConducteur(String conducteur) {
		this.conducteur = conducteur;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getFumeur() {
		return fumeur;
	}
	public void setFumeur(String fumeur) {
		this.fumeur = fumeur;
	}
	public String getBlabla() {
		return blabla;
	}
	public void setBlabla(String blabla) {
		this.blabla = blabla;
	}
	public long getDetour() {
		return detour;
	}
	public void setDetour(long detour) {
		this.detour = detour;
	}

	public Preferences (){
		super();
	}
	
	public Preferences (String conducteur, String music, String fumeur, String blabla, long detour){
		super();
		this.conducteur = conducteur;
		this.music = music;
		this.fumeur = fumeur;
		this.blabla = blabla;
		this.detour = detour;
	}
	
	

}
