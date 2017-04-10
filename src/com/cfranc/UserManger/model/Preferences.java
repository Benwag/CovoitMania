package com.cfranc.UserManger.model;

import java.io.Serializable;

public class Preferences implements Serializable {


	private static final long serialVersionUID = 1L;
	
	
	private String conducteur;
	private String music;
	private String fumeur;
	private String blabla;
	
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

	private long detour;
	

}
