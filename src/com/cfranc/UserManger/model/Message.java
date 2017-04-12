package com.cfranc.UserManger.model;

import java.io.Serializable;

public class Message implements Serializable {
	private long id;

	private String expediteurID;
	private String destinataireID;
	private String messageContent;
	private String expediteurFirstname;
	private String destinataireFirstname;

	public String getExpediteurFirstname() {
		return expediteurFirstname;
	}

	public void setExpediteurFirstname(String expediteurFirstname) {
		this.expediteurFirstname = expediteurFirstname;
	}

	public String getDestinataireFirstname() {
		return destinataireFirstname;
	}

	public void setDestinataireFirstname(String destinataireFirstname) {
		this.destinataireFirstname = destinataireFirstname;
	}

	public Message() {
	}

	public Message(String expediteur, String destinataire, String messageContent, String exp, String dest, long id) {
		this.expediteurID = expediteur;
		this.destinataireID = destinataire;
		this.messageContent = messageContent;
		this.expediteurFirstname=exp;
		this.destinataireFirstname=dest;
		this.id = id;
	}

	public String getExpediteurID() {
		return expediteurID;
	}

	public void setExpediteurID(String expediteur) {
		this.expediteurID = expediteur;
	}

	public String getDestinataireID() {
		return destinataireID;
	}

	public void setDestinataireID(String destinataire) {
		this.destinataireID = destinataire;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String message) {
		this.messageContent = message;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
